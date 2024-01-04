source("./R/02_criticalChecks/01_checkForDuplicateUniqueIds.R")
source("./R/02_criticalChecks/04_checkForMissingVariableLabels.R")
source("./R/02_criticalChecks/05_checkForAddedRows.R")

# criticalCheck main() function that runs the individual critical checks
#
#   Input: The [dataframe] to Check
#           The [dataframe] to compare to (usually the previous months datapull)
#           A list (...) of the unique keys for the dataset being checked
#
#   Returns: a list with
#     $criticalCheck1 = list with results from duplicateUniqueIds
#
#   TO UPDATE: add additional critical checks
#

criticalChecks <- function(.dsToCheck,.compDsToCheck,...){

  .critCheckResults1 <- checkForDuplicateUniqueIds(.dsToCheck,...)
  .critCheckResults4 <- checkForMissingVariableLabels(.dsToCheck)
  .critCheckResults5 <- checkForAddedRows(.dsToCheck,.compDsToCheck)
  
  return(list(
    criticalCheck1 = .critCheckResults1
    ,criticalCheck4 = .critCheckResults4
    ,criticalCheck5 = .critCheckResults5
    ))
}
