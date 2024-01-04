# Given I have a current dataset
#   AND Given I have a previous dataset to compare it to
#   RETURN number of rows in the old dataset that are not in the new dataset
#     AND RETURN a dataframe of those rows for followup

# Critical Check 6
#   FUNCTION: checkForRemovedRows() Test for reasonable number of removed rows
#
#   Input: The [dataframe] to Check
#           The [dataframe] to compare to (usually the previous month datapull)
#           A list (...) of the unique keys for the dataset
#   Returns: A [list] with
#           $nRemovedRows = [number] of rows in .compDsToCheck but not in .dsToCheck
#           $inOldAndNotInNew = [dataframe] of rows in .compDsToCheck but not in .dsToCheck
#
#   TO DO:
#       1) Decide how to handle what to compare to
#

checkForRemovedRows <- function(.dsToCheck,.compDsToCheck,...){
  
  # Make (...) parameters into a character vector for use in anti_join
  .uniqueKeys <- as.character(substitute(list(...)))[-1]

  # Create dataframe of rows in .compDsToCheck and not in .dsToCheck
  .inOldAndNotInNew <- anti_join(.compDsToCheck,.dsToCheck,.uniqueKeys)

  .returnOutput <- list(
    pass = TRUE
    ,nRemovedRows = nrow(.inOldAndNotInNew)
    ,inOldAndNotInNew = .inOldAndNotInNew[,.uniqueKeys]
  )

  return(.returnOutput)
}

