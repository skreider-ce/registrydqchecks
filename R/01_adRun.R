runRegistryChecks <- function(.prelimDataFolderUrl
                              ,.prelimDataPullDate
                              ,.lastMonthDataFolderUrl
                              ,.lastMonthDataPullDate
                              ,.codebookUrl
                              ,.datasetsToCheck
                              ,.outputUrl
                              ,.isR){

  ############################
  .codebooks <- list()
  .dataToCheck <- list()
  .dataToCompare <- list()
  .essentialVariables <- list()
  .uniqueKeys <- list()
  .critCheckOutput <- list()
  
  for(.dsName in .datasetsToCheck){
    .codebooks[[.dsName]] <- pullCodebookFromExcelFile(.codebookUrl, .dsName)
    .dataToCheck[[.dsName]] <- pullData(glue::glue("{.prelimDataFolderUrl}/{.dsName}_{.prelimDataPullDate}"), .isR)
    .dataToCompare[[.dsName]] <- pullData(glue::glue("{.lastMonthDataFolderUrl}/{.dsName}_{.lastMonthDataPullDate}"), .isR)

    .uniqueKeys[[.dsName]] <- .codebooks[[.dsName]] |>
      dplyr::filter(uniqueKey == 1) |>
      dplyr::select(varName)
    
    .essentialVariables[[.dsName]] <- .codebooks[[.dsName]] |>
      dplyr::filter(essential == 1) |>
      dplyr::select(varName, acceptableMissingness, nonExtremeMissingness)
    
    .critCheckOutput[[.dsName]] <- criticalChecks(
                                      data.frame(.dataToCheck[[.dsName]])
                                      ,data.frame(.dataToCompare[[.dsName]])
                                      ,.essentialVariables[[.dsName]]$varName
                                      ,names(.dataToCompare[[.dsName]])
                                      ,.uniqueKeys[[.dsName]]$varName)
  }

  submitToDataStore(.registry,.prelimDataPullDate,.outputUrl,.critCheckOutput)
  
  regdqchecks::runApplication(glue::glue("{.outputUrl}/checks"))

  return(.returnOutput)
}

