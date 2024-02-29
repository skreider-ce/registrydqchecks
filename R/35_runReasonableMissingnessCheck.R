#' runReasonableMissingnessCheck Run a check to look at reasonable amount of missingness for all variables
#'
#' @return Results of the check
runReasonableMissingnessCheck <- function(){
  
  .checkOutput <- list(
    "checkTitle" = "Item nonresponse for variables is reasonable."
    ,"checkDescription" = "Confirm that the percentage of observations with missing values is below a prespecified threshold."
    ,"checkShortDescription" = "general item missingness"
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