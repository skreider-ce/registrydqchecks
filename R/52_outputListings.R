#' Output specified listings in xlsx format for further review
#'
#' @param .listingUrl Url to where the listing output will live
#' @param .timestamp Timestamp of the current run
#' @param .checksToOutput Registry DQ checks to output
#'
#' @export

#' @importFrom openxlsx createWorkbook addWorksheet writeData saveWorkbook
outputListings <- function(.listingUrl, .timestamp, .checksToOutput){
  
  createDataStoreFolder(glue::glue("{.listingUrl}/{.timestamp}"))
  
  .wb <- openxlsx::createWorkbook()
  for(.dsName in names(.checksToOutput$criticalChecks)){
    openxlsx::addWorksheet(.wb, sheetName = .dsName)
    openxlsx::writeData(.wb, sheet = .dsName, .checksToOutput$criticalChecks[[.dsName]]$criticalCheck1$listOfDuplicateRows)
  }
  openxlsx::saveWorkbook(.wb, file = glue::glue("{.listingUrl}/{.timestamp}/CC1 duplicate rows.xlsx"))
  
  .wb <- openxlsx::createWorkbook()
  for(.dsName in names(.checksToOutput$criticalChecks)){
    openxlsx::addWorksheet(.wb, sheetName = .dsName)
    openxlsx::writeData(.wb, sheet = .dsName, .checksToOutput$criticalChecks[[.dsName]]$criticalCheck2$omittedVars)
  }
  openxlsx::saveWorkbook(.wb, file = glue::glue("{.listingUrl}/{.timestamp}/CC2 removed variables.xlsx"))
  
  .wb <- openxlsx::createWorkbook()
  for(.dsName in names(.checksToOutput$criticalChecks)){
    openxlsx::addWorksheet(.wb, sheetName = .dsName)
    openxlsx::writeData(.wb, sheet = .dsName, .checksToOutput$criticalChecks[[.dsName]]$criticalCheck3$extraVars)
  }
  openxlsx::saveWorkbook(.wb, file = glue::glue("{.listingUrl}/{.timestamp}/CC3 new variables.xlsx"))
  
  .wb <- openxlsx::createWorkbook()
  for(.dsName in names(.checksToOutput$criticalChecks)){
    openxlsx::addWorksheet(.wb, sheetName = .dsName)
    openxlsx::writeData(.wb, sheet = .dsName, .checksToOutput$criticalChecks[[.dsName]]$criticalCheck4$listOfVarsWithMissingLabels)
  }
  openxlsx::saveWorkbook(.wb, file = glue::glue("{.listingUrl}/{.timestamp}/CC4 missing variable labels.xlsx"))
  
  .wb <- openxlsx::createWorkbook()
  for(.dsName in names(.checksToOutput$criticalChecks)){
    openxlsx::addWorksheet(.wb, sheetName = .dsName)
    openxlsx::writeData(.wb, sheet = .dsName, .checksToOutput$criticalChecks[[.dsName]]$criticalCheck6$inOldAndNotInNew)
  }
  openxlsx::saveWorkbook(.wb, file = glue::glue("{.listingUrl}/{.timestamp}/CC6 removed observations.xlsx"))
  
  
  .wb <- openxlsx::createWorkbook()
  for(.dsName in names(.checksToOutput$criticalChecks)){
    openxlsx::addWorksheet(.wb, sheetName = .dsName)
    openxlsx::writeData(.wb, sheet = .dsName, .checksToOutput$criticalChecks[[.dsName]]$criticalCheck7$essentialVariablesMissingness)
  }
  openxlsx::saveWorkbook(.wb, file = glue::glue("{.listingUrl}/{.timestamp}/CC7 monthly missingness.xlsx"))
  
  
  .wb <- openxlsx::createWorkbook()
  for(.dsName in names(.checksToOutput$criticalChecks)){
    openxlsx::addWorksheet(.wb, sheetName = .dsName)
    openxlsx::writeData(.wb, sheet = .dsName, .checksToOutput$criticalChecks[[.dsName]]$criticalCheck8$essentialVariablesMissingness)
  }
  openxlsx::saveWorkbook(.wb, file = glue::glue("{.listingUrl}/{.timestamp}/CC8 month to month missingness.xlsx"))
  
  for(.dsName in names(.checksToOutput$nonCriticalChecks)){
    for(.ncCheckName in names(.checksToOutput$criticalChecks[[.dsName]]$nonCriticalChecks$nPctList)){
      .wb <- openxlsx::createWorkbook()
      openxlsx::addWorksheet(.wb, sheetName = .dsName)
      openxlsx::writeData(.wb, sheet = .dsName, .checksToOutput$nonCriticalChecks[[.dsName]]$nPctList[[.ncCheckName]])
      openxlsx::saveWorkbook(.wb, file = glue::glue("{.listingUrl}/{.timestamp}/{.dsName} {.checksToOutput$nonCriticalChecks[[.dsName]]$nPctList[[.ncCheckName]]$checkTitle}.xlsx"))      
    }
  }
}


