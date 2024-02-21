#' (internal function) Check the missingness for the given items
#'
#' @param .dsToCheck A dataframe to check
#' @param .listOfEssentialVars A character vector with the variables deemed "essential"
#'
#' @returns A list with pass/fail, and a dataframe with the information on the missingness for those variables
#'
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
  
  # Reorder the listing output to be sorted in descending order by amount of missingness
  .listOfVarMissingness <- .listOfVarMissingness |>
    dplyr::arrange(desc(propMissing))

  # Define output list structure
  .returnOutput <- list(
    "checkId" = "cc7"
    ,"checkTitle" = "Item nonresponse for essential variables is not extreme"
    ,"checkDescription" = "Confirm that item nonresponse for essential variables is below a specified threshold."
    ,"checkShortDescription" = "item missingness"
    ,"pass" = TRUE
    ,"essentialVariablesMissingness" = .listOfVarMissingness
  )
  
  return(.returnOutput)
}