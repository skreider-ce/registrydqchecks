#' @export
#' 
#' @importFrom dplyr bind_rows
checkForGivenItemsNonresponse <- function(.dsToCheck, .listOfEssentialVars){
  
  # Initialize the dataframe that will be returned
  .listOfVarMissingness <- data.frame(
    varName = character()
    ,nRows = integer()
    ,nMissing = integer()
    ,propMissing = numeric()
  )

  # Loop through the given variables and add a row to the dataframe
  for(.var in .listOfEssentialVars){
    .nRows <- nrow(.dsToCheck)
    .nMissing <-
      sum(is.na(.dsToCheck[[.var]]))

    .propMissing = .nMissing / .nRows
    
    # Build the row to add to the dataframe
    .varMissingRow <- data.frame(
      varName = .var
      ,nRows = .nRows
      ,nMissing = .nMissing
      ,propMissing = .propMissing)
    
    .listOfVarMissingness <- dplyr::bind_rows(.listOfVarMissingness,.varMissingRow)
  }

  .returnOutput <- list(
    pass = TRUE
    ,essentialVariablesMissingness = .listOfVarMissingness
  )
  
  return(.returnOutput)
}