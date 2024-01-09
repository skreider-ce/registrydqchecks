source("./R/03_checkDataStore/01_createDataStoreFolder.R")

staticDataStoreUrl <- glue("C:/Users/ScottKreider/Documents/registryCheckStorage")

# Prerequisites
#     A [list] of check results exists
#     A [text URL] is available to store the data
#
# GIVEN a [list] of results from data checks
#   AND GIVEN a [text URL] of where to store the data
#   THEN store the results in the specified location

# Submit results of checks to a data storage location
#   FUNCTION: submitToDataStore(.resultsOfChecks)
#
#   Input: .resultsOfChecks [list] = results of the data checks to be stored
#
#   Returns: n/a
#
#   TO DO:
#       1) [what needs done]
#

submitToDataStore <- function(.registry,.dsYear,.dsPullDate,.resultsOfChecks){

  # Define the urls to the folders
  .registryStoreUrl <- glue("{staticDataStoreUrl}/{.registry}")
  .yearStoreUrl <- glue("{.registryStoreUrl}/{.dsYear}")
  .pullDateStoreUrl <- glue("{.yearStoreUrl}/{.dsPullDate}")
  
  # Create the folder if it does not exist
  createDataStoreFolder(.pullDateStoreUrl)

  # Assign the dataset name to store
  .resultsCheckName <- "checks"
  
  # Save the results
  saveRDS(.resultsOfChecks,glue("{.pullDateStoreUrl}/{.resultsCheckName}.rds"))

}
