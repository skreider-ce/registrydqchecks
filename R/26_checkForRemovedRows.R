#' (internal function) Check for rows that were in last months dataset but are not in this month
#'
#' @param .dsToCheck A dataframe to check
#' @param .compDsToCheck A dataframe from last month
#' @param .uniqueKey A character vector with names of variables that define the unique keys
#'
#' @returns A list with pass/fail, number of removed rows, and a listing of unique keys that were removed
#'
#' @export
#' 
#' @importFrom dplyr anti_join
checkForRemovedRows <- function(.dsToCheck,.compDsToCheck,.uniqueKey){
  
  # Make (...) parameters into a character vector for use in anti_join
  .uniqueKeys <- .uniqueKey

  # Create dataframe of rows in .compDsToCheck and not in .dsToCheck
  .inOldAndNotInNew <- dplyr::anti_join(.compDsToCheck,.dsToCheck,.uniqueKeys)

  # Define output list structure
  .returnOutput <- list(
    "checkId" = "cc6"
    ,"checkTitle" = "Reasonable volume of disappearing rows"
    ,"checkDescription" = "For each analytic file, confirm that the volume of disappearing rows is below a prespecified threshold. (0)"
    ,"checkShortDescription" = "removed rows"
    ,"sendCheckToRom" = FALSE
    ,"threshold" = 0
    ,"pass" = ifelse(nrow(.inOldAndNotInNew) > 0, FALSE, TRUE)
    ,"nRemovedRows" = nrow(.inOldAndNotInNew)
    ,"inOldAndNotInNew" = .inOldAndNotInNew[,.uniqueKeys]
  )

  return(.returnOutput)
}

