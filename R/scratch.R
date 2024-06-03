# remotes::install_github("skreider-ce/registrydqchecksreportdown")
# remotes::install_github("skreider-ce/registrydqchecks")
# #
# checks <- readRDS("C:/Users/ScottKreider/Documents/scrap/exampleOutput/ad_2024-05-03_2024-05-31_0950_checks.rds")
# manualNcChecks <- checks$nonCriticalChecks
# #
# library(registrydqchecksreportdown)
# library(registrydqchecks)
# runRegistryChecks(.registry = "ad"
#                   ,.prelimDataFolderUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - AD/monthly/2024/2024-04-02/"
#                   ,.prelimDataPullDate = "2024-04-02"
#                   ,.lastMonthDataFolderUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - AD/monthly/2024/2024-03-06/"
#                   ,.lastMonthDataPullDate = "2024-03-06"
#                   ,.codebookUrl = "C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat and Epi Team Site - Data Dictionary Codebook Specifications/AD_codebook_example.xlsx"
#                   ,.datasetsToCheck = c("exvisit", "exlab", "exdrugexp")
#                   ,.nonCriticalChecks = manualNcChecks
#                   ,.outputUrl = "C:/Users/ScottKreider/Documents/scrap/exampleOutput/"
#                   ,.isR = TRUE)

# ad_codebook <- registrydqchecks::pullCodebookFromExcelFile("C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat and Epi Team Site - Data Dictionary Codebook Specifications/AD_codebook_example.xlsx"
#                           ,"exvisit")
# 
# ad_dataset <- registrydqchecks::pullData("C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - AD/monthly/2024/archive/2024-04-02/exvisit_2024-04-02"
#                            ,.isR = TRUE)
# ms_dataset <- registrydqchecks::pullData("C:/Users/ScottKreider/OneD - Corrona LLC/Corrona LLC/Biostat Data Files - MS/monthly/2024/2024-04-05/final/ms_dwsub1_2024-04-05"
#                                          ,.isR = FALSE)
# 
# toCheck <- c("double", "haven_labelled")
# 
# dataset <- ad_dataset
# .dsToCheck <- ad_dataset
# .codebookVariables <- ad_codebook |>
#   dplyr::select(varName, essential, acceptableMissingness, missingnessThresholdMultiplier, skipLogic, catValues, numRange)
# for(varName in names(dataset)){
#   #print(glue::glue("{varName}: {all(toCheck %in% class(dataset[[varName]]))}"))
#   #print(glue::glue("{varName}: {match(c('double'),class(dataset[[varName]]))}"))
#   print(glue::glue("{varName}: {class(dataset[[varName]])}"))
# }
# 
# typeof(dataset$female_male)




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
# .outputUrl = glue::glue("C:/Users/ScottKreider/Documents/scrap/report/{.registry}/{.dataPullYear}/{.prelimDataPullDate}/")
# .isR = FALSE
# 
# # .dsName = "ms_dwsub1"
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


.dsName = "exvisit"
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
