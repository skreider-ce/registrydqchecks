#' runCategoricalValueChecks Run a check to ensure categorical variables have the appropriate values
#'
#' @return Results of the check
runCategoricalValueChecks <- function(.dsName
                                      ,.dsToCheck
                                      ,.codebookVariables
                                      ,.uniqueKeys){
  
  # .dsToCheck <- .dsToCheck |>
  #   haven::as_factor()
  # 
  # .varsToCheck <- .codebookVariables |>
  #   dplyr::filter(!is.na(catValues)) |>
  #   dplyr::select(varName, catValues) |>
  #   mutate(split = strsplit(catValues, ",")
  #          ,nums = regmatches(split, regexpr("\\d+(?=\\s*=)", split, perl = TRUE)))
  # 
  # .categoricalValueChecks <- data.frame()
  

  return(NULL)
}

