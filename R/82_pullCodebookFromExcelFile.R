#' (internal function) Pull a registrydqchecks specific codebook from a specified location
#'
#' @param .fileUrl A text url to the Excel file to pull in
#' @param .sheetName A text string with the name of the sheet to pull from
#'
#' @returns A dataframe with the columns from the file that had been specified
#'
#' @export
#' 
#' @importFrom readxl read_xlsx
#' @importFrom janitor clean_names
pullCodebookFromExcelFile <- function(.fileUrl,.sheetName){
  
  .colNames <- c(
    "varName"
    ,"varLabel"
    ,"values_to_check"
    ,"bounds_to_check"
    ,"uniqueKey"
    ,"essential"
    ,"acceptableMissingness"
    ,"nonExtremeMissingness"
    ,"missingnessThresholdMultiplier"
    ,"skipLogic"
  )
  
  .pulledVars <- readxl::read_xlsx(.fileUrl
                                   ,sheet = .sheetName)
  
  .pulledVars <- .pulledVars |>
    dplyr::rename(
      varName = `Analytic File Variable name`
      ,varLabel = `Analytic Variable label`
    )

  return(.pulledVars[.colNames])
}
