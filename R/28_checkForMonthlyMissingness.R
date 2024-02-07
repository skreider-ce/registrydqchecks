#' (internal function) Check the month-to-month missingness for the given items
#'
#' @param .dsToCheck A dataframe to check
#' @param .compDsToCheck A dataframe to check from last month
#' @param .listOfEssentialVars A character vector with the variables deemed "essential"
#'
#' @returns A list with pass/fail, and a dataframe with the information on the missingness for those variables between the two datasets
#'
#' @export
#' 
#' @importFrom dplyr bind_rows
checkForMonthlyMissingness <- function(.dsToCheck, .compDsToCheck, .listOfEssentialVars){
  
  # Initialize the dataframe that will be returned
  .listOfVarMissingness <- data.frame(
    varName = character()
    ,nRows = integer()
    ,nMissing = integer()
    ,propMissing = numeric()
    ,nRowsComp = integer()
    ,nMissingComp = integer()
    ,propMissingComp = numeric()
  )
  
  # Loop through the given variables and add a row to the dataframe
  for(.var in .listOfEssentialVars){
    
    # Generate the number of rows, the number of missing, and the proportion for the dataset
    .nRows <- nrow(.dsToCheck)
    .nMissing <-
      sum(is.na(.dsToCheck[[.var]]))
    
    .propMissing = .nMissing / .nRows
    
    # Generate the number of rows, the number of missing, and the proportion for the comparator dataset
    .nRowsComp <- nrow(.compDsToCheck)
    .nMissingComp <-
      sum(is.na(.compDsToCheck[[.var]]))
    
    .propMissingComp = .nMissingComp / .nRowsComp
    
    
    # Build the row to add to the dataframe
    .varMissingRow <- data.frame(
      varName = .var
      ,nRows = .nRows
      ,nMissing = .nMissing
      ,propMissing = .propMissing
      ,nRowsComp = .nRowsComp
      ,nMissingComp = .nMissingComp
      ,propMissingComp = .propMissingComp)
    
    .listOfVarMissingness <- dplyr::bind_rows(.listOfVarMissingness,.varMissingRow)
  }
  
  .listOfVarMissingness <- .listOfVarMissingness |>
    dplyr::arrange(desc(propMissing))
  
  .returnOutput <- list(
    pass = TRUE
    ,essentialVariablesMissingness = .listOfVarMissingness
  )
  
  return(.returnOutput)
}
