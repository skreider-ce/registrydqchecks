#' @export
#' 
#' @importFrom janitor clean_names
pullData <- function(.datasetUrl,.isR = TRUE){
  
  # Check if .isR is TRUE or FALSE and call the appropriate function accordingly
  if(.isR){
    .pulledDataset <- pullRDSfromUrl(.datasetUrl)
  } else
  {
    .pulledDataset <- pullDTAfromUrl(.datasetUrl)
  }

  # Clean the variable names in the dataset for use in upcoming steps
  .pulledDataset <- janitor::clean_names(.pulledDataset)
  
  return(.pulledDataset);
}
