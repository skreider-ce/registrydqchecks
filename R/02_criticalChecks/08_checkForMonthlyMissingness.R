# Prerequisites
#   A dataset exists in [dataframe] format that you want to check
#   A dataset exists in [dataframe] format that you want to compare to
#   A list of variables exists in [character vector] format that are deemed essential
#
# GIVEN A [dataframe] to check
#   AND GIVEN a [dataframe] to compare to
#   AND GIVEN a [character vector] of essential variables
#   THEN FOR EACH essential variable
#     CALCULATE percentage of missing values
#       AND RETURN that value

# Essential item nonresponse is low between comparative datasets
#   FUNCTION: checkForMonthlyMissingness()
#
#   Input: .dsToCheck = a [dataframe] to check
#           .compDsToCheck = a [dataframe] to compare to
#           .listOfEssentialVars = a [character vector] of variables deemed essential
#
#   Returns: [a description of the return type]
#           $essentialVariablesMissingness = dataframe that contains a row for each
#                 essential variable and the number and proportion of missingness
#
#   TO DO:
#       1) [what needs done]
#       2) [what else needs done]
#       […]
#

checkForMonthlyMissingness <- function(.dsToCheck, .compDsToCheck, .listOfEssentialVars){
  
  # Initialize the dataframe that will be returned
  .listOfVarMissingness <- data.frame(
    varName = character()
    ,nRows = integer()
    ,nMissing = integer()
    ,propMissing = numeric()
    ,nRowsComp = integer()
    ,nMissingComp = integer()
    ,propMissingComp = numeric()
  )
  
  # Loop through the given variables and add a row to the dataframe
  for(.var in .listOfEssentialVars){
    
    # Generate the number of rows, the number of missing, and the proportion for the dataset
    .nRows <- nrow(.dsToCheck)
    .nMissing <-
      sum(is.na(.dsToCheck[[.var]]))
    
    .propMissing = .nMissing / .nRows
    
    # Generate the number of rows, the number of missing, and the proportion for the comparator dataset
    .nRowsComp <- nrow(.compDsToCheck)
    .nMissingComp <-
      sum(is.na(.compDsToCheck[[.var]]))
    
    .propMissingComp = .nMissingComp / .nRowsComp
    
    
    # Build the row to add to the dataframe
    .varMissingRow <- data.frame(
      varName = .var
      ,nRows = .nRows
      ,nMissing = .nMissing
      ,propMissing = .propMissing
      ,nRowsComp = .nRowsComp
      ,nMissingComp = .nMissingComp
      ,propMissingComp = .propMissingComp)
    
    .listOfVarMissingness <- bind_rows(.listOfVarMissingness,.varMissingRow)
  }
  
  
  .returnOutput <- list(
    pass = TRUE
    ,essentialVariablesMissingness = .listOfVarMissingness
  )
  
  return(.returnOutput)
}
