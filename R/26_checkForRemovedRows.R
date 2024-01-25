#' @export
#' 
#' @importFrom dplyr anti_join
checkForRemovedRows <- function(.dsToCheck,.compDsToCheck,.uniqueKey){
  
  # Make (...) parameters into a character vector for use in anti_join
  .uniqueKeys <- .uniqueKey

  # Create dataframe of rows in .compDsToCheck and not in .dsToCheck
  .inOldAndNotInNew <- dplyr::anti_join(.compDsToCheck,.dsToCheck,.uniqueKeys)

  .returnOutput <- list(
    pass = TRUE
    ,nRemovedRows = nrow(.inOldAndNotInNew)
    ,inOldAndNotInNew = .inOldAndNotInNew[,.uniqueKeys]
  )

  return(.returnOutput)
}

