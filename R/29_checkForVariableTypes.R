#' (internal function) Check if any variables have unexpected types
#'
#' @param .dsToCheck A dataframe to check
#' @param .codebookVariables The codebook variables for this specific check 
#' 
#' @returns A list with pass/fail, the number of variables with unexpected types, and a list of the variables with unexpected types
#'
#' @export
#' 
#' @importFrom dplyr filter
#' @importFrom dplyr select
#' @importFrom dplyr bind_rows
#' @importFrom tibble tibble
checkForVariableTypes <- function(.dsToCheck
                                  ,.codebookVariables){

  .unexpectedNumericVariableTypes <- tibble::tibble(
    varName = character()
    ,varType = character()
    ,expectedVarType = character()
  )
  .numericVarsToCheck <- .codebookVariables |>
    dplyr::filter(!is.na(numRange)) |>
    dplyr::select(varName)
  
  .expectedNumericTypes <- c("numeric", "integer")
  
  for(varName in unlist(.numericVarsToCheck)){
    if(!any(.expectedNumericTypes %in% class(.dsToCheck[[varName]]))){
      .newRow <- tibble::tibble(
        varName = varName
        ,varType = paste(class(.dsToCheck[[varName]]), collapse = " ")
        ,expectedVarType = paste(.expectedNumericTypes, collapse = " ")
      )
      .unexpectedNumericVariableTypes <- dplyr::bind_rows(.unexpectedNumericVariableTypes, .newRow)
    }
  }
  
  
  .unexpectedCategoricalVariableTypes <- tibble::tibble(
    varName = character()
    ,varType = character()
    ,expectedVarType = character()
  )
  .categoricalVarsToCheck <- .codebookVariables |>
    dplyr::filter(!is.na(catValues)) |>
    dplyr::select(varName)
  .expectedCategoricalTypes <- c("haven_labelled", "double", "integer")
  for(varName in unlist(.categoricalVarsToCheck)){
    if(!any(.expectedCategoricalTypes %in% class(.dsToCheck[[varName]]))){
      .newRow <- tibble::tibble(
        varName = varName
        ,varType = paste(class(.dsToCheck[[varName]]), collapse = " ")
        ,expectedVarType = paste(.expectedCategoricalTypes, collapse = " ")
      )
      .unexpectedCategoricalVariableTypes <- dplyr::bind_rows(.unexpectedCategoricalVariableTypes, .newRow)
    }
  }
  
  .mismatchedVariableTypes <- dplyr::bind_rows(.unexpectedNumericVariableTypes, .unexpectedCategoricalVariableTypes)
  
  
  # Define output list structure
  .returnOutput <- list(
    "checkId" = "cc9"
    ,"checkTitle" = "Variables are of unexpected 'type'"
    ,"checkDescription" = "For each analytic file, confirm that variables with labels are double/label and variables with ranges are numeric."
    ,"checkShortDescription" = "variables of unexpected type"
    ,"sendCheckToRom" = FALSE
    ,"pass" = ifelse(nrow(.mismatchedVariableTypes) == 0,TRUE,FALSE)
    ,"nVariablesUnexpectedType" = nrow(.mismatchedVariableTypes)
    ,"listOfVarsWithUnexpectedType" = .mismatchedVariableTypes
  )
  
  return(.returnOutput)
}
