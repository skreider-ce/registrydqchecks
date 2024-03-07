#' runRangeAndValueChecks Run nc1 which checks the numeric and categorical variables against their supposed values
#'
#' @param .dsName The name of the dataset being checked
#' @param .dsToCheck The dataset to run the checks on
#' @param .codebookVariables The codebook variables for this specific check
#' @param .uniqueKeys The unique keys for the dataset being checked
#'
#' @return The results of the numeric range and categorical value checks
runRangeAndValueChecks <- function(.dsName
                                   ,.dsToCheck
                                   ,.codebookVariables
                                   ,.uniqueKeys){
  
  # varName, essential, acceptableMissingness, missingnessThresholdMultiplier, skipLogic, catValues, numRange
  
  .ncCheck1Num <- runNumericRangeChecks(.dsName = .dsName
                                        ,.dsToCheck = .dsToCheck
                                        ,.codebookVariables = .codebookVariables
                                        ,.uniqueKeys = .uniqueKeys)
  .ncCheck1Cat <- runCategoricalValueChecks(.dsName = .dsName
                                            ,.dsToCheck = .dsToCheck
                                            ,.codebookVariables = .codebookVariables
                                            ,.uniqueKeys = .uniqueKeys)
  
  .ncCheck1Output <- dplyr::bind_rows(.ncCheck1Num, .ncCheck1Cat) |>
    dplyr::arrange(variableName)
    
  
  .checkOutput <- list(
    "checkTitle" = "Values of numeric variables are within expected ranges and categorical variables are within expected levels"
    ,"checkDescription" = "Confirm that values fall within a prespecified range (for continuous variables) or within a prespecified list of values (for discrete variables)."
    ,"checkShortDescription" = "numeric and categorical value checks"
    ,"pass" = ifelse(nrow(.ncCheck1Num) > 0, FALSE, TRUE)
    ,"values" = list(
      "n" = nrow(.ncCheck1Num) + nrow(.ncCheck1Cat)
      ,"N" = NA
      ,"pct" = NA
    )
    ,"listing" = .ncCheck1Output
  )
  
  return(.checkOutput)
}

