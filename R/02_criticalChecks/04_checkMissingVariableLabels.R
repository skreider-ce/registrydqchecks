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
  
  .duplicateUniqueIds <-
    .dsToCheck |>
    count(id, visitdate) |>
    filter(n > 1)
  head(.duplicateUniqueIds)
  
  returnOutput <- list(
    nDuplicateRows = nrow(.duplicateUniqueIds),
    listOfDuplicateRows = .duplicateUniqueIds
  )
  
  return(returnOutput)
}