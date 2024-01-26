#' (internal function) Pull a .DTA file from a specified path
#'
#' @param .datasetUrl A url string to the .DTA file being pulled
#' 
#' @returns A dataframe of the file being pulled
#'
#' @export
#' 
#' @importFrom haven read_dta
pullDTAfromUrl <- function(.datasetUrl){
  
  print(.datasetUrl)
  .ds <- haven::read_dta(.datasetUrl)
  
  return(.ds)
}