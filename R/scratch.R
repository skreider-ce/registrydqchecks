# storeUrl <- "C:/Users/ScottKreider/Documents/scrap/store/checks/listing"
# testChecks <- readRDS("C:/Users/ScottKreider/Documents/scrap/store/checks/2023-12-04_12_07_08_checks.rds")
# timestamp <- format(Sys.time(), "%Y-%m-%d-%H-%M-%S")
# outputListings(storeUrl,timestamp,testChecks)

# testChecks <- readRDS("C:/Users/ScottKreider/Corrona LLC/Biostat and Epi Team Site - Registry Data QC Checks/registryCheckStorage/ad/2024_2024-01-04_checks.rds")
# storeUrl <- "C:/Users/ScottKreider/Documents/scrap/store/"
# registrydqchecks::submitToDataStore("ad","2023-12-04",storeUrl,testChecks)


# testChecks$exvisit$criticalCheck6$inOldAndNotInNew
# 
# library(registrydqchecksreport)
# library(registrydqchecks)
# runRegistryChecks(.prelimDataFolderUrl = "C:/Users/ScottKreider/Corrona LLC/Biostat Data Files - AD/monthly/2023/2023-12-04"
#                   ,.prelimDataPullDate = "2023-12-04"
#                   ,.lastMonthDataFolderUrl = "C:/Users/ScottKreider/Corrona LLC/Biostat Data Files - AD/monthly/2023/2023-11-03"
#                   ,.lastMonthDataPullDate = "2023-11-03"
#                   ,.codebookUrl = "C:/Users/ScottKreider/Corrona LLC/Biostat and Epi Team Site - Registry Data QC Checks/Guidance Documentation/archive/desired codebook input format.xlsx"
#                   ,.datasetsToCheck = c("exvisit", "exlab", "exdrugexp")
#                   ,.outputUrl = "C:/Users/ScottKreider/Documents/scrap/store/2023-12-04"
#                   ,.isR = TRUE)
# 
# 
# .registry = "ad"
# .prelimDataFolderUrl = "C:/Users/ScottKreider/Corrona LLC/Biostat Data Files - AD/monthly/2023/2023-12-04"
# .prelimDataPullDate = "2023-12-04"
# .lastMonthDataFolderUrl = "C:/Users/ScottKreider/Corrona LLC/Biostat Data Files - AD/monthly/2023/2023-11-03"
# .lastMonthDataPullDate = "2023-11-03"
# .codebookUrl = ""
# .datasetsToCheck = c("exvisit")
# .outputUrl = "C:/Users/ScottKreider/Documents/scrap/store/2023-12-04"
# .isR = TRUE
# 
# 
# 
# .dataToCheck <- list()
# .dataToCompare <- list()
# .essentialVariables <- list()
# .uniqueKeys <- list()
# .critCheckOutput <- list()
# .nonCritCheckOutput <- list()
# 
# for(.dsName in .datasetsToCheck){
#   .dataToCheck[[.dsName]] <- pullData(glue::glue("{.prelimDataFolderUrl}/{.dsName}_{.prelimDataPullDate}"), .isR)
#   .dataToCompare[[.dsName]] <- pullData(glue::glue("{.lastMonthDataFolderUrl}/{.dsName}_{.lastMonthDataPullDate}"), .isR)
# 
#   .uniqueKeys[[.dsName]] <- c("id", "visitdate")
# 
#   .critCheckOutput[[.dsName]] <- criticalChecks(
#     data.frame(.dataToCheck[[.dsName]])
#     ,data.frame(.dataToCompare[[.dsName]])
#     ,""
#     ,names(.dataToCompare[[.dsName]])
#     ,.uniqueKeys[[.dsName]])
# }
# 
# .checkOutput <- list(
#   "criticalCheckOutput" = .critCheckOutput
#   ,"nonCriticalCheckOutput" = NULL
# )

