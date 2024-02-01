#' The main function call to run the CorEvitas Registry DQ Checks and the Report
#'
#' @param .registry A text string with the initials of the specific registry (e.g. "ad", "ms", "pso")
#' @param .prelimDataFolderUrl A url string to the folder with the preliminary datasets
#' @param .prelimDataPullDate A date string of the data pull date in the format YYYY-DD-MM (e.g. "2024-01-10")
#' @param .lastMonthDataFolderUrl A url string to the folder with the last month's datasets
#' @param .lastMonthDataPullDate A date string of last month's data pull date in the format YYYY-DD-MM (e.g. "2023-12-05")
#' @param .codebookUrl A url string to the registry-specific codebook
#' @param .datasetsToCheck A string vector with the names of the datasets to be checked (e.g. c("exvisit", "exlab", "exdrugexp")) - NOTE: These must perfectly match both the tab names in the codebook AND the names of the datasets being checked
#' @param .outputUrl A url string to the location of the output datasets - NOTE: A subfolder will be created here called /checks that will house the results of the checks and will be the location called by the check report
#' @param .isR A boolean indicating if the datasets being checked are in R or Stata format (e.g. if R then .isR = TRUE; if Stata then .isR = FALSE)
#'
#' @export
#' 
#' @importFrom glue glue
#' @importFrom dplyr filter select
#' @importFrom registrydqchecksreport runApplication
runRegistryChecks <- function(.registry = "defaultRegistry"
                              ,.prelimDataFolderUrl
                              ,.prelimDataPullDate
                              ,.lastMonthDataFolderUrl
                              ,.lastMonthDataPullDate
                              ,.codebookUrl
                              ,.datasetsToCheck
                              ,.outputUrl
                              ,.isR){
  
  ############################
  .codebooks <- list()
  .dataToCheck <- list()
  .dataToCompare <- list()
  .essentialVariables <- list()
  .uniqueKeys <- list()
  .critCheckOutput <- list()
  
  for(.dsName in .datasetsToCheck){
    .codebooks[[.dsName]] <- pullCodebookFromExcelFile(.codebookUrl, .dsName)
    .dataToCheck[[.dsName]] <- pullData(glue::glue("{.prelimDataFolderUrl}/{.dsName}_{.prelimDataPullDate}"), .isR)
    .dataToCompare[[.dsName]] <- pullData(glue::glue("{.lastMonthDataFolderUrl}/{.dsName}_{.lastMonthDataPullDate}"), .isR)
    
    .uniqueKeys[[.dsName]] <- .codebooks[[.dsName]] |>
      dplyr::filter(uniqueKey == 1) |>
      dplyr::select(varName)
    
    .essentialVariables[[.dsName]] <- .codebooks[[.dsName]] |>
      dplyr::filter(essential == 1) |>
      dplyr::select(varName, acceptableMissingness, nonExtremeMissingness)
    
    .critCheckOutput[[.dsName]] <- criticalChecks(
      data.frame(.dataToCheck[[.dsName]])
      ,data.frame(.dataToCompare[[.dsName]])
      ,.essentialVariables[[.dsName]]$varName
      ,names(.dataToCompare[[.dsName]])
      ,.uniqueKeys[[.dsName]]$varName)
  }
  
  submitToDataStore(.registry,.prelimDataPullDate,.outputUrl,.critCheckOutput)
  
  registrydqchecksreport::runApplication(glue::glue("{.outputUrl}/checks"))
  
  return(.returnOutput)
}

