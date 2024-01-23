# Prerequisites
#     A [dataframe] exists to check
#     A [character vector] exists with the required variables
#
# GIVEN A [dataframe] to check
#   AND GIVEN a [character vector] of supposed variables
#   THEN I should compare the supposed variables to the variables in the dataset to check
#     AND return a [character vector] of variables not in the dataset

# Check for variables omitted from the dataset
#   FUNCTION: checkForOmittedVariables()
#
#   Input: .dsToCheck = a [dataframe] to check the variables of
#           .listOfSupposedVars = a [character vector] of variables that should be there
#
#   Returns: $pass = [boolean] TRUE (no omitted variables) or FALSE (variables are omitted)
#           $numOmittedVars = [numeric] the number of variables omitted
#           $omittedVars = [character vector] of the omitted variables
#
#   TO DO:
#       1) [what needs done]
#       2) [what else needs done]
#

#' @export
checkForOmittedVariables <- function(.dsToCheck, .listOfSupposedVars){
  
  # Get variables names from the dataset to check
  .dsVariables <- names(.dsToCheck)
  
  # Create a list of the variables in supposed vars and not in the dataset
  .omittedVars <- setdiff(.listOfSupposedVars, .dsVariables)
  
  # Return the results of the check
  .returnOutput <- list(
    pass = ifelse(length(.omittedVars) == 0, TRUE, FALSE)
    ,nOmittedVars = length(.omittedVars)
    ,omittedVars = .omittedVars
  )
  
  return(.returnOutput)
}