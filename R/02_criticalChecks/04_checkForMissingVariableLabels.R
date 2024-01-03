# Critical Check 4
#   Test for 0 missing variable labels
#
#   Input: The dataset to Check
#   Returns: A list with
#           $nMissingVariableLabels = [number] of variables with missing labels
#           $listOfVarsWithMissingLabels = [vector] of the variables with missing labels
#

checkForMissingVariableLabels <- function(.dsToCheck){

  .variableLabels <-
    labelled::var_label(.dsToCheck)
  
  .variablesWithMissingLabels <- 
    purrr::map_lgl(.variableLabels, is.null)
  
  .returnOutput <- list(
    nMissingVariableLabels = sum(.variablesWithMissingLabels),
    listOfVarsWithMissingLabels = .variableLabels[.variablesWithMissingLabels]
  )
  
  return(.returnOutput)
}
