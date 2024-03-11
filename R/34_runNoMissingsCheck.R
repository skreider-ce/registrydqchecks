#' runNoMissingsCheck Run a check to ensure variables that should not be missing are not
#'
#' @return Results of the check
runNoMissingsCheck <- function(){
  
  .checkOutput <- list(
    "checkTitle" = "There arent any missing values for identified variables."
    ,"checkDescription" = "Confirm that there arent any missing values for these specific variables."
    ,"checkShortDescription" = "confirmation of zero missings"
    ,"pass" = NULL
    ,"values" = list(
      "n" = 0
      ,"N" = 0
      ,"pct" = 0
    )
    ,"listing" = data.frame()
  )
  
  return(.checkOutput)
}