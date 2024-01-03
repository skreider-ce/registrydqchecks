source("./R/02_criticalChecks/01_duplicateUniqueIds.R")
source("./R/02_criticalChecks/04_checkForMissingVariableLabels.R")

# criticalCheck main() function that runs the individual critical checks
#
#   Input: The dataset to Check
#
#   Returns: a list with
#     $criticalCheck1 = list with results from duplicateUniqueIds
#
#   TO UPDATE: add additional critical checks
#

criticalChecks <- function(.dsToCheck){
  
  critCheckResults1 <- checkForDuplicateUniqueIds(.dsToCheck)
  critCheckResults4 <- checkForMissingVariableLabels(.dsToCheck)
  
  return(list(
    criticalCheck1 = critCheckResults1,
    criticalCheck4 = critCheckResults4
    ))
}

