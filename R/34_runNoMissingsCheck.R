#' runNoMissingsCheck Run a check to ensure variables that should not be missing are not
#'
#' @return Results of the check
runNoMissingsCheck <- function(){
  
  .checkOutput <- list(
    "checkTitle" = "There aren’t any missing values for identified variables."
    ,"checkDescription" = "Confirm that there aren’t any missing values for these specific variables."
    ,"checkShortDescription" = "confirmation of zero missings"
    ,"pass" = NULL
    ,"values" = list(
      "n" = NULL
      ,"N" = NULL
      ,"pct" = NULL
    )
    ,"listing" = NULL
  )
  
  return(.checkOutput)
}