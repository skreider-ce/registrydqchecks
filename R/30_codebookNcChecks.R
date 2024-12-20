#' codebookNcChecks Run the codebook-specific noncritical checks and return the values
#'
#' @param .dsName Name of the dataset being checked
#' @param .dsToCheck The dataset being checked
#' @param .compDsToCheck The comparator dataset being checked
#' @param .codebookVariables The variables from the codebook to run the checks
#' @param .uniqueKeys A character vector of the unique keys for the given dataset
#'
#' @return .resultsOfCodebookNcChecks results of the codebookNcChecks
codebookNcChecks <- function(.dsName
                             ,.dsToCheck
                             ,.compDsToCheck
                             ,.codebookVariables
                             ,.uniqueKeys){

  .ncCheck1 <- runRangeAndValueChecks(.dsName = .dsName
                                      ,.dsToCheck = .dsToCheck
                                      ,.codebookVariables = .codebookVariables
                                      ,.uniqueKeys = .uniqueKeys)
  .ncCheck3 <- runReasonableMissingnessCheck(.dsToCheck = .dsToCheck
                                             ,.codebookVariables = .codebookVariables)
  .ncCheck4 <- runMonthlyMissingnessCheck(.dsToCheck = .dsToCheck
                                          ,.compDsToCheck = .compDsToCheck
                                          ,.codebookVariables = .codebookVariables)
  
  .resultsOfCodebookNcChecks <- list(
    "nc1" = .ncCheck1
    ,"nc3" = .ncCheck3
    ,"nc4" = .ncCheck4
  )
  
  return(.resultsOfCodebookNcChecks)  
}

