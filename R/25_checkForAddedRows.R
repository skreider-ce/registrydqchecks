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

