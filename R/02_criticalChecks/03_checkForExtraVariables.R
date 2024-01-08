# Prerequisites
#     A [dataframe] exists to check
#     A [character vector] exists with the required variables
#
# GIVEN A [dataframe] to check
#   AND GIVEN a [character vector] of supposed variables
#   THEN I should compare the supposed variables to the variables in the dataset to check
#     AND return a [character vector] of variables not in the dataset

# Check for variables extra in the the dataset
#   FUNCTION: checkForExtraVariables()
#
#   Input: .dsToCheck = a [dataframe] to check the variables of
#           .listOfSupposedVars = a [character vector] of variables that should be there
#
#   Returns: $pass = [boolean] TRUE (no extra variables) or FALSE (variables are all the same)
#           $numExtraVars = [numeric] the number of variables extra
#           $extraVars = [character vector] of the extra variables
#
#   TO DO:
#       1) [what needs done]
#       2) [what else needs done]
#

checkForExtraVariables <- function(.dsToCheck, .listOfSupposedVars){
  
  # Get variables names from the dataset to check
  .dsVariables <- names(.dsToCheck)
  
  # Create a list of the variables in supposed vars and not in the dataset
  .extraVars <- setdiff(.dsVariables, .listOfSupposedVars)
  
  # Return the results of the check
  .returnOutput <- list(
    pass = ifelse(length(.extraVars) == 0, TRUE, FALSE)
    ,nExtraVars = length(.extraVars)
    ,extraVars = .extraVars
  )
  
  return(.returnOutput)
}