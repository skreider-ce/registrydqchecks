# # Choose from aa, ad, gpp, ibd, ms, nmo, psa, pso, ra, raj
# .registryAbbreviation <- "ra"
# 
# .dataPullYear <- "2025"
# .dataPullFolderDate <- "2025-02-01"
# .dataPullDate <- "2025-02-01"
# 
# .lastMonthDataPullYear <- "2025"
# .lastMonthDataPullFolderDate <- "2025-01-01"
# .lastMonthDataPullDate <- "2025-01-01"
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
# #                        ,.overwrite = FALSE)
