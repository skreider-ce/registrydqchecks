# Critical Check 1
#   Test for 0 duplicates based on given unique key
#
#   Input: The dataset to Check
#   Returns: A list with
#           $nDuplicateRows = [number] of rows of the dataset which indicates the number of duplicate rows
#           $listOfDuplicateRows = [dataframe] of the duplicated IDs
#
#   TO UPDATE: parameterize the unique key for the given dataset
#

checkForDuplicateUniqueIds <- function(.dsToCheck){

  .duplicateUniqueIds <-
    .dsToCheck |>
    count(id, visitdate) |>
    filter(n > 1)
  head(.duplicateUniqueIds)
  
  returnOutput <- list(
    nDuplicateRows = nrow(.duplicateUniqueIds),
    listOfDuplicateRows = .duplicateUniqueIds
  )
  
  return(returnOutput)
}