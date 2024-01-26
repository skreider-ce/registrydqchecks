#' (internal function) Check for how many rows were added to the dataset compared to last month
#'
#' @param .dsToCheck A dataframe to check
#' @param .compDsToCheck A dataframe from last month
#' 
#' @returns A list with pass/fail, number of rows added, number of old rows, and the proportion increase in rows
#'
#' @export
checkForAddedRows <- function(.dsToCheck,.compDsToCheck){
  
  # Counts and then returns the number of rows in the new vs old dataset and
  #     computes the proportion increase in rows and compares to a given value
  .returnOutput <- list(
    pass = ifelse((nrow(.dsToCheck) - nrow(.compDsToCheck)) / nrow(.compDsToCheck) < 0.1,TRUE,FALSE)
    ,nAddedRows = nrow(.dsToCheck) - nrow(.compDsToCheck)
    ,nOldRows = nrow(.compDsToCheck)
    ,propRowIncrease = (nrow(.dsToCheck) - nrow(.compDsToCheck)) / nrow(.compDsToCheck)
  )
  
  return(.returnOutput)
}

