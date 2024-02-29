#' runRangeAndValueChecks Run nc1 which checks the numeric and categorical variables against their supposed values
#'
#' @return The results of the numeric range and categorical value checks
runRangeAndValueChecks <- function(){
  .ncCheck1Num <- runNumericRangeChecks()
  .ncCheck1Cat <- runCategoricalValueChecks()
  
  .checkOutput <- list(
    "checkTitle" = "Values of numeric variables are within expected ranges and categorical variables are within expected levels"
    ,"checkDescription" = "Confirm that values fall within a prespecified range (for continuous variables) or within a prespecified list of values (for discrete variables)."
    ,"checkShortDescription" = "numeric and categorical value checks"
    ,"pass" = NULL
    ,"values" = list(
      "n" = NULL
      ,"N" = NULL
      ,"pct" = NULL
    )
    ,"listing" = NULL
  )
  
  return(.checkOutput)
}

