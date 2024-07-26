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
    ,"catValues"
    ,"numRange"
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
    dplyr::rename_with(~ "varName", matches("(?i)analytic variable name")) |>
    dplyr::rename_with(~ "varLabel", matches("(?i)analytic variable label")) |>
    dplyr::mutate(
      acceptableMissingness = as.numeric(acceptableMissingness, na.rm = TRUE)
      ,uniqueKey = as.numeric(uniqueKey, na.rm = TRUE)
      ,essential = as.numeric(essential, na.rm = TRUE)
      ,nonExtremeMissingness = as.numeric(nonExtremeMissingness, na.rm = TRUE)
      ,missingnessThresholdMultiplier = as.numeric(missingnessThresholdMultiplier, na.rm = TRUE)
    )

  return(.pulledVars[.colNames])
}
