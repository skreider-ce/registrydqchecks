#' codebookNcChecks Run the codebook-specific noncritical checks and return the values
#'
#' @param .dsName Name of the dataset being checked
#' @param .dsToCheck The dataset being checked
#' @param .compDsToCheck The comparator dataset being checked
#' @param .codebookVariables The variables from the codebook to run the checks
#'
#' @return .resultsOfCodebookNcChecks results of the codebookNcChecks
codebookNcChecks <- function(.dsName
                             ,.dsToCheck
                             ,.compDsToCheck
                             ,.codebookVariables){

  .ncCheck1 <- runRangeAndValueChecks()
  .ncCheck2 <- runNoMissingsCheck()
  .ncCheck3 <- runReasonableMissingnessCheck()
  .ncCheck4 <- runMonthlyMissingnessCheck()
  
  .resultsOfCodebookNcChecks <- list(
    "nc1" = .ncCheck1
    ,"nc2" = .ncCheck2
    ,"nc3" = .ncCheck3
    ,"nc4" = .ncCheck4
  )
  
  return(.resultsOfCodebookNcChecks)  
}

