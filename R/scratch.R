# # Choose from aa, ad, gpp, ibd, ms, nmo, psa, pso, ra, raj
# .registryAbbreviation <- "raj"
# 
# .dataPullYear <- "2024"
# .dataPullFolderDate <- "2024-12-05"
# .dataPullDate <- "2024-12-05"
# 
# .lastMonthDataPullYear <- "2024"
# .lastMonthDataPullFolderDate <- "2024-11-05"
# .lastMonthDataPullDate <- "2024-11-05"
# 
# source("config.R")
# 
# # validateCodebook(codebookUrl = .testCodebookUrl[[.registryAbbreviation]]
# #                   ,datasetNames = .testDataSetsToCheck[[.registryAbbreviation]])
# 
# # checks <- readRDS("C:/Users/ScottKreider/Documents/scrap/exampleOutput/ad_2024-10-01_2024-10-16_1602_checks.rds")
# # manualNcChecks <- checks$nonCriticalChecks
# 
# outputUrl <- runRegistryChecks(.registry = .registryAbbreviation
#                   ,.prelimDataFolderUrl = .testDataFolderUrl[[.registryAbbreviation]]
#                   ,.prelimDataPullDate = .dataPullDate
#                   ,.lastMonthDataFolderUrl = .testLastMonthDataFolderUrl[[.registryAbbreviation]]
#                   ,.lastMonthDataPullDate = .lastMonthDataPullDate
#                   ,.codebookUrl = .testCodebookUrl[[.registryAbbreviation]]
#                   ,.siteInfoUrl = .configSiteInfoUrl
#                   ,.cdmRomReportUrl = .exampleRomOutputFolder
#                   ,.datasetsToCheck = .testDataSetsToCheck[[.registryAbbreviation]]
#                   ,.nonCriticalChecks = NULL
#                   ,.outputUrl = glue::glue("{.reportOutputUrl}{.registryAbbreviation}/{.dataPullYear}/{.dataPullDate}/")
#                   ,.isR = .testIsR[[.registryAbbreviation]])
# 
# # copyRomListingToFolder(.reportOutputUrl = outputUrl
# #                        ,.romReportUrl = .exampleRomOutputFolder
# #                        ,.registry = .registryAbbreviation
# #                        ,.dataPullDate = .dataPullDate
# #                        ,.overwrite = TRUE)
