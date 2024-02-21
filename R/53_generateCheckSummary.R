#' generateCheckSummary
#'
#' @param .resultsOfChecks A list containing "criticalChecks" and "nonCriticalChecks" in the appropriate CE DQ format
#'
#' @return A list with the summaries of the critical and noncritical checks
generateCheckSummary <- function(.resultsOfChecks){

  # Generate a summary of the critical checks
  .critCheckSummary <- generateCriticalCheckSummary(.resultsOfChecks$criticalCheckOutput)
  
  # Define the structure of the summary object to be saved with the .rds
  .checkSummary = list(
    "criticalCheckSummary" = .critCheckSummary
    ,"nonCriticalCheckSummary" = NULL
  )
  
  return(.checkSummary)  
}