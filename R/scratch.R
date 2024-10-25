# remotes::install_github("skreider-ce/registrydqchecksreportdown")
# remotes::install_github("skreider-ce/registrydqchecks")
# #
# 
# validateCodebook(codebookUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - AD/DQ checks/Documentation/AD_codebook_2024-06-06.xlsx"
#                   ,datasetNames = c("exvisit", "exlab", "exdrugexp"))
# 
# 
# 


# checks <- readRDS("C:/Users/ScottKreider/Documents/scrap/exampleOutput/ad_2024-10-01_2024-10-16_1602_checks.rds")
# manualNcChecks <- checks$nonCriticalChecks

# MUST SYNC THIS FOLDER
#   ADD THIS URL TO config.R files
#   DIRECT URL TO site_data_clean.csv CSV FILE
# .configSiteInfoUrl <- "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - Site and Provider Data/data/site_data_clean.csv"
# 
# 
# # library(registrydqchecksreportdown)
# # library(registrydqchecks)
# outputUrl <- runRegistryChecks(.registry = "ad"
#                   ,.prelimDataFolderUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - AD/monthly/2024/2024-10-01/"
#                   ,.prelimDataPullDate = "2024-10-01"
#                   ,.lastMonthDataFolderUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - AD/monthly/2024/2024-09-06/"
#                   ,.lastMonthDataPullDate = "2024-09-06"
#                   ,.codebookUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - AD/monthly/2024/2024-10-01/AD_codebook_2024-10-01.xlsx"
#                   ,.siteInfoUrl = .configSiteInfoUrl
#                   ,.datasetsToCheck = c("exvisit", "exlab", "exdrugexp")
#                   ,.nonCriticalChecks = NULL
#                   ,.outputUrl = "C:/Users/ScottKreider/Documents/scrap/exampleOutput/ad/2024/"
#                   ,.isR = TRUE)

# romOutputFolder <- "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat and Epi Team Site - Biostat Registry Data Quality Reports/"
# copyRomListingToFolder(.reportOutputUrl = outputUrl
#                        ,.romReportUrl = glue::glue("{romOutputFolder}ad/2024/2024-06/"))





# checks <- readRDS("C:/Users/ScottKreider/Documents/scrap/exampleOutput/aa_2024-09-16_2024-09-19_0927_checks.rds")
# manualNcChecks <- checks$nonCriticalChecks
# 
# # MUST SYNC THIS FOLDER
# #   ADD THIS URL TO config.R files
# #   DIRECT URL TO site_data_clean.csv CSV FILE
# .configSiteInfoUrl <- "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - Site and Provider Data/data/site_data_clean.csv"
# 
# validateCodebook(codebookUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - AA/monthly/2024/2024-09-05/Analytic Data/AA_codebook_2024-09-05.xlsx"
#                   ,datasetNames = c("AA_visits", "AA_drugevents", "AA_labimg"))
# 
# library(registrydqchecksreportdown)
# library(registrydqchecks)
# outputUrl <- runRegistryChecks(.registry = "aa"
#                   ,.prelimDataFolderUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - AA/monthly/2024/2024-09-05/Analytic Data/"
#                   ,.prelimDataPullDate = "2024-09-05"
#                   ,.lastMonthDataFolderUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - AA/monthly/2024/2024-08-05/Analytic Data/"
#                   ,.lastMonthDataPullDate = "2024-08-05"
#                   ,.codebookUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - AA/monthly/2024/2024-09-05/Analytic Data/AA_codebook_2024-09-05.xlsx"
#                   ,.siteInfoUrl = .configSiteInfoUrl
#                   ,.datasetsToCheck = c("AA_visits", "AA_drugevents", "AA_labimg")
#                   ,.nonCriticalChecks = manualNcChecks
#                   ,.outputUrl = "C:/Users/ScottKreider/Documents/scrap/exampleOutput/aa/"
#                   ,.isR = TRUE)




# checks <- NULL
# manualNcChecks <- NULL
# 
# # MUST SYNC THIS FOLDER
# #   ADD THIS URL TO config.R files
# #   DIRECT URL TO site_data_clean.csv CSV FILE
# .configSiteInfoUrl <- "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - Site and Provider Data/data/site_data_clean.csv"
# 
# 
# library(registrydqchecksreportdown)
# library(registrydqchecks)
# outputUrl <- runRegistryChecks(.registry = "nmo"
#                   ,.prelimDataFolderUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - NMO/monthly/2024/2024-09-01/Analytic Data/"
#                   ,.prelimDataPullDate = "2024-09-01"
#                   ,.lastMonthDataFolderUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - NMO/monthly/2024/2024-08-01/Analytic Data/"
#                   ,.lastMonthDataPullDate = "2024-08-01"
#                   ,.codebookUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - NMO/monthly/2024/2024-09-01/Analytic Data/NMO_codebook_2024-09-01.xlsx"
#                   ,.siteInfoUrl = .configSiteInfoUrl
#                   ,.datasetsToCheck = c("exvisit")
#                   ,.nonCriticalChecks = NULL
#                   ,.outputUrl = "C:/Users/ScottKreider/Documents/scrap/exampleOutput/nmo/"
#                   ,.isR = TRUE)



