#' (internal function) Submit the results of the data quality checks to a set location
#'
#' @param .registry A text string with the initials of the registry (e.g. "ad", "pso", "ms")
#' @param .dsPullDate A date string of the data pull date in YYYY-MM-DD format (e.g. "2024-01-10")
#' @param .dataStoreUrl A text url of the location where the check results will be stored
#' @param .resultsOfChecks A list with the results of the data checks
#' @param .timestamp Timestamp that the checks were run
#'
#' @export
#' 
#' @importFrom glue glue
submitToDataStore <- function(.registry,.dsPullDate,.timestamp, .dataStoreUrl,.resultsOfChecks){

  staticDataStoreUrl <- .dataStoreUrl
  
  # Create the folder if it does not exist
  createDataStoreFolder(glue::glue("{.dataStoreUrl}{.timestamp}"))
  createDataStoreFolder(glue::glue("{.dataStoreUrl}{.timestamp}/checks"))
  createDataStoreFolder(glue::glue("{.dataStoreUrl}{.timestamp}/listing"))

  # Assign the dataset name to store
  .resultsCheckName <- glue::glue("{.dsPullDate}_{.timestamp}_checks")

  .runnerSummary <- list(
    "registry" = .registry
    ,"timestamp" = .timestamp
    ,"user" = Sys.info()[["user"]]
    ,"folderLoc" = .dataStoreUrl
    ,"pullDate" = .dsPullDate
  )
  
  .checkSummary <- generateCheckSummary(.resultsOfChecks)
  
  .outputToSave <- list(
    "runnerSummary" = .runnerSummary
    ,"checkSummary" = .checkSummary
    ,"criticalChecks" = .resultsOfChecks$criticalCheckOutput
    ,"nonCriticalChecks" = .resultsOfChecks$nonCriticalCheckOutput
  )
  
  # Save the results
  # saveRDS(.runnerSummary,glue::glue("{.dataStoreUrl}/checks/summary/runnerSummary_{gsub('[^A-Za-z0-9_]', '_', .timestamp)}.rds"))
  outputListings(
                  .listingUrl = glue::glue("{.dataStoreUrl}{.timestamp}/listing")
                  ,.timestamp = .timestamp
                  ,.checksToOutput = .outputToSave)
  saveRDS(.outputToSave,glue::glue("{.dataStoreUrl}{.timestamp}/checks/{.resultsCheckName}.rds"))
}
