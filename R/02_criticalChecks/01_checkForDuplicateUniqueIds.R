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
#           $nDuplicateRows = [number] of rows of the dataset which indicates the number of duplicate rows
#           $listOfDuplicateRows = [dataframe] of the duplicated IDs
#

checkForDuplicateUniqueIds <- function(.dsToCheck,...){

  .duplicateUniqueIds <-
    .dsToCheck |>
      count(...) |>
      filter(n > 1)

  .returnOutput <- list(
    nDuplicateRows = nrow(.duplicateUniqueIds),
    listOfDuplicateRows = .duplicateUniqueIds
  )
  
  return(.returnOutput)
}
