# Prerequisites
#   A dataset exists in [dataframe] format that you want to check
#   A list of variables exists in [character vector] format that are deemed essential
#
# GIVEN A [dataframe] to check
#   AND GIVEN a [character vector] of essential variables
#   THEN FOR EACH essential variable
#     CALCULATE percentage of missing values
#       AND RETURN that value

# Essential item nonresponse is low
#   FUNCTION: checkForGivenItemsNonresponse(.dsToCheck, .listOfEssentialVars)
#           [longer description]
#
#   Input: [dataframe] .dsToCheck = the dataset to check
#           [character vector] .listOfEssentialVars = list of variables deemed essential
#
#   Returns: A [list] containing the results
#             $essentialVariablesMissingness = dataframe that contains a row for each
#                 essential variable and the number and proportion of missingness
#
#   TO DO:
#       1) Determine "pass" vs "fail"
#       2) Determine if item nonresponse should be just for NEW rows
#       3) Add tests for this
#

checkForGivenItemsNonresponse <- function(.dsToCheck, .listOfEssentialVars){
  
  # Initialize the dataframe that will be returned
  .listOfVarMissingness <- data.frame(
    varName = character()
    ,nRows = integer()
    ,nMissing = integer()
    ,propMissing = numeric()
  )

  # Loop through the given variables and add a row to the dataframe
  for(.var in .listOfEssentialVars){
    .nRows <- nrow(.dsToCheck)
    .nMissing <-
      sum(is.na(.dsToCheck[[.var]]))

    .propMissing = .nMissing / .nRows
    
    # Build the row to add to the dataframe
    .varMissingRow <- data.frame(
      varName = .var
      ,nRows = .nRows
      ,nMissing = .nMissing
      ,propMissing = .propMissing)
    
    .listOfVarMissingness <- bind_rows(.listOfVarMissingness,.varMissingRow)
  }

  .returnOutput <- list(
    pass = TRUE
    ,essentialVariablesMissingness = .listOfVarMissingness
  )
  
  return(.returnOutput)
}