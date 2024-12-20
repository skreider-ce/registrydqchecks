#' generateCriticalCheckSummary
#'
#' @param .criticalChecksToSummarize The critical checks to be summarized in the appropriate CE DQ format
#'
#' @return Dataframe with a summary of the critical checks for the datasets
#' 
#' @importFrom stats setNames
generateCriticalCheckSummary <- function(.criticalChecksToSummarize){
  
  # Initialize the dataframe to store results of the critical check summary
  .criticalCheckSummary <- data.frame()
  
  # Loop through each of the critical checks and store the pass/fail results
  for(dsName in names(.criticalChecksToSummarize)){
    .newSummaryRow <- c(dsName)
    
    .critCheckList <- .criticalChecksToSummarize[[dsName]]
    
    # Loop through the critical checks and store the results of the checks
    for(check in names(.critCheckList)){
      .currCritCheck <- .critCheckList[[check]]
      if(check == "criticalCheck2"){
        .newSummaryRow = c(.newSummaryRow, stats::setNames(.currCritCheck$nExtraVars,check))
      } else if(check == "criticalCheck3") {
        .newSummaryRow = c(.newSummaryRow, stats::setNames(.currCritCheck$nOmittedVars,check))
      } else if(is.null(.currCritCheck)){
        .newSummaryRow = c(.newSummaryRow, stats::setNames(NA, check))
      } else {
        .newSummaryRow = c(.newSummaryRow, stats::setNames(ifelse(.currCritCheck$pass, "Pass", "Fail"),check))
      }
    }

    # Assign column names for output list
    .criticalCheckSummary <- stats::setNames(rbind(.criticalCheckSummary, .newSummaryRow), c("dataset"
                                                                                             ,c("cc1", "cc2", "cc3", "cc4"
                                                                                                ,"cc5", "cc6", "cc7", "cc8"
                                                                                                ,"cc9", "cc10")))
  }
  
  return(.criticalCheckSummary)
}