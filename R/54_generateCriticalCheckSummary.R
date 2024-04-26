#' generateCriticalCheckSummary
#'
#' @param .criticalChecksToSummarize The critical checks to be summarized in the appropriate CE DQ format
#' 
#' @importFrom stats setNames
#'
#' @return Dataframe with a summary of the critical checks for the datasets
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
        .newSummaryRow = c(.newSummaryRow, setNames(.currCritCheck$nOmittedVars,check))
      } else if(check == "criticalCheck3") {
        .newSummaryRow = c(.newSummaryRow, setNames(.currCritCheck$nExtraVars,check))
      } else if(is.null(.currCritCheck)){
        .newSummaryRow = c(.newSummaryRow, setNames(NA, check))
      } else {
        .newSummaryRow = c(.newSummaryRow, setNames(ifelse(.currCritCheck$pass, "Pass", "Fail"),check))
      }
    }

    # Assign column names for output list
    .criticalCheckSummary <- stats::setNames(rbind(.criticalCheckSummary, .newSummaryRow), c("dataset"
                                                                                             ,c("cc1", "cc2", "cc3", "cc4"
                                                                                                ,"cc5", "cc6", "cc7", "cc8"
                                                                                                ,"cc9")))
  }
  
  return(.criticalCheckSummary)
}