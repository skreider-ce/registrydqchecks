#' runMonthlyMissingnessCheck Run a check to look at amount of month-to-month missingness for all variables
#'
#' @return Results of the check
runMonthlyMissingnessCheck <- function(){
  
  .checkOutput <- list(
    "checkTitle" = "MoM (month over month) change in item nonresponse is reasonable for non-essential variables"
    ,"checkDescription" = "Confirm that the jump in item nonresponse from prior month to current month for non-essential variables is below a prespecified threshold."
    ,"checkShortDescription" = "general month to month missingness"
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