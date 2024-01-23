#' @export
#' 
#' @importFrom glue glue
#' @importFrom readxl read_xlsx
pullCodebookFromExcelFile <- function(.fileUrl,.fileName,.sheetName){
  
  .codebookColumns <- c(
    "varName"
    ,"varLabel"
    ,"varType"
    ,"catValues"
    ,"numRangeLower"
    ,"numRangeUpper"
    ,"charLength"
    ,"uniqueKey"
    ,"essential"
    ,"acceptableMissingness"
    ,"nonExtremeMissingness"
    ,"requiredNonMissing"
  )
  
  .pulledVars <- readxl::read_xlsx(
    glue::glue("{.fileUrl}/{.fileName}.xlsx")
    ,sheet = .sheetName
  )
  
  return(.pulledVars[.codebookColumns])
}

