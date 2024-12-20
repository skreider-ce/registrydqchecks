#' addCheckId Add a checkId to the first column in a dataset
#'
#' @param .ds The dataset to add the column to
#' @param .checkId The checkId to add to the dataset
#'
#' @return The original dataset with .checkId added as the first column
#' @export
addCheckId <- function(.ds, .checkId){
  returnDs <- .ds |>
    dplyr::mutate(checkId = .checkId) |>
    dplyr::relocate(checkId, .before = 1)
  
  return(returnDs)
}