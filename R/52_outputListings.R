#' Output specified listings in xlsx format for further review
#'
#' @param .listingUrl Url to where the listing output will live
#' @param .timestamp Timestamp of the current run
#' @param .checksToOutput Registry DQ checks to output
#'
#' @export

#' @importFrom openxlsx createWorkbook addWorksheet writeData saveWorkbook
outputListings <- function(.listingUrl, .timestamp, .checksToOutput){
  
  if(!dir.exists(glue::glue("{.listingUrl}/{.timestamp}"))){
    createDataStoreFolder(glue::glue("{.listingUrl}/{.timestamp}"),subDir = FALSE)
  }
  
  .wb <- openxlsx::createWorkbook()
  for(.dsName in names(.checksToOutput)){
    openxlsx::addWorksheet(.wb, sheetName = .dsName)
    openxlsx::writeData(.wb, sheet = .dsName, .checksToOutput[[.dsName]]$criticalCheck6$inOldAndNotInNew)
  }
  openxlsx::saveWorkbook(.wb, file = glue::glue("{.listingUrl}/{.timestamp}/CC6.xlsx"))
  
  
  .wb <- openxlsx::createWorkbook()
  for(.dsName in names(.checksToOutput)){
    openxlsx::addWorksheet(.wb, sheetName = .dsName)
    openxlsx::writeData(.wb, sheet = .dsName, .checksToOutput[[.dsName]]$criticalCheck7$essentialVariablesMissingness)
  }
  openxlsx::saveWorkbook(.wb, file = glue::glue("{.listingUrl}/{.timestamp}/CC7.xlsx"))
  
  
  .wb <- openxlsx::createWorkbook()
  for(.dsName in names(.checksToOutput)){
    openxlsx::addWorksheet(.wb, sheetName = .dsName)
    openxlsx::writeData(.wb, sheet = .dsName, .checksToOutput[[.dsName]]$criticalCheck8$essentialVariablesMissingness)
  }
  openxlsx::saveWorkbook(.wb, file = glue::glue("{.listingUrl}/{.timestamp}/CC8.xlsx"))
}


