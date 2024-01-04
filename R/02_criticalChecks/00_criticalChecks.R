source("./R/02_criticalChecks/01_checkForDuplicateUniqueIds.R")
source("./R/02_criticalChecks/04_checkForMissingVariableLabels.R")
source("./R/02_criticalChecks/05_checkForAddedRows.R")
source("./R/02_criticalChecks/06_checkForRemovedRows.R")

# criticalCheck main() function that runs the individual critical checks
#
#   Input: The [dataframe] to Check
#           The [dataframe] to compare to (usually the previous months datapull)
#           A list (...) of the unique keys for the dataset being checked
#
#   Returns: a list with
#     $criticalCheck1 = list with results from checkForDuplicateUniqueIds
#     $criticalCheck4 = list with results from checkForMissingVariableLabels
#     $criticalCheck5 = list with results from checkForAddedRows
#     $criticalCheck6 = list with results from checkForRemovedRows
#
#   TO UPDATE: add additional critical checks
#

criticalChecks <- function(.dsToCheck,.compDsToCheck,...){

  # Runs each of the critical checks and stores the results in a variable
  .critCheckResults1 <- checkForDuplicateUniqueIds(.dsToCheck,...)
  .critCheckResults4 <- checkForMissingVariableLabels(.dsToCheck)
  .critCheckResults5 <- checkForAddedRows(.dsToCheck,.compDsToCheck)
  .critCheckResults6 <- checkForRemovedRows(.dsToCheck,.compDsToCheck,...)
  
  # Returns a list with each element being one of the check results
  return(list(
    criticalCheck1 = .critCheckResults1
    ,criticalCheck4 = .critCheckResults4
    ,criticalCheck5 = .critCheckResults5
    ,criticalCheck6 = .critCheckResults6
    )
  )
}
