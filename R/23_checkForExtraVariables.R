#' @export
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