# Critical Check 4
#   Test for 0 missing variable labels
#
#   Input: The [dataframe] to Check
#   Returns: A [list] with
#           $pass = [boolean] with whether or not the number of vars with missing labels is > 0
#           $nMissingVariableLabels = [number] of variables with missing labels
#           $listOfVarsWithMissingLabels = [vector] of the variables with missing labels
#

checkForMissingVariableLabels <- function(.dsToCheck){

  .variableLabels <-
    labelled::var_label(.dsToCheck)
  
  .variablesWithMissingLabels <- 
    purrr::map_lgl(.variableLabels, is.null)
  
  .returnOutput <- list(
    pass = ifelse(sum(.variablesWithMissingLabels) == 0,TRUE,FALSE)
    ,nMissingVariableLabels = sum(.variablesWithMissingLabels)
    ,listOfVarsWithMissingLabels = .variableLabels[.variablesWithMissingLabels]
  )
  
  return(.returnOutput)
}
