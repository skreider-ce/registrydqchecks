#' (internal function) Check if any variables have missing labels
#'
#' @param .dsToCheck A dataframe to check
#' 
#' @returns A list with pass/fail, the number of variables with missing labels, and a list of the variables with missing labels
#'
#' @export
#' 
#' @importFrom labelled var_label
#' @importFrom purrr map_lgl
checkForMissingVariableLabels <- function(.dsToCheck){

  # Pull variable labels from .dsToCheck
  .variableLabels <-
    labelled::var_label(.dsToCheck)
  
  # Apply a is.null check to each of the labels in the list - returning true/false for each
  .variablesWithMissingLabels <- 
    purrr::map_lgl(.variableLabels, is.null)
  
  .returnOutput <- list(
    pass = ifelse(sum(.variablesWithMissingLabels) == 0,TRUE,FALSE)
    ,nMissingVariableLabels = sum(.variablesWithMissingLabels)
    ,listOfVarsWithMissingLabels = .variableLabels[.variablesWithMissingLabels]
  )
  
  return(.returnOutput)
}
