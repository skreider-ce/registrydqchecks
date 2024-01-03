# Critical Check 4
#   Test for 0 missing variable labels
#
#   Input: The dataset to Check
#   Returns: A list with
#           $nMissingVariableLabels = [number] of variables with missing labels
#           $listOfVarsWithMissingLabels = [vector] of the variables with missing labels
#

checkForMissingVariableLabels <- function(.dsToCheck){
  print("Hello world!")
  
  .variableLabels <-
    labelled::var_label(.dsToCheck)
  
  .variablesWithMissingLabels <- 
    purrr::map_lgl(.variableLabels, is.null) || purrr::map_lgl(.variableLabels, is.na)
  
  returnOutput <- list(
    nMissingVariableLabels = n(.variablesWithMissingLabels),
    listOfVarsWithMissingLabels = .variablesWithMissingLabels
  )
  
  return(returnOutput)
}