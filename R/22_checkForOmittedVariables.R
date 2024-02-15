#' (internal function) Check for variables that have been left out of the comparator list
#'
#' @param .dsToCheck A dataframe of the dataset to check
#' @param .listOfSupposedVars A character vector containing the list of variables that should be in the dataset
#'
#' @returns A list with pass/fail, the number of omitted variables, and a list of the omitted variables
#'
#' @export
checkForOmittedVariables <- function(.dsToCheck, .listOfSupposedVars){
  
  # Get variables names from the dataset to check
  .dsVariables <- names(.dsToCheck)
  
  # Create a list of the variables in supposed vars and not in the dataset
  .omittedVars <- setdiff(.listOfSupposedVars, .dsVariables)
  
  # Return the results of the check
  .returnOutput <- list(
    "checkId" = "cc2"
    ,"checkTitle" = "Added variables"
    ,"checkDescription" = "For each analytic file, check which variables were added from last month."
    ,"checkShortDescription" = "newly added variables"
    ,"pass" = ifelse(length(.omittedVars) == 0, TRUE, FALSE)
    ,"nOmittedVars" = length(.omittedVars)
    ,"omittedVars" = .omittedVars
  )
  
  return(.returnOutput)
}