#' runNumericRangeChecks Run a check to ensure numeric variables fall within an appropriate range
#'
#' @param .dsName The name of the dataset being checked
#' @param .dsToCheck The dataset being checked
#' @param .codebookVariables The codebook variabled needed for this specific check
#' @param .uniqueKeys The unique keys for the dataset being checked
#'
#' @return Results of the check
runNumericRangeChecks <- function(.dsName
                                  ,.dsToCheck
                                  ,.codebookVariables
                                  ,.uniqueKeys){
  
  # Pull off all the numeric variables indicated with a range in the codebook
  .varsToCheck <- .codebookVariables |>
    dplyr::filter(!is.na(numRange)) |>
    dplyr::select(varName, numRange) |>
    dplyr::mutate(
      numRangeLower = as.numeric(sub("\\[(.*),.*\\]", "\\1", numRange))
      ,numRangeUpper = as.numeric(sub("\\[.*,(.*)\\]", "\\1", numRange))
    )
  
  .numericRangeChecks <- data.frame()
  
  # Loop through each numeric variable and perform the range checks
  for(.varName1 in .varsToCheck$varName){
    tryCatch({
      .currentCheckVar <- .varsToCheck |>
        dplyr::filter(varName == {{.varName1}})
      
      .subsetDsToCheck <- .dsToCheck |>
        dplyr::select(dplyr::all_of(.uniqueKeys), !!.varName1) |>
        dplyr::filter(!is.na(get(.varName1))) |>
        dplyr::filter(get(.varName1) < .currentCheckVar$numRangeLower | get(.varName1) > .currentCheckVar$numRangeUpper) |>
        dplyr::mutate(
          dataset = .dsName
          ,variableName = .varName1
          ,expectedUpper = .currentCheckVar$numRangeUpper
          ,expectedLower = .currentCheckVar$numRangeLower
          ,numValue = as.numeric(get(.varName1))
        ) |>
        dplyr::select(
          dplyr::all_of(.uniqueKeys), dataset, numValue, variableName, expectedLower, expectedUpper
        )
      
      .numericRangeChecks <- dplyr::bind_rows(.numericRangeChecks, .subsetDsToCheck)
    }
    ,warning = function(w){
      print(paste("Warning caught:", conditionMessage(w)))
      print(paste("VarName:", .varName1))
    }
    ,error = function(e){
      print(paste("Error caught:", conditionMessage(e)))
      print(paste("VarName:", .varName1))
    }
    )
    
  }

  return(.numericRangeChecks)
}

