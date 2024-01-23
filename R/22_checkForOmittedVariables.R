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