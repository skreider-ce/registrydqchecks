#' Check for duplicate unique IDs in a given dataset
#'
#' @param .dsToCheck A dataframe of the dataset to check
#' @param .uniqueKey A character vector that contains the names of the unique keys
#'
#' @returns A list with pass/fail, number of duplicate rows, and a list of ids that are duplicates
#' 
#' @importFrom dplyr count syms filter n
checkForDuplicateUniqueIds <- function(.dsToCheck,.uniqueKey){

  # Create a dataset from .dsToCheck with the uniqueIds that appear more than once
  .duplicateUniqueIds <-
    .dsToCheck |>
      dplyr::count(!!!dplyr::syms(.uniqueKey)) |>
    dplyr::filter(n > 1)

  # Define output list structure
  .returnOutput <- list(
    "checkId" = "cc1"
    ,"checkTitle" = "Zero duplicates"
    ,"checkDescription" = "For each analytic file, confirm that a specified set of variables uniquely identifies a row. "
    ,"checkShortDescription" = "duplicate unique keys"
    ,"sendCheckToRom" = FALSE
    ,"pass" = ifelse(nrow(.duplicateUniqueIds) == 0,TRUE,FALSE)
    ,"nDuplicateRows" = nrow(.duplicateUniqueIds)
    ,"listOfDuplicateRows" = .duplicateUniqueIds
  )
  
  return(.returnOutput)
}

