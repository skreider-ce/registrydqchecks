#' @export
#' 
#' @importFrom haven read_dta
pullDTAfromUrl <- function(.datasetUrl){
  
  print(.datasetUrl)
  .ds <- haven::read_dta(.datasetUrl)
  
  return(.ds)
}