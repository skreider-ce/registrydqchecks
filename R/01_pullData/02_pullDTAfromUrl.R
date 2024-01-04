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