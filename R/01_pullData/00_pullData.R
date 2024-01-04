source("./R/01_pullData/01_pullRDSfromUrl.R")
source("./R/01_pullData/02_pullDTAfromUrl.R")

# Given a direct link, in URL format, to the dataset you want to pull
#   AND Given an indication if the dataset is an R dataset or not
#   PULL the dataset from the given location
#   RETURN a [dataframe] of the dataset being pulled


# FUNCTION: Primary pullData() function that pulls the file from the specified URL
#
#   Input: The direct URL of the dataset to pull
#           .datasetUrl = URL to the Registry parent directory
#           .isR = boolean - TRUE if dataset being pulled is an RDS file (FALSE if a .dta)
#                   DEFAULT: TRUE
#
#   Returns: a [dataframe] of the dataset being pulled
#

pullData <- function(.datasetUrl,.isR = TRUE){
  if(.isR){
    .pulledDataset <- pullRDSfromUrl(.datasetUrl)
  } else
  {
    .pulledDataset <- pullDTAfromUrl(.datasetUrl)
  }

  janitor::clean_names(.pulledDataset)
  
  return(.pulledDataset);
}