# library(registrydqchecksreportdown)
# library(registrydqchecks)
# 
# .registry = "ms"
# .prelimDataFolderUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - MS/monthly/2024/2024-09-05/final/"
# .prelimDataPullDate = "2024-09-05"
# .dataPullYear = "2024"
# .lastMonthDataFolderUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - MS/monthly/2024/2024-08-05/final/"
# .lastMonthDataPullDate = "2024-08-05"
# .codebookUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - MS/documentation/Codebook/ms_codebook.xlsx"
# .datasetsToCheck = c("ms_dwsub1", "ms_drugexp", "ms_dmlabimg")
# .outputUrl = glue::glue("C:/Users/ScottKreider/Documents/scrap/exampleOutput/{.registry}/{.dataPullYear}/{.prelimDataPullDate}/")
# .isR = FALSE
# 
# validateCodebook(codebookUrl = .codebookUrl
#                   ,datasetNames = c("ms_dwsub1", "ms_drugexp", "ms_dmlabimg"))
# 
# checks <- readRDS("C:/Users/ScottKreider/Documents/scrap/exampleOutput/ms_2024-08-05_2024-08-19_1539_checks.rds")
# manualNcChecks <- checks$nonCriticalChecks
# 
# # MUST SYNC THIS FOLDER
# #   ADD THIS URL TO config.R files
# #   DIRECT URL TO site_data_clean.csv CSV FILE
# baseSiteInfoUrl <- "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - Site and Provider Data/data/site_data_clean.csv"
# 
# # library(profvis)
# # profvis::profvis(
# runRegistryChecks(.registry = .registry
#                   ,.prelimDataFolderUrl = .prelimDataFolderUrl
#                   ,.prelimDataPullDate = .prelimDataPullDate
#                   ,.lastMonthDataFolderUrl = .lastMonthDataFolderUrl
#                   ,.lastMonthDataPullDate = .lastMonthDataPullDate
#                   ,.codebookUrl = .codebookUrl
#                   ,.siteInfoUrl = baseSiteInfoUrl
#                   ,.datasetsToCheck = .datasetsToCheck
#                   ,.nonCriticalChecks = NULL
#                   ,.outputUrl = .outputUrl
#                   ,.isR = FALSE)



# .registry = "raj"
# .prelimDataFolderUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - RA Japan/monthly/2024/2024-09-05/Analytical_Data/"
# .prelimDataPullDate = "2024-09-05"
# .dataPullYear = "2024"
# .lastMonthDataFolderUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - RA Japan/monthly/2024/2024-08-05/Analytical_Data/"
# .lastMonthDataPullDate = "2024-08-05"
# .codebookUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - RA Japan/monthly/2024/2024-09-05/Analytical_Data/RA_Japan_Codebook_2024-09-05.xlsx"
# .datasetsToCheck = c("R_RA_Japan_analytic_file")
# .outputUrl = glue::glue("C:/Users/ScottKreider/Documents/scrap/store/{.registry}/{.dataPullYear}/{.prelimDataPullDate}/")
# .isR = TRUE
# 
# validateCodebook(codebookUrl = .codebookUrl
#                   ,datasetNames = c("R_RA_Japan_analytic_file"))
# 
# checks <- readRDS("C:/Users/ScottKreider/Documents/scrap/exampleOutput/raj_2024-08-05_2024-08-27_1252_checks.rds")
# manualNcChecks <- checks$nonCriticalChecks
# 
# # MUST SYNC THIS FOLDER
# #   ADD THIS URL TO config.R files
# #   DIRECT URL TO site_data_clean.csv CSV FILE
# baseSiteInfoUrl <- "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - Site and Provider Data/data/site_data_clean.csv"
# 
# 
# outputUrl <- runRegistryChecks(.registry = .registry
#                   ,.prelimDataFolderUrl = .prelimDataFolderUrl
#                   ,.prelimDataPullDate = .prelimDataPullDate
#                   ,.lastMonthDataFolderUrl = .lastMonthDataFolderUrl
#                   ,.lastMonthDataPullDate = .lastMonthDataPullDate
#                   ,.codebookUrl = .codebookUrl
#                   ,.siteInfoUrl = baseSiteInfoUrl
#                   ,.datasetsToCheck = .datasetsToCheck
#                   ,.nonCriticalChecks = manualNcChecks
#                   ,.outputUrl = .outputUrl
#                   ,.isR = .isR)



