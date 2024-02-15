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
  openxlsx::saveWorkbook(.wb, file = glue::glue("{.listingUrl}/{.timestamp}/{.checksToOutput$criticalChecks[[.dsName]]$criticalCheck1$checkId} {.checksToOutput$criticalChecks[[.dsName]]$criticalCheck1$checkShortDescription}.xlsx"))
  
  .wb <- openxlsx::createWorkbook()
  for(.dsName in names(.checksToOutput$criticalChecks)){
    openxlsx::addWorksheet(.wb, sheetName = .dsName)
    openxlsx::writeData(.wb, sheet = .dsName, .checksToOutput$criticalChecks[[.dsName]]$criticalCheck2$omittedVars)
  }
  openxlsx::saveWorkbook(.wb, file = glue::glue("{.listingUrl}/{.timestamp}/{.checksToOutput$criticalChecks[[.dsName]]$criticalCheck2$checkId} {.checksToOutput$criticalChecks[[.dsName]]$criticalCheck2$checkShortDescription}.xlsx"))
  
  .wb <- openxlsx::createWorkbook()
  for(.dsName in names(.checksToOutput$criticalChecks)){
    openxlsx::addWorksheet(.wb, sheetName = .dsName)
    openxlsx::writeData(.wb, sheet = .dsName, .checksToOutput$criticalChecks[[.dsName]]$criticalCheck3$extraVars)
  }
  openxlsx::saveWorkbook(.wb, file = glue::glue("{.listingUrl}/{.timestamp}/{.checksToOutput$criticalChecks[[.dsName]]$criticalCheck3$checkId} {.checksToOutput$criticalChecks[[.dsName]]$criticalCheck3$checkShortDescription}.xlsx"))
  
  .wb <- openxlsx::createWorkbook()
  for(.dsName in names(.checksToOutput$criticalChecks)){
    openxlsx::addWorksheet(.wb, sheetName = .dsName)
    openxlsx::writeData(.wb, sheet = .dsName, .checksToOutput$criticalChecks[[.dsName]]$criticalCheck4$listOfVarsWithMissingLabels)
  }
  openxlsx::saveWorkbook(.wb, file = glue::glue("{.listingUrl}/{.timestamp}/{.checksToOutput$criticalChecks[[.dsName]]$criticalCheck4$checkId} {.checksToOutput$criticalChecks[[.dsName]]$criticalCheck4$checkShortDescription}.xlsx"))
  
  .wb <- openxlsx::createWorkbook()
  for(.dsName in names(.checksToOutput$criticalChecks)){
    openxlsx::addWorksheet(.wb, sheetName = .dsName)
    openxlsx::writeData(.wb, sheet = .dsName, .checksToOutput$criticalChecks[[.dsName]]$criticalCheck6$inOldAndNotInNew)
  }
  openxlsx::saveWorkbook(.wb, file = glue::glue("{.listingUrl}/{.timestamp}/{.checksToOutput$criticalChecks[[.dsName]]$criticalCheck6$checkId} {.checksToOutput$criticalChecks[[.dsName]]$criticalCheck6$checkShortDescription}.xlsx"))
  
  
  .wb <- openxlsx::createWorkbook()
  for(.dsName in names(.checksToOutput$criticalChecks)){
    openxlsx::addWorksheet(.wb, sheetName = .dsName)
    openxlsx::writeData(.wb, sheet = .dsName, .checksToOutput$criticalChecks[[.dsName]]$criticalCheck7$essentialVariablesMissingness)
  }
  openxlsx::saveWorkbook(.wb, file = glue::glue("{.listingUrl}/{.timestamp}/{.checksToOutput$criticalChecks[[.dsName]]$criticalCheck7$checkId} {.checksToOutput$criticalChecks[[.dsName]]$criticalCheck7$checkShortDescription}.xlsx"))
  
  
  .wb <- openxlsx::createWorkbook()
  for(.dsName in names(.checksToOutput$criticalChecks)){
    openxlsx::addWorksheet(.wb, sheetName = .dsName)
    openxlsx::writeData(.wb, sheet = .dsName, .checksToOutput$criticalChecks[[.dsName]]$criticalCheck8$essentialVariablesMissingness)
  }
  openxlsx::saveWorkbook(.wb, file = glue::glue("{.listingUrl}/{.timestamp}/{.checksToOutput$criticalChecks[[.dsName]]$criticalCheck8$checkId} {.checksToOutput$criticalChecks[[.dsName]]$criticalCheck8$checkShortDescription}.xlsx"))
  
  for(.dsName in names(.checksToOutput$nonCriticalChecks)){
    for(.ncCheckName in names(.checksToOutput$nonCriticalChecks[[.dsName]]$nPctList)){
      if(nrow(.checksToOutput$nonCriticalChecks[[.dsName]]$nPctList[[.ncCheckName]]$listing) > 0){
        .wb <- openxlsx::createWorkbook()
        openxlsx::addWorksheet(.wb, sheetName = .dsName)
        openxlsx::writeData(.wb, sheet = .dsName, .checksToOutput$nonCriticalChecks[[.dsName]]$nPctList[[.ncCheckName]]$listing)
        openxlsx::saveWorkbook(.wb, file = glue::glue("{.listingUrl}/{.timestamp}/{.dsName} {.ncCheckName} {.checksToOutput$nonCriticalChecks[[.dsName]]$nPctList[[.ncCheckName]]$checkShortDescription}.xlsx"))              
      }

    }
  }
}


