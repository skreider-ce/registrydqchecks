#' (internal function) A function to pull the R dataset from the given url location
#'
#' @param .datasetUrl A url string that points to the location of the dataset
#' @param .isR A boolean indicating if the dataset is a .RDS or a .DTA (default = TRUE)
#'
#' @returns A dataframe of the dataset that was pulled
#'
#' @export
#' 
#' @importFrom janitor clean_names
pullData <- function(.datasetUrl,.isR = TRUE){
  
  # Check if .isR is TRUE or FALSE and call the appropriate function accordingly
  if(.isR){
    .pulledDataset <- pullRDSfromUrl(.datasetUrl = glue::glue("{.datasetUrl}.rds"))
  } else
  {
    .pulledDataset <- pullDTAfromUrl(.datasetUrl = glue::glue("{.datasetUrl}.dta"))
  }

  # Clean the variable names in the dataset for use in upcoming steps
  # .pulledDataset <- janitor::clean_names(.pulledDataset)
  
  return(.pulledDataset);
}
