#' @export
criticalChecks <- function(.dsToCheck
                            ,.compDsToCheck
                            ,.listOfEssentialVars
                            ,.listOfSupposedVars
                            ,.uniqueKeys){

  # Runs each of the critical checks and stores the results in a variable
  .critCheckResults1 <- checkForDuplicateUniqueIds(.dsToCheck,.uniqueKeys)
  .critCheckResults2 <- checkForOmittedVariables(.dsToCheck,.listOfSupposedVars)
  .critCheckResults3 <- checkForExtraVariables(.dsToCheck,.listOfSupposedVars)
  .critCheckResults4 <- checkForMissingVariableLabels(.dsToCheck)
  .critCheckResults5 <- checkForAddedRows(.dsToCheck,.compDsToCheck)
  .critCheckResults6 <- checkForRemovedRows(.dsToCheck,.compDsToCheck,.uniqueKeys)
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
