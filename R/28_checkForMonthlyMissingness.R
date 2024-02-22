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
    ,acceptableMissingness = numeric()
    ,nonExtremeMissingness = numeric()
    ,missingnessThresholdMultiplier = numeric()
    ,skipLogic = character()
  )
  
  # Loop through the given variables and add a row to the dataframe
  for(.var in .listOfEssentialVars$varName){
    
    .currEssentialVariable <- .listOfEssentialVars |>
      filter(varName == .var)
    
    # Generate the number of rows, the number of missing, and the proportion for the check dataset
    if(.currEssentialVariable$skipLogic == ""){
      .nRows <- nrow(.dsToCheck)
      .nMissing <-
        sum(is.na(.dsToCheck[[.var]]))
    } else {
      .subsetDsToCheck <- .dsToCheck |>
        dplyr::filter(eval(parse(text = skipLogic)))
      .nRows <- nrow(.subsetDsToCheck)
      .nMissing <-
        sum(is.na(.subsetDsToCheck[[.var]]))
    }

    .propMissing = .nMissing / .nRows

    # Generate the number of rows, the number of missing, and the proportion for the comparator dataset
    if(.currEssentialVariable$skipLogic == ""){
      .nRowsComp <- nrow(.compDsToCheck)
      .nMissingComp <-
        sum(is.na(.compDsToCheck[[.var]]))
    } else {
      .subsetDsToCheck <- .compDsToCheck |>
        dplyr::filter(eval(parse(text = skipLogic)))
      .nRowsComp <- nrow(.subsetDsToCheck)
      .nMissingComp <-
        sum(is.na(.subsetDsToCheck[[.var]]))
    }

    .propMissingComp = .nMissingComp / .nRowsComp
    
    
    # Build the row to add to the dataframe
    .varMissingRow <- data.frame(
      varName = .var
      ,nRows = .nRows
      ,nMissing = .nMissing
      ,propMissing = .propMissing
      ,nRowsComp = .nRowsComp
      ,nMissingComp = .nMissingComp
      ,propMissingComp = .propMissingComp
      ,acceptableMissingness = .currEssentialVariable$acceptableMissingness
      ,nonExtremeMissingness = .currEssentialVariable$nonExtremeMissingness
      ,missingnessThresholdMultiplier = .currEssentialVariable$missingnessThresholdMultiplier
      ,skipLogic = .currEssentialVariable$skipLogic
      )
    
    .listOfVarMissingness <- dplyr::bind_rows(.listOfVarMissingness,.varMissingRow)
  }
  
  # Reorder the listing output to be sorted in descending order by amount of missingness
  .listOfVarMissingness <- .listOfVarMissingness |>
    dplyr::arrange(dplyr::desc(propMissing))
  
  # Define output list structure
  .returnOutput <- list(
    "checkId" = "cc8"
    ,"checkTitle" = "MoM (month over month) change in item nonresponse is reasonable for a subset of variables called essential."
    ,"checkDescription" = "Confirm that jump in item nonresponse from prior month to current month for essential variables is below a specified threshold for reasonable item nonresponse."
    ,"checkShortDescription" = "month to month missingness"
    ,"pass" = TRUE
    ,"essentialVariablesMissingness" = .listOfVarMissingness
  )
  
  return(.returnOutput)
}
