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



# FUNCTION: pullRDSfromUrl that pulls the RDS file from the specified direct URL
#
#   Input: The URL of the RDS dataset to pull
#           .datasetUrl = URL directly to the RDS dataset to pull
#
#   Returns: a [dataframe] of the dataset being pulled
#
pullRDSfromUrl <- function(.datasetUrl){

  print(.datasetUrl)
  .ds <- readRDS(.datasetUrl)

  return(.ds)
}



# FUNCTION: pullDTAfromUrl that pulls the DTA file from the specified direct URL
#
#   Input: The URL of the DTA dataset to pull
#           .datasetUrl = URL directly to the DTA dataset to pull
#
#   Returns: a [dataframe] of the dataset being pulled
#
pullDTAfromUrl <- function(.datasetUrl){
  
  print(.datasetUrl)
  .ds <- haven::read_dta(.datasetUrl)
  
  return(.ds)
}
