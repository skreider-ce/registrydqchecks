#' @export
#' 
#' @importFrom glue glue
submitToDataStore <- function(.registry,.dsPullDate,.dataStoreUrl,.resultsOfChecks){

  staticDataStoreUrl <- .dataStoreUrl

  # Create the folder if it does not exist
  if(!dir.exists(glue::glue("{.dataStoreUrl}/checks"))){
    createDataStoreFolder(glue::glue("{.dataStoreUrl}/checks"))  
  }
  
  timestamp <- format(Sys.time(), "%H-%M-%S")

  # Assign the dataset name to store
  .resultsCheckName <- glue::glue("{.dsPullDate}_{gsub('[^A-Za-z0-9_]', '_', timestamp)}_checks")
  # .resultsCheckName <- glue::glue("{.dsPullDate}_checks")
  
  # Save the results

  saveRDS(.resultsOfChecks,glue::glue("{.dataStoreUrl}/checks/{.resultsCheckName}.rds"))
}
