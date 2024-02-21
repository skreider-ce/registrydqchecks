#' generateCriticalCheckSummary
#'
#' @param .criticalChecksToSummarize The critical checks to be summarized in the appropriate CE DQ format
#'
#' @return Dataframe with a summary of the critical checks for the datasets
generateCriticalCheckSummary <- function(.criticalChecksToSummarize){
  
  # Initialize the dataframe to store results of the critical check summary
  .criticalCheckSummary <- data.frame()
  
  # Loop through each of the critical checks and store the pass/fail results
  for(dsName in names(.criticalChecksToSummarize)){
    .newSummaryRow <- c(dsName)
    
    .critCheckList <- .criticalChecksToSummarize[[dsName]]
    for(check in names(.critCheckList)){
      .currCritCheck <- .critCheckList[[check]]
      if(check == "criticalCheck2"){
        .newSummaryRow = c(.newSummaryRow, setNames(.currCritCheck$nOmittedVars,check))
      } else if(check == "criticalCheck3") {
        .newSummaryRow = c(.newSummaryRow, setNames(.currCritCheck$nExtraVars,check))
      } else if(is.null(.currCritCheck)){
        .newSummaryRow = c(.newSummaryRow, setNames(NA, check))
      } else {
        .newSummaryRow = c(.newSummaryRow, setNames(ifelse(.currCritCheck$pass, "Pass", "Fail"),check))
      }
    }
    .criticalCheckSummary <- setNames(rbind(.criticalCheckSummary, .newSummaryRow), c("dataset", names(.critCheckList)))
  }
  
  return(.criticalCheckSummary)
}