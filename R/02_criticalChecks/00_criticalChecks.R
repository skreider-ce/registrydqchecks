source("./R/02_criticalChecks/01_checkForDuplicateUniqueIds.R")
source("./R/02_criticalChecks/02_checkForOmittedVariables.R")
source("./R/02_criticalChecks/03_checkForExtraVariables.R")
source("./R/02_criticalChecks/04_checkForMissingVariableLabels.R")
source("./R/02_criticalChecks/05_checkForAddedRows.R")
source("./R/02_criticalChecks/06_checkForRemovedRows.R")
source("./R/02_criticalChecks/07_checkForGivenItemsNonresponse.R")
source("./R/02_criticalChecks/08_checkForMonthlyMissingness.R")

# criticalCheck main() function that runs the individual critical checks
#
#   Input: .dsToCheck = The [dataframe] to Check
#           .compDsToCheck = The [dataframe] to compare to (usually the previous months datapull)
#           .listOfEssentialVars = A [character vector] with the variable names deemed "essential"
#           .listOfSupposedVars = A [character vector] with the variable names that "should" be in the dataset
#           A list (...) of the unique keys for the dataset being checked
#
#   Returns: a list with
#     $criticalCheck1 = list with results from checkForDuplicateUniqueIds
#     $criticalCheck2 = list with results from checkForOmittedVariables
#     $criticalCheck3 = list with results from checkForExtraVariables
#     $criticalCheck4 = list with results from checkForMissingVariableLabels
#     $criticalCheck5 = list with results from checkForAddedRows
#     $criticalCheck6 = list with results from checkForRemovedRows
#     $criticalCheck7 = list with results from checkForGivenItemsNonresponse
#     $criticalCheck8 = list with results from checkForMonthlyMissingness
#
#   TO UPDATE: add additional critical checks
#

criticalChecks <- function(
                            .dsToCheck
                            ,.compDsToCheck
                            ,.listOfEssentialVars
                            ,.listOfSupposedVars
                            ,...){

  # Runs each of the critical checks and stores the results in a variable
  .critCheckResults1 <- checkForDuplicateUniqueIds(.dsToCheck,...)
  .critCheckResults2 <- checkForOmittedVariables(.dsToCheck,.listOfSupposedVars)
  .critCheckResults3 <- checkForExtraVariables(.dsToCheck,.listOfSupposedVars)
  .critCheckResults4 <- checkForMissingVariableLabels(.dsToCheck)
  .critCheckResults5 <- checkForAddedRows(.dsToCheck,.compDsToCheck)
  .critCheckResults6 <- checkForRemovedRows(.dsToCheck,.compDsToCheck,...)
  .critCheckResults7 <- checkForGivenItemsNonresponse(.dsToCheck,.listOfEssentialVars)
  .critCheckResults8 <- checkForMonthlyMissingness(.dsToCheck,.compDsToCheck,.listOfEssentialVars)
  
  # Returns a list with each element being one of the check results
  return(list(
    criticalCheck1 = .critCheckResults1
    ,criticalCheck2 = .critCheckResults2
    ,criticalCheck3 = .critCheckResults3
    ,criticalCheck4 = .critCheckResults4
    ,criticalCheck5 = .critCheckResults5
    ,criticalCheck6 = .critCheckResults6
    ,criticalCheck7 = .critCheckResults7
    ,criticalCheck8 = .critCheckResults8
    )
  )
}
