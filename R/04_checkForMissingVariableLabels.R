# Critical Check 4
#   Test for 0 missing variable labels
#
#   Input: The [dataframe] to Check
#   Returns: A [list] with
#           $pass = [boolean] with whether or not the number of vars with missing labels is > 0
#           $nMissingVariableLabels = [number] of variables with missing labels
#           $listOfVarsWithMissingLabels = [vector] of the variables with missing labels
#

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
