#' (internal function) Submit the results of the data quality checks to a set location
#'
#' @param .registry A text string with the initials of the registry (e.g. "ad", "pso", "ms")
#' @param .dsPullDate A date string of the data pull date in YYYY-MM-DD format (e.g. "2024-01-10")
#' @param .dataStoreUrl A text url of the location where the check results will be stored
#' @param .resultsOfChecks A list with the results of the data checks
#' @param .activeSites Information on the list of active sites for this registry
#' @param .timestamp Timestamp that the checks were run
#' @param .folderName Name for the folder where results will be output
#'
#' @export
#' 
#' @importFrom glue glue
submitToDataStore <- function(.registry,.dsPullDate,.timestamp, .folderName, .dataStoreUrl,.resultsOfChecks, .activeSites){

  staticDataStoreUrl <- .dataStoreUrl
  
  # Create the folders if they do not exist
  createDataStoreFolder(glue::glue("{.dataStoreUrl}{.folderName}"))
  createDataStoreFolder(glue::glue("{.dataStoreUrl}{.folderName}/checks"))
  createDataStoreFolder(glue::glue("{.dataStoreUrl}{.folderName}/listing"))

  # Assign the dataset name to store
  .resultsCheckName <- glue::glue("{.registry}_{.dsPullDate}_{.timestamp}_checks")

  # Generate runner summary information to output with the checks
  .runnerSummary <- list(
    "registry" = .registry
    ,"timestamp" = .timestamp
    ,"user" = Sys.info()[["user"]]
    ,"folderLoc" = .dataStoreUrl
    ,"pullDate" = .dsPullDate
  )
  
  # Generate a summary of the check results to output with the check results
  .checkSummary <- generateCheckSummary(.resultsOfChecks = .resultsOfChecks)
  
  # Structure the output to be saved
  .outputToSave <- list(
    "runnerSummary" = .runnerSummary
    ,"checkSummary" = .checkSummary
    ,"criticalChecks" = .resultsOfChecks$criticalCheckOutput
    ,"nonCriticalChecks" = .resultsOfChecks$nonCriticalCheckOutput
  )
  
  # Save the .rds with results of the checks
  saveRDS(.outputToSave,glue::glue("{.dataStoreUrl}{.folderName}/checks/{.resultsCheckName}.rds"))
  
  # Save the listings as Excel files
  outputListings(.registry = .registry
                  ,.listingUrl = glue::glue("{.dataStoreUrl}{.folderName}/listing")
                  ,.yearMonthTimestamp = format(as.Date(.dsPullDate), "%Y-%m")
                  ,.dataPullDate = .dsPullDate
                  ,.timestamp = .timestamp
                  ,.checksToOutput = .outputToSave
                  ,.activeSites = .activeSites
                 )
}
