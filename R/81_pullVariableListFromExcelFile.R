#' (internal function) Pull a list of variables from a specific column in a specific excel file
#'
#' @param .fileUrl A text url to the location of the Excel file
#' @param .fileName A text string with the name of the file
#' @param .sheetName A text string with the name of the sheet to pull from
#' @param .colName A character vector with the names of the columns to pull from
#'
#' @returns A dataframe that contains the columns that have been specified
#'
#' @export
#' 
#' @importFrom glue glue
#' @importFrom readxl read_xlsx
pullVariableListFromExcelFile <- function(.fileUrl,.fileName,.sheetName,.colName){

  .pulledVars <- readxl::read_xlsx(
    glue::glue("{.fileUrl}/{.fileName}.xlsx")
    ,sheet = .sheetName
  )

  return(.pulledVars[[.colName]])
}

