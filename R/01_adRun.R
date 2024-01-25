#' @export
#' 
#' @importFrom glue glue
#' @importFrom dplyr filter select
runAd <- function(
                  .dsYear
                  ,.dsFolderDate
                  ,.dsPullDate
                  ,.compDsYear
                  ,.compDsFolderDate
                  ,.compDsPullDate
                  ,.isR){

  ############################

  .registry <- "ad"
  
  .isR <- TRUE  
  .prelimDataFolderUrl <- "C:/Users/ScottKreider/Corrona LLC/Biostat Data Files - AD/monthly/2023/2023-12-04"
  .prelimDataPullDate <- "2023-12-04"

  .lastMonthDataFolderUrl <- "C:/Users/ScottKreider/Corrona LLC/Biostat Data Files - AD/monthly/2023/2023-11-03"
  .lastMonthDataPullDate <- "2023-11-03"
  
  # Pull exvisit codebook
  .codebookUrl <- "C:/Users/ScottKreider/Corrona LLC/Biostat and Epi Team Site - Registry Data QC Checks/Guidance Documentation/archive/desired codebook input format.xlsx"
  .datasetsToCheck <- c("exvisit", "exlab", "exdrugexp")
  .outputUrl <- "C:/Users/ScottKreider/Documents/scrap/store"
  # sheet <- "exvisit"    # exdrugexp exlab
  
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
  
  library(regdqchecks)
  submitToDataStore(.registry,.prelimDataPullDate,.outputUrl,.critCheckOutput)
  regdqchecks::runApplication(glue::glue("{.outputUrl}/checks"))

  return(.returnOutput)
}

