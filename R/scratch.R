# library(registrydqchecksreport)
# library(registrydqchecksreportdown)
# library(registrydqchecks)
# 
# .registry = "ms"
# .prelimDataFolderUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - MS/monthly/2024/2024-03-05/final/"
# .prelimDataPullDate = "2024-03-05"
# .dataPullYear = "2024"
# .lastMonthDataFolderUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - MS/monthly/2024/2024-02-05/final/"
# .lastMonthDataPullDate = "2024-02-05"
# .codebookUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - MS/documentation/Codebook draft_in progress/ms_codebook.xlsx"
# .datasetsToCheck = c("ms_dwsub1")
# .outputUrl = glue::glue("C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - DQ Reports/{.registry}/{.dataPullYear}/{.prelimDataPullDate}/")
# .isR = FALSE
# 
# .dsName = "ms_dwsub1"
# 
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
# 
# 
# 


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

# checks <- readRDS("C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - DQ Reports/ad/2024/2024-02-01/2024_02_28_10_17_36/checks/2024-02-01_2024_02_28_10_17_36_checks.rds")
# manualNcChecks <- checks$nonCriticalChecks
# 
# 
# 
library(registrydqchecksreport)
library(registrydqchecksreportdown)
library(registrydqchecks)
runRegistryChecks(.registry = "ad"
                  ,.prelimDataFolderUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - AD/monthly/2024/2024-02-01/"
                  ,.prelimDataPullDate = "2024-02-01"
                  ,.lastMonthDataFolderUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - AD/monthly/2024/2024-01-04/"
                  ,.lastMonthDataPullDate = "2024-01-04"
                  ,.codebookUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat and Epi Team Site - Data Dictionary Codebook Specifications/AD_codebook_example.xlsx"
                  ,.datasetsToCheck = c("exvisit", "exlab", "exdrugexp")
                  ,.nonCriticalChecks = NULL
                  ,.outputUrl = "C:/Users/ScottKreider/Documents/scrap/store/"
                  ,.isR = TRUE)
# .dsName = "exvisit"

