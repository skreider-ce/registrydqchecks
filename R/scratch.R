# storeUrl <- "C:/Users/ScottKreider/Documents/scrap/store/checks/listing"
# testChecks <- readRDS("C:/Users/ScottKreider/Documents/scrap/store/checks/2023-12-04_12_07_08_checks.rds")
# timestamp <- format(Sys.time(), "%Y-%m-%d-%H-%M-%S")
# outputListings(storeUrl,timestamp,testChecks)

# testChecks <- readRDS("C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat and Epi Team Site - Registry Data QC Checks/registryCheckStorage/ad/2024_2024-01-04_checks.rds")
# storeUrl <- "C:/Users/ScottKreider/Documents/scrap/store/"
# registrydqchecks::submitToDataStore("ad","2023-12-04",storeUrl,testChecks)


# remove.packages("registrydqchecksreport")
# remove.packages("registrydqchecks")

# testChecks$exvisit$criticalCheck6$inOldAndNotInNew
# 





# ncChecks <- readRDS("C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - DQ Reports/ad/2024/2024-02-01/2024_02_21_12_01_28/checks/2024-02-01_2024_02_21_12_01_28_checks.rds")$nonCriticalChecks

# 
# 
# library(registrydqchecksreport)
# library(registrydqchecksreportdown)
# library(registrydqchecks)
# runRegistryChecks(.registry = "ad"
#                   ,.prelimDataFolderUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - AD/monthly/2023/2023-12-04/"
#                   ,.prelimDataPullDate = "2023-12-04"
#                   ,.lastMonthDataFolderUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - AD/monthly/2023/2023-11-03/"
#                   ,.lastMonthDataPullDate = "2023-11-03"
#                   ,.codebookUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat and Epi Team Site - Registry Data QC Checks/Guidance Documentation/archive/desired codebook input format.xlsx"
#                   ,.datasetsToCheck = c("exvisit", "exlab", "exdrugexp")
#                   ,.nonCriticalChecks = ncChecks
#                   ,.outputUrl = "C:/Users/ScottKreider/Documents/scrap/store/ad/2023/2023-12-04/"
#                   ,.isR = TRUE)




# 
# registrydqchecksreport::runApplication("C:/Users/ScottKreider/Documents/scrap/store/ad/2023-12-04/checks/")
# 
# 
# .registry = "ad"
# .prelimDataFolderUrl = "C:/Users/ScottKreider/Corrona LLC/Biostat Data Files - AD/monthly/2023/2023-12-04/"
# .prelimDataPullDate = "2023-12-04"
# .lastMonthDataFolderUrl = "C:/Users/ScottKreider/Corrona LLC/Biostat Data Files - AD/monthly/2023/2023-11-03/"
# .lastMonthDataPullDate = "2023-11-03"
# .codebookUrl = ""
# .datasetsToCheck = c("exvisit")
# .outputUrl = "C:/Users/ScottKreider/Documents/scrap/store/2023-12-04/"
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
#     ,c()
#     ,names(.dataToCompare[[.dsName]])
#     ,.uniqueKeys[[.dsName]])
# }
# 
# .checkOutput <- list(
#   "criticalCheckOutput" = .critCheckOutput
#   ,"nonCriticalCheckOutput" = NULL
# )
# 
# View(.checkOutput)
# 

# `2024-02-01_2024_02_07_10_35_57_checks`$criticalChecks$criticalCheck4
