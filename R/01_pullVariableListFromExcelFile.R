# Prerequisites
#   - An Excel file that has a column of variable names of interest
#
# GIVEN An [Excel file] with variable names of interest
#   THEN READ in the list
#     AND RETURN a [character vector] with the list of variable names

# Pull a list of variables from an Excel file and store in a character string
#   FUNCTION: pullVariableListFromExcelFile()
#
#   Input: .fileUrl [url char] = URL string to the file of interest
#           .fileName [char] = the name of the Excel file
#           .sheetName [char] = the name of the sheet you want to pull from
#           .colname [char] = the column name that has the variables of interest
#
#   Returns: A [character vector] with the variables of interest
#
#   TO DO:
#       1) [what needs done]
#

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

