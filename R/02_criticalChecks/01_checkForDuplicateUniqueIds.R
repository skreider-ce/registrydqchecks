# Given you have a dataframe you want to check
#   AND Given a list of the variables that are used as a unique key
#   THEN Run the specified Critical Check on the dataframe
#     AND Output the results of the Critical Check

# Critical Check 1
#   Test for 0 duplicates based on given unique key
#
#   Input: The [dataframe] to Check
#           A list (...) of variables to be used as the unique key
#   Returns: A [list] with
#           $pass = [boolean] with whether or not the number of duplicates is > 0
#           $nDuplicateRows = [number] of rows of the dataset which indicates the number of duplicate rows
#           $listOfDuplicateRows = [dataframe] of the duplicated IDs
#

checkForDuplicateUniqueIds <- function(.dsToCheck,.uniqueKey){

  # Create a dataset from .dsToCheck with the uniqueIds that appear more than once
  .duplicateUniqueIds <-
    .dsToCheck |>
      count(!!!syms(.uniqueKey)) |>
      filter(n > 1)

  .returnOutput <- list(
    pass = ifelse(nrow(.duplicateUniqueIds) == 0,TRUE,FALSE)
    ,nDuplicateRows = nrow(.duplicateUniqueIds)
    ,listOfDuplicateRows = .duplicateUniqueIds
  )
  
  return(.returnOutput)
}
