#' @export
#' 
#' @importFrom readxl read_xlsx
#' @importFrom janitor clean_names
pullCodebookFromExcelFile <- function(.fileUrl,.sheetName){
  
  .colNames <- c(
    "varName"
    ,"varLabel"
    ,"catValues"
    ,"numRangeLower"
    ,"numRangeUpper"
    ,"uniqueKey"
    ,"essential"
    ,"acceptableMissingness"
    ,"nonExtremeMissingness"
    ,"requiredNonMissing"
  )
  
  .pulledVars <- readxl::read_xlsx(.fileUrl
                                   ,sheet = .sheetName)

  return(.pulledVars[.colNames])
}

