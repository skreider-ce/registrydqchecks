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
