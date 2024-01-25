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

