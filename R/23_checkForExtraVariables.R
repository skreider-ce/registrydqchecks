#' (internal function) Check that there are no extra variables compared to the variables that should be there
#'
#' @param .dsToCheck A dataframe of the dataset to check
#' @param .listOfSupposedVars A character vector with the names of the variables that should be in the dataset
#'
#' @returns A list with pass/fail, the number of extra variables, and a list of the extra variables
#'
#' @export
checkForExtraVariables <- function(.dsToCheck, .listOfSupposedVars){
  
  # Get variables names from the dataset to check
  .dsVariables <- names(.dsToCheck)
  
  # Create a list of the variables in supposed vars and not in the dataset
  .extraVars <- setdiff(.dsVariables, .listOfSupposedVars)
  
  # Define output list structure
  .returnOutput <- list(
    "checkId" = "cc3"
    ,"checkTitle" = "Removed variables"
    ,"checkDescription" = "For each analytic file, see which variables were removed from last month."
    ,"checkShortDescription" = "removed variables"
    ,"pass" = ifelse(length(.extraVars) == 0, TRUE, FALSE)
    ,"nExtraVars" = length(.extraVars)
    ,"extraVars" = .extraVars
  )
  
  return(.returnOutput)
}