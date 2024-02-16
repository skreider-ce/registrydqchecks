#' generateCheckSummary
#'
#' @param .resultsOfChecks A list containing "criticalChecks" and "nonCriticalChecks" in the appropriate CE DQ format
#'
#' @return A list with the summaries of the critical and noncritical checks
generateCheckSummary <- function(.resultsOfChecks){

  .critCheckSummary <- generateCriticalCheckSummary(.resultsOfChecks$criticalCheckOutput)
  
  .checkSummary = list(
    "criticalCheckSummary" = .critCheckSummary
    ,"nonCriticalCheckSummary" = NULL
  )
  return(.checkSummary)  
}