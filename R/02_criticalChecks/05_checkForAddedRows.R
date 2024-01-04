# Given I have a current dataset
#   AND Given I have a previous dataset to compare it to
#   RETURN number of rows in the new dataset compared to the old
#     AND number of rows in the old dataset
#     AND the proportion of the change in the number of rows

# Critical Check 5
#   FUNCTION: checkForAddedRows() Test for reasonable number of added rows
#
#   Input: The [dataframe] to Check
#           The [dataframe] to compare to (usually the previous month datapull)
#           A list (...) of the unique keys for the dataset
#   Returns: A [list] with
#           $nAddedRows = [number] of new rows in the dataset
#           $nOldRows = [number] of rows in the compare dataset
#           $propRowIncrease = [proportion] increase in the number of rows from last to now
#                 NOTE: (nNew - nOld) / (nOld)
#

checkForAddedRows <- function(.dsToCheck,.compDsToCheck){
  
  .returnOutput <- list(
    nAddedRows = nrow(.dsToCheck) - nrow(.compDsToCheck)
    ,nOldRows = nrow(.compDsToCheck)
    ,propRowIncrease = (nrow(.dsToCheck) - nrow(.compDsToCheck)) / nrow(.compDsToCheck)
  )
  
  return(.returnOutput)
}

