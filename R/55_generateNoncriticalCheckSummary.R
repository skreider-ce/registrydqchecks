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
    ,"pctFailed" = numeric()
  )
  
  # Loop through each of the noncritical checks and store the pass/fail results
  for(dsName in names(.nonCriticalChecksToSummarize)){
    
    # Initialize the tracking list
    .newSummaryCol <- c()
    .nonCritCheckList <- .nonCriticalChecksToSummarize[[dsName]]
    
    # Loop through codebook checks and store results of the checks
    for(check in names(.nonCritCheckList$codebookChecks)){
      .currNoncritCheck <- .nonCritCheckList$codebookChecks[[check]]
      .newSummaryCol <- c(.newSummaryCol, .currNoncritCheck$pass)
    }
    
    # Loop through manual nPctList checks and store results of the checks
    for(check in names(.nonCritCheckList$nPctList)){
      .currNoncritCheck <- .nonCritCheckList$nPctList[[check]]
      .newSummaryCol <- c(.newSummaryCol, .currNoncritCheck$pass)
    }
    
    # Calculate summary statistics
    .numFailedChecks <- length(.newSummaryCol) - sum(.newSummaryCol)
    .numTotalChecks <- length(.newSummaryCol)
    .propFailed <- round(.numFailedChecks / .numTotalChecks, digits = 3)
    .pctFailed <- 100*round(.numFailedChecks / .numTotalChecks, digits = 3)
    .newSummaryCol <- c(dsName, .numFailedChecks, .numTotalChecks, .propFailed)

    # Stack the summary row for each dataset being checked on top of each other
    .nonCriticalCheckSummary <- rbind(.nonCriticalCheckSummary, .newSummaryCol)
  }

  # Assign output dataset names  
  .nonCriticalCheckSummary <- stats::setNames(.nonCriticalCheckSummary, c("dataset", "nFailed", "nTotal", "propFailed", "pctFailed"))

  return(.nonCriticalCheckSummary)
}

