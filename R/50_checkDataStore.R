#' (internal function) Submit the results of the data quality checks to a set location
#'
#' @param .registry A text string with the initials of the registry (e.g. "ad", "pso", "ms")
#' @param .dsPullDate A date string of the data pull date in YYYY-MM-DD format (e.g. "2024-01-10")
#' @param .dataStoreUrl A text url of the location where the check results will be stored
#' @param .resultsOfChecks A list with the results of the data checks
#'
#' @export
#' 
#' @importFrom glue glue
submitToDataStore <- function(.registry,.dsPullDate,.dataStoreUrl,.resultsOfChecks){

  staticDataStoreUrl <- .dataStoreUrl

  # Create the folder if it does not exist
  createDataStoreFolder(glue::glue("{.dataStoreUrl}/checks"))
  createDataStoreFolder(glue::glue("{.dataStoreUrl}/checks/listing"))
  createDataStoreFolder(glue::glue("{.dataStoreUrl}/checks/summary"))

  .timestamp <- format(Sys.time(), "%Y-%m-%d-%H-%M-%S")

  # Assign the dataset name to store
  .resultsCheckName <- glue::glue("{.dsPullDate}_{gsub('[^A-Za-z0-9_]', '_', .timestamp)}_checks")

  .runnerSummary <- list(
    "registry" = .registry
    ,"timestamp" = .timestamp
    ,"user" = Sys.info()[["user"]]
    ,"folderLoc" = .dataStoreUrl
    ,"pullDate" = .dsPullDate
  )
  
  # Save the results
  saveRDS(.runnerSummary,glue::glue("{.dataStoreUrl}/checks/summary/runnerSummary_{.timestamp}.rds"))
  outputListings(glue::glue("{.dataStoreUrl}/checks/listing"),.timestamp,.resultsOfChecks)
  saveRDS(.resultsOfChecks,glue::glue("{.dataStoreUrl}/checks/{.resultsCheckName}.rds"))
}
