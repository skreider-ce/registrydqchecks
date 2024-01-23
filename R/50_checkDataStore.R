#' @export
#' 
#' @importFrom glue glue
submitToDataStore <- function(.registry,.dsYear,.dsPullDate,.resultsOfChecks){

  staticDataStoreUrl <- glue::glue("C:/Users/ScottKreider/Corrona LLC/Biostat and Epi Team Site - Registry Data QC Checks/registryCheckStorage")
  
  # Define the urls to the folders
  .registryStoreUrl <- glue::glue("{staticDataStoreUrl}/{.registry}")
  .yearStoreUrl <- glue::glue("{.registryStoreUrl}/{.dsYear}")
  .pullDateStoreUrl <- glue::glue("{.yearStoreUrl}/{.dsPullDate}")
  
  # Create the folder if it does not exist
  # createDataStoreFolder(.pullDateStoreUrl)

  # Assign the dataset name to store
  .resultsCheckName <- glue::glue("{.dsYear}_{.dsPullDate}_checks")
  
  # Save the results
  # saveRDS(.resultsOfChecks,glue("{.pullDateStoreUrl}/{.resultsCheckName}.rds"))
  
  saveRDS(.resultsOfChecks,glue::glue("{.registryStoreUrl}/{.resultsCheckName}.rds"))
}