# remotes::install_github("skreider-ce/registrydqchecksreportdown")
# remotes::install_github("skreider-ce/registrydqchecks")
# 
# library(registrydqchecksreportdown)
# library(registrydqchecks)
# 
# .registry = "ibd"
# .prelimDataFolderUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - IBD/monthly/2024/2024-07-01/Analytic Data/"
# .prelimDataPullDate = "2024-07-01"
# .dataPullYear = "2024"
# .lastMonthDataFolderUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - IBD/monthly/2024/2024-06-01/Analytic Data/"
# .lastMonthDataPullDate = "2024-06-01"
# .codebookUrl = "C:/Users/ScottKreider/Documents/scrap/exampleOutput/ibdtest/IBD_codebook_2024-07-01.xlsx"
# .datasetsToCheck = c("IBD_Analytic_file")
# .outputUrl = glue::glue("C:/Users/ScottKreider/Documents/scrap/exampleOutput/ibdtest/{.registry}/{.dataPullYear}/{.prelimDataPullDate}/")
# .isR = TRUE
# 
# validateCodebook(codebookUrl = .codebookUrl
#                   ,datasetNames = c("IBD_Analytic_file"))
# 
# checks <- NULL
# manualNcChecks <- NULL
# 
# # library(profvis)
# # profvis::profvis(
# runRegistryChecks(.registry = .registry
#                   ,.prelimDataFolderUrl = .prelimDataFolderUrl
#                   ,.prelimDataPullDate = .prelimDataPullDate
#                   ,.lastMonthDataFolderUrl = .lastMonthDataFolderUrl
#                   ,.lastMonthDataPullDate = .lastMonthDataPullDate
#                   ,.codebookUrl = .codebookUrl
#                   ,.datasetsToCheck = .datasetsToCheck
#                   ,.nonCriticalChecks = NULL
#                   ,.outputUrl = .outputUrl
#                   ,.isR = FALSE)
# # )



# remotes::install_github("skreider-ce/registrydqchecksreportdown")
# remotes::install_github("skreider-ce/registrydqchecks")

# library(registrydqchecksreportdown)
# library(registrydqchecks)
# 
# .configSiteInfoUrl <- "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - Site and Provider Data/data/site_data_clean.csv"
# 
# .registry = "pso"
# .prelimDataFolderUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - PsO/monthly/2024/2024-10-10/"
# .prelimDataPullDate = "2024-10-10"
# .dataPullYear = "2024"
# .lastMonthDataFolderUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - PsO/monthly/2024/2024-09-10/"
# .lastMonthDataPullDate = "2024-09-10"
# .codebookUrl = "C:/Users/ScottKreider/Documents/scrap/exampleOutput/psotest/PsO Codebook_visits.xlsx"
# .datasetsToCheck = c("exdrugexp")
# .outputUrl = glue::glue("C:/Users/ScottKreider/Documents/scrap/store/{.registry}/{.dataPullYear}/{.prelimDataPullDate}/")
# .isR = FALSE
# 
# checks <- NULL
# manualNcChecks <- NULL
# 
# validateCodebook(codebookUrl = "C:/Users/ScottKreider/Documents/scrap/exampleOutput/psotest/PsO Codebook_visits.xlsx"
#                   ,datasetNames = c("exdrugexp"))
# 
# runRegistryChecks(.registry = .registry
#                   ,.prelimDataFolderUrl = .prelimDataFolderUrl
#                   ,.prelimDataPullDate = .prelimDataPullDate
#                   ,.lastMonthDataFolderUrl = .lastMonthDataFolderUrl
#                   ,.lastMonthDataPullDate = .lastMonthDataPullDate
#                   ,.codebookUrl = .codebookUrl
#                   ,.siteInfoUrl = .configSiteInfoUrl
#                   ,.datasetsToCheck = .datasetsToCheck
#                   ,.nonCriticalChecks = NULL
#                   ,.outputUrl = .outputUrl
#                   ,.isR = FALSE)


# ncChecks <- list()

# Steps:
#   1) Pull in Codebook
#   2) Run codebookNcChecks and assign ncChecks[[dsName]][["codebookChecks"]] to codebook checks
#   3) (If manual checks) Loop through and add the manual checks to the ncCheck listing

# ncChecks <- runCodebookNcChecks(.dsName, .codebooks[[.dsName]])
# 
# returns(
#   list(
#     "dsName1" = list(
#       "codebookNcCheck1" = list()
#       ,"codebookNcCheck2" = list()
#     )
#     ,"dsName2" = list(
#       "codebookNcCheck1" = list()
#       ,"codebookNcCheck2" = list()
#     )
#     ,"dsName3" = list(
#       "codebookNcCheck1" = list()
#       ,"codebookNcCheck2" = list()
#     )
#   )
# )
# 
# for(dsName in .datasetsToCheck){
#   ncChecks[[dsName]][["codebookChecks"]] <- codebookNcChecks[[dsName]]
#   for(checkName in names(manualNcChecks[[dsName]])){
#     ncChecks[[dsName]][[checkName]] <- manualNcChecks[[dsName]][[checkName]]
#   }
# }


# .dsName = "exvisit"
# 
# .prelimDataFolderUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - AD/monthly/2024/2024-02-01/"
# .prelimDataPullDate = "2024-02-01"
# 
# copyDatasetsToLocation(
#   .datasetsToCopy = c("exvisit", "exlab", "exdrugexp")
#   ,.prelimDataFolderUrl = .prelimDataFolderUrl
#   ,.prelimDataPullDate = .prelimDataPullDate
#   ,.folderToCopyTo = "C:/Users/ScottKreider/Documents/scrap/lmnopqr/"
#   ,.isR = TRUE
#   ,.remove = TRUE
# )
