#' generateNoncriticalCheckSummary
#'
#' @param .nonCriticalChecksToSummarize The noncritical checks to be summarized in the appropriate CE DQ format
#'
#' @importFrom stats setNames
#'
#' @return Dataframe with a summary of the critical checks for the datasets
generateNoncriticalCheckSummary <- function(.nonCriticalChecksToSummarize){
  
  # Initialize the dataframe to store results of the noncritical check summary
  .nonCriticalCheckSummary <- data.frame(
    "dataset" = character()
    ,"nFailed" = integer()
    ,"nTotal" = integer()
    ,"propFailed" = double()
  )
  
  # Loop through each of the noncritical checks and store the pass/fail results
  for(dsName in names(.nonCriticalChecksToSummarize)){
    
    .newSummaryCol <- c()
    .nonCritCheckList <- .nonCriticalChecksToSummarize[[dsName]]
    
    for(check in names(.nonCritCheckList$nPctList)){
      .currNoncritCheck <- .nonCritCheckList$nPctList[[check]]
      .newSummaryCol <- c(.newSummaryCol, .currNoncritCheck$pass)
    }
    
    .numFailedChecks <- sum(.newSummaryCol)
    .numTotalChecks <- length(.newSummaryCol)
    .propFailed <- .numFailedChecks / .numTotalChecks
    .newSummaryCol <- c(dsName, .numFailedChecks, .numTotalChecks, .propFailed)

    .nonCriticalCheckSummary <- rbind(.nonCriticalCheckSummary, .newSummaryCol)
  }
  
  .nonCriticalCheckSummary <- stats::setNames(.nonCriticalCheckSummary, c("dataset", "nFailed", "nTotal", "propFailed"))

  return(.nonCriticalCheckSummary)
}

# dsName = "exvisit"
# check = "nc18"
