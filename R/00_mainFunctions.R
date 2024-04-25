#' The main function call to run the CorEvitas Registry DQ Checks and the Report
#'
#' @param .registry A text string with the initials of the specific registry (e.g. "ad", "ms", "pso")
#' @param .prelimDataFolderUrl A url string to the folder with the preliminary datasets
#' @param .prelimDataPullDate A date string of the data pull date in the format YYYY-DD-MM (e.g. "2024-01-10")
#' @param .lastMonthDataFolderUrl A url string to the folder with the last month's datasets
#' @param .lastMonthDataPullDate A date string of last month's data pull date in the format YYYY-DD-MM (e.g. "2023-12-05")
#' @param .codebookUrl (optional) A url string to the registry-specific codebook (if left missing - critical checks 7 and 8 will not be run)
#' @param .datasetsToCheck A string vector with the names of the datasets to be checked (e.g. c("exvisit", "exlab", "exdrugexp")) - NOTE: These must perfectly match both the tab names in the codebook AND the names of the datasets being checked
#' @param .nonCriticalChecks A list of the manually generated non-critical checks in the CE DQ specified format (see additional documentation)
#' @param .outputUrl A url string to the location of the output datasets - NOTE: A subfolder will be created here called /checks that will house the results of the checks and will be the location called by the check report
#' @param .isR A boolean indicating if the datasets being checked are in R or Stata format (e.g. if R then .isR = TRUE; if Stata then .isR = FALSE)
#'
#' @export
#' 
#' @importFrom glue glue
#' @importFrom dplyr filter select
#' @importFrom registrydqchecksreportdown generateReport
runRegistryChecks <- function(.registry = "defaultRegistry"
                              ,.prelimDataFolderUrl
                              ,.prelimDataPullDate
                              ,.lastMonthDataFolderUrl
                              ,.lastMonthDataPullDate
                              ,.codebookUrl
                              ,.datasetsToCheck
                              ,.nonCriticalChecks = NULL
                              ,.outputUrl
                              ,.isR){
  
  ############################
  # Initialize variable lists to house information on specific datasets being checked
  .codebooks <- list()
  .dataToCheck <- list()
  .dataToCompare <- list()
  .essentialVariables <- list()
  .codebookVariables <- list()
  .uniqueKeys <- list()
  .critCheckOutput <- list()
  .codebookNcOutput <- list()
  .nonCritCheckOutput <- list()
  .ncChecks <- list()
  
  # Loop through each dataset and perform the checks
  for(.dsName in .datasetsToCheck){
    # Pull dataset specific codebook
    .codebooks[[.dsName]] <- pullCodebookFromExcelFile(.codebookUrl, .dsName)
    
    # Pull data to check and data from last month to compare it to
    .dataToCheck[[.dsName]] <- pullData(glue::glue("{.prelimDataFolderUrl}{.dsName}_{.prelimDataPullDate}"), .isR)
    .dataToCompare[[.dsName]] <- pullData(glue::glue("{.lastMonthDataFolderUrl}{.dsName}_{.lastMonthDataPullDate}"), .isR)
    
    # Pull the unique keys for the specific dataset from the codebook
    .uniqueKeys[[.dsName]] <- .codebooks[[.dsName]] |>
      dplyr::filter(uniqueKey == 1) |>
      dplyr::select(varName)
    
    # Pull the list of essential variables for the specific dataset from the codebook
    .essentialVariables[[.dsName]] <- .codebooks[[.dsName]] |>
      dplyr::filter(essential == 1) |>
      dplyr::select(varName, acceptableMissingness, nonExtremeMissingness, missingnessThresholdMultiplier, skipLogic)
    
    # Pull the codebook noncritical check variables for the specific dataset from the codebook
    .codebookVariables[[.dsName]] <- .codebooks[[.dsName]] |>
      dplyr::select(varName, essential, acceptableMissingness, missingnessThresholdMultiplier, skipLogic, catValues, numRange)
    
    # Run the critical checks on the specific dataset with information pulled from the codebook
    .critCheckOutput[[.dsName]] <- criticalChecks(.dsToCheck = data.frame(.dataToCheck[[.dsName]])
                                                  ,.compDsToCheck = data.frame(.dataToCompare[[.dsName]])
                                                  ,.listOfEssentialVars = .essentialVariables[[.dsName]]
                                                  ,.listOfSupposedVars = names(.dataToCompare[[.dsName]])
                                                  ,.uniqueKeys = .uniqueKeys[[.dsName]]$varName
                                                  )
    
    # Run the codebook noncritical checks on the specific dataset with information pulled from the codebook
    .codebookNcOutput[[.dsName]] <- codebookNcChecks(.dsName = .dsName
                                                     ,.dsToCheck = data.frame(.dataToCheck[[.dsName]])
                                                     ,.compDsToCheck = data.frame(.dataToCompare[[.dsName]])
                                                     ,.codebookVariables = .codebookVariables[[.dsName]]
                                                     ,.uniqueKeys = .uniqueKeys[[.dsName]]$varName
                                                     )
    
    # Add codebook noncritical checks to the noncritical check output
    # And add manual noncritical checks (if they exist) to the noncritical check output
    .ncChecks[[.dsName]][["codebookChecks"]] <- .codebookNcOutput[[.dsName]]
    
    # If no manual noncritical checks then skip
    # Else - append the results of the manual noncritical checks to the codebook noncritical checks
    if(!is.null(.nonCriticalChecks)){
      for(.checkName in names(.nonCriticalChecks[[.dsName]])){
        .ncChecks[[.dsName]][[.checkName]] <- .nonCriticalChecks[[.dsName]][[.checkName]]
      }
    }
  }

  
  # Create a list of the critical check and the noncritical check output to be saved to a location  
  .checkOutput <- list(
    "criticalCheckOutput" = .critCheckOutput
    ,"nonCriticalCheckOutput" = .ncChecks
  )
  
  # Define timestamp of this specific datapull
  .timestamp <- format(Sys.time(), "%Y-%m-%d-%H-%M-%S")
  .formattedTimestamp <- gsub('[^A-Za-z0-9_]', '_', .timestamp)
  
  # Submit check results to datastore - including a .rds and Excel files
  submitToDataStore(.registry = .registry
                    ,.dsPullDate = .prelimDataPullDate
                    ,.timestamp = .formattedTimestamp
                    ,.dataStoreUrl = .outputUrl
                    ,.resultsOfChecks = .checkOutput
                    )
  
  # Generate the html report
  registrydqchecksreportdown::generateReport(
    .inputDatasetUrl = glue::glue("{.outputUrl}{.formattedTimestamp}/checks/{.prelimDataPullDate}_{.formattedTimestamp}_checks.rds")
    ,.reportOutputUrl = glue::glue("{.outputUrl}{.formattedTimestamp}/")
    ,.fileName = glue::glue("{.prelimDataPullDate}_{.formattedTimestamp}_report")
  )
  
  return(TRUE)
}


#' copyDatasetsToLocation A function to copy the preliminary analytic datasets to a final output location with an option to remove the files from the original location
#'
#' @param .datasetsToCopy A character list of the dataset prefixes to copy from the original location to the final location
#' @param .folderToCopyTo Url of the folder to copy the datasets to
#' @param .remove (default = FALSE) an indicator whether to remove the files in the original location
#' @param .prelimDataFolderUrl A text URL to the location of the datasets to be copied over
#' @param .prelimDataPullDate The datapull date of the preliminary files to be copied - the date in the dataset name
#' @param .isR Boolean indicating if the dataset being copied is an R file (if TRUE then dataset is R, if FALSE then dataset is .dta)
#'
#' @export
copyDatasetsToLocation <- function(.datasetsToCopy
                                   ,.prelimDataFolderUrl
                                   ,.prelimDataPullDate
                                   ,.folderToCopyTo
                                   ,.isR
                                   ,.remove = FALSE){
  for(.dsName in .datasetsToCopy){
    if(.isR == TRUE){
      .dsToCopy = glue::glue("{.prelimDataFolderUrl}{.dsName}_{.prelimDataPullDate}.rds")
    } else if(.isR == FALSE){
      .dsToCopy = glue::glue("{.prelimDataFolderUrl}{.dsName}_{.prelimDataPullDate}.dta")
    }
    copyDataset(.dataSetToCopy = .dsToCopy
                ,.folderToCopyTo = .folderToCopyTo
                ,.remove = .remove)
  }
}



