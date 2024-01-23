# install.packages("RegistryDQChecks")
# library(RegistryDQChecks)

# criticalCheck main() function that runs the individual critical checks
#
#   Input: .dsToCheck = The [dataframe] to Check
#           .compDsToCheck = The [dataframe] to compare to (usually the previous months datapull)
#           .listOfEssentialVars = A [character vector] with the variable names deemed "essential"
#           .listOfSupposedVars = A [character vector] with the variable names that "should" be in the dataset
#           .uniqueKey = A [character vector] of the unique keys for the dataset being checked
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



# Prerequisites
#     A [list] of check results exists
#     A [text URL] is available to store the data
#
# GIVEN a [list] of results from data checks
#   AND GIVEN a [text URL] of where to store the data
#   THEN store the results in the specified location

# Submit results of checks to a data storage location
#   FUNCTION: submitToDataStore(.resultsOfChecks)
#
#   Input: .resultsOfChecks [list] = results of the data checks to be stored
#
#   Returns: n/a
#
#   TO DO:
#       1) [what needs done]
#