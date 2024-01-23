#' @export
#' 
#' @importFrom dplyr count syms filter n
checkForDuplicateUniqueIds <- function(.dsToCheck,.uniqueKey){

  # Create a dataset from .dsToCheck with the uniqueIds that appear more than once
  .duplicateUniqueIds <-
    .dsToCheck |>
      dplyr::count(!!!dplyr::syms(.uniqueKey)) |>
    dplyr::filter(n > 1)

  .returnOutput <- list(
    pass = ifelse(nrow(.duplicateUniqueIds) == 0,TRUE,FALSE)
    ,nDuplicateRows = nrow(.duplicateUniqueIds)
    ,listOfDuplicateRows = .duplicateUniqueIds
  )
  
  return(.returnOutput)
}
