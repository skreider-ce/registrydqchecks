#' Output specified listings in xlsx format for further review
#'
#' @param .registry Name of the registry being checked
#' @param .listingUrl Url to where the listing output will live
#' @param .timestamp Timestamp of the current run
#' @param .checksToOutput Registry DQ checks to output in list form with criticalChecks and nonCriticalChecks entries
#' @param .yearMonthTimestamp The year and month of the current datapull
#' @param .dataPullDate The YYYY-MM-DD of the current datapull
#' @param .activeSites Information on the list of active sites for this registry
#'
#' @export
#'
#' @importFrom openxlsx createWorkbook addWorksheet writeData saveWorkbook
outputListings <- function(.registry, .listingUrl, .yearMonthTimestamp, .dataPullDate, .timestamp, .checksToOutput, .activeSites){
  
  # Create new workbook objects and then print information out to them
  #   For critical checks and non critical checks
  
  # Save the .xlsx listings of critical check 1
  .wb <- openxlsx::createWorkbook()
  for(.dsName in names(.checksToOutput$criticalChecks)){
    openxlsx::addWorksheet(.wb
                           ,sheetName = .dsName)
    openxlsx::writeData(.wb
                        ,sheet = .dsName
                        ,.checksToOutput$criticalChecks[[.dsName]]$criticalCheck1$listOfDuplicateRows)
  }
  openxlsx::saveWorkbook(.wb
                         ,file = glue::glue("{.listingUrl}/cc1 duplicate unique keys.xlsx")
                         ,overwrite = TRUE)
  
  # Save the .xlsx listings of critical check 2
  .wb <- openxlsx::createWorkbook()
  for(.dsName in names(.checksToOutput$criticalChecks)){
    openxlsx::addWorksheet(.wb
                           ,sheetName = .dsName)
    openxlsx::writeData(.wb
                        ,sheet = .dsName
                        ,.checksToOutput$criticalChecks[[.dsName]]$criticalCheck2$extraVars)
  }
  openxlsx::saveWorkbook(.wb
                         ,file = glue::glue("{.listingUrl}/cc2 newly added variables.xlsx")
                         ,overwrite = TRUE)
  
  # Save the .xlsx listings of critical check 3
  .wb <- openxlsx::createWorkbook()
  for(.dsName in names(.checksToOutput$criticalChecks)){
    openxlsx::addWorksheet(.wb
                           ,sheetName = .dsName)
    openxlsx::writeData(.wb
                        ,sheet = .dsName
                        ,.checksToOutput$criticalChecks[[.dsName]]$criticalCheck3$omittedVars)
  }
  openxlsx::saveWorkbook(.wb
                         ,file = glue::glue("{.listingUrl}/cc3 removed variables.xlsx")
                         ,overwrite = TRUE)
  
  # Save the .xlsx listings of critical check 4
  .wb <- openxlsx::createWorkbook()
  for(.dsName in names(.checksToOutput$criticalChecks)){
    openxlsx::addWorksheet(.wb
                           ,sheetName = .dsName)
    openxlsx::writeData(.wb
                        ,sheet = .dsName
                        ,.checksToOutput$criticalChecks[[.dsName]]$criticalCheck4$listOfVarsWithMissingLabels)
  }
  openxlsx::saveWorkbook(.wb
                         ,file = glue::glue("{.listingUrl}/cc4 unlabeled variables.xlsx")
                         ,overwrite = TRUE)
  
  # Save the .xlsx listings of critical check 6
  .wb <- openxlsx::createWorkbook()
  for(.dsName in names(.checksToOutput$criticalChecks)){
    openxlsx::addWorksheet(.wb
                           ,sheetName = .dsName)
    openxlsx::writeData(.wb
                        ,sheet = .dsName
                        ,.checksToOutput$criticalChecks[[.dsName]]$criticalCheck6$inOldAndNotInNew)
  }
  openxlsx::saveWorkbook(.wb
                         ,file = glue::glue("{.listingUrl}/cc6 removed rows.xlsx")
                         ,overwrite = TRUE)
  
  # Save the .xlsx listings of critical check 7
  .wb <- openxlsx::createWorkbook()
  for(.dsName in names(.checksToOutput$criticalChecks)){
    openxlsx::addWorksheet(.wb
                           ,sheetName = .dsName)
    openxlsx::writeData(.wb
                        ,sheet = .dsName
                        ,.checksToOutput$criticalChecks[[.dsName]]$criticalCheck7$essentialVariablesMissingness)
  }
  openxlsx::saveWorkbook(.wb
                         ,file = glue::glue("{.listingUrl}/cc7 item missingness.xlsx")
                         ,overwrite = TRUE)
  
  
  # Save the .xlsx listings of critical check 8
  .wb <- openxlsx::createWorkbook()
  for(.dsName in names(.checksToOutput$criticalChecks)){
    openxlsx::addWorksheet(.wb
                           ,sheetName = .dsName)
    openxlsx::writeData(.wb
                        ,sheet = .dsName
                        ,.checksToOutput$criticalChecks[[.dsName]]$criticalCheck8$essentialVariablesMissingness)
  }
  openxlsx::saveWorkbook(.wb
                         ,file = glue::glue("{.listingUrl}/cc8 month to month missingness.xlsx")
                         ,overwrite = TRUE)
  
  
  # Save the .xlsx listings of critical check 9
  .wb <- openxlsx::createWorkbook()
  for(.dsName in names(.checksToOutput$criticalChecks)){
    openxlsx::addWorksheet(.wb
                           ,sheetName = .dsName)
    openxlsx::writeData(.wb
                        ,sheet = .dsName
                        ,.checksToOutput$criticalChecks[[.dsName]]$criticalCheck9$listOfVarsWithUnexpectedType)
  }
  openxlsx::saveWorkbook(.wb
                         ,file = glue::glue("{.listingUrl}/cc9 variables of unexpected type.xlsx")
                         ,overwrite = TRUE)
  
  
  # Save the .xlsx listings of critical check 10
  .wb <- openxlsx::createWorkbook()
  for(.dsName in names(.checksToOutput$criticalChecks)){
    openxlsx::addWorksheet(.wb
                           ,sheetName = .dsName)
    openxlsx::writeData(.wb
                        ,sheet = .dsName
                        ,.checksToOutput$criticalChecks[[.dsName]]$criticalCheck10$listing)
  }
  openxlsx::saveWorkbook(.wb
                         ,file = glue::glue("{.listingUrl}/cc10 valid age at enrollment.xlsx")
                         ,overwrite = TRUE)
  
  
  # Initialize long listing file
  .wbLong <- openxlsx::createWorkbook()
  openxlsx::addWorksheet(.wbLong, "qualityChecks")
  currentRow <- 2
  

  # Save the .xlsx listings of codebook checks

  for(.ncCheckName in names(.checksToOutput$nonCriticalChecks[[.dsName]]$codebookChecks)){
    .wb <- openxlsx::createWorkbook()
    for(.dsName in names(.checksToOutput$nonCriticalChecks)){
      openxlsx::addWorksheet(.wb
                             ,sheetName = .dsName)
      .dsToPrint <- .checksToOutput$nonCriticalChecks[[.dsName]]$codebookChecks[[.ncCheckName]]$listing |>
        dplyr::mutate(across(where(is.list),as.character))
      
      openxlsx::writeData(.wb
                          ,sheet = .dsName
                          ,.dsToPrint)
      
      if(.checksToOutput$nonCriticalChecks[[.dsName]]$codebookChecks[[.ncCheckName]]$sendCheckToRom){
        print(glue::glue("{.dsName} - {.ncCheckName}"))
        .subsetTimeDataset <- subsetDatasetToLastYear(.checksToOutput$nonCriticalChecks[[.dsName]]$codebookChecks[[.ncCheckName]]$listing
                                                      ,"visitdate"
                                                      ,"visitdate0"
                                                      ,.dataPullDate) |>
          dplyr::mutate(across(where(is.list),as.character))
        
        .subsetSiteDataset <- subsetDatasetToActiveSites(
          .dataset = .subsetTimeDataset
          ,.siteVar1 = "site_id"
          ,.siteVar2 = "siteid"
          ,.activeSites = .activeSites
        )
        
        # .subsetTimeDataset <- .checksToOutput$nonCriticalChecks[[.dsName]]$codebookChecks[[.ncCheckName]]$listing

        if(nrow(.subsetSiteDataset) > 0){

          openxlsx::writeData(.wbLong, "qualityChecks", .checksToOutput$nonCriticalChecks[[.dsName]]$codebookChecks[[.ncCheckName]]$checkTitle, startCol = 1, startRow = currentRow)
          currentRow <- currentRow + 1
          openxlsx::writeData(.wbLong, "qualityChecks", .subsetSiteDataset, startCol = 1, startRow = currentRow)
          currentRow <- currentRow + nrow(.subsetSiteDataset) + 2                  
        }
      }
    }
    openxlsx::saveWorkbook(.wb
                           ,file = glue::glue("{.listingUrl}/{.ncCheckName} {.checksToOutput$nonCriticalChecks[[.dsName]]$codebookChecks[[.ncCheckName]]$checkShortDescription}.xlsx")
                           ,overwrite = TRUE)
  }

  
    # Save the .xlsx listings of all the nPctList manual noncritical checks
  for(.dsName in names(.checksToOutput$nonCriticalChecks)){
    for(.ncCheckName in names(.checksToOutput$nonCriticalChecks[[.dsName]]$nPctList)){
      if(nrow(.checksToOutput$nonCriticalChecks[[.dsName]]$nPctList[[.ncCheckName]]$listing) > 0){
        .wb <- openxlsx::createWorkbook()
        openxlsx::addWorksheet(.wb
                               ,sheetName = .dsName)
        openxlsx::writeData(.wb
                            ,sheet = .dsName
                            ,.checksToOutput$nonCriticalChecks[[.dsName]]$nPctList[[.ncCheckName]]$listing)
        
        if(.checksToOutput$nonCriticalChecks[[.dsName]]$nPctList[[.ncCheckName]]$sendCheckToRom){
          print(glue::glue("{.dsName} - {.ncCheckName}"))
          .subsetTimeDataset <- subsetDatasetToLastYear(.checksToOutput$nonCriticalChecks[[.dsName]]$nPctList[[.ncCheckName]]$listing
                                                        ,"visitdate"
                                                        ,"visitdate0"
                                                        ,.dataPullDate)
          
          .subsetSiteDataset <- subsetDatasetToActiveSites(
            .dataset = .subsetTimeDataset
            ,.siteVar1 = "site_id"
            ,.siteVar2 = "siteid"
            ,.activeSites = .activeSites
          )
          # .subsetTimeDataset <- .checksToOutput$nonCriticalChecks[[.dsName]]$nPctList[[.ncCheckName]]$listing
          
          if(nrow(.subsetSiteDataset) > 0){
            openxlsx::writeData(.wbLong, "qualityChecks", .checksToOutput$nonCriticalChecks[[.dsName]]$nPctList[[.ncCheckName]]$checkTitle, startCol = 1, startRow = currentRow)
            currentRow <- currentRow + 1
            openxlsx::writeData(.wbLong, "qualityChecks", .subsetSiteDataset, startCol = 1, startRow = currentRow)
            currentRow <- currentRow + nrow(.subsetSiteDataset) + 2
          }
        }

        openxlsx::saveWorkbook(.wb
                               ,file = glue::glue("{.listingUrl}/{.dsName} {.ncCheckName} {.checksToOutput$nonCriticalChecks[[.dsName]]$nPctList[[.ncCheckName]]$checkShortDescription}.xlsx")
                               ,overwrite = TRUE)
      }
    }
  }
  
  
  .columnTitles <- as.data.frame(t(c("Investigator", "Date Investigated", "Resolution", "Date Resolved", "Notes")))
  .gray_style <- openxlsx::createStyle(fgFill = "gray")
  openxlsx::writeData(.wbLong, sheet = "qualityChecks", x = .columnTitles, startCol = 15, colNames = FALSE)
  openxlsx::addStyle(.wbLong, sheet = "qualityChecks", style = .gray_style, cols = 14, rows = 1:currentRow)
  openxlsx::freezePane(.wbLong, sheet = "qualityChecks", firstActiveRow = 2)
  
  openxlsx::saveWorkbook(.wbLong
                         ,file = glue::glue("{.listingUrl}/{.registry}_{.yearMonthTimestamp}_allChecks.xlsx")
                         ,overwrite = TRUE)
}


