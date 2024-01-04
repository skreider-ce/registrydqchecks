# Checking duplicate unique keys
source("./R/02_criticalChecks/01_duplicateUniqueIds.R")

exvisit_R_datasetUrl <- glue("{dsFolderUrl}/2023/2023-12-04/exvisit_2023-12-04.rds")
exvisit_R_dsToCheck <- pullData(exvisit_R_datasetUrl,TRUE)
checkForDuplicateUniqueIds(exvisit_R_dsToCheck,id,visitdate)

exlab_R_datasetUrl <- glue("{dsFolderUrl}/2023/2023-12-04/exlab_2023-12-04.rds")
exlab_R_dsToCheck <- pullData(exlab_R_datasetUrl,TRUE)
checkForDuplicateUniqueIds(exlab_R_dsToCheck,id,labdatet,edcvisitnum)

exdrugexp_R_datasetUrl <- glue("{dsFolderUrl}/2023/2023-12-04/exdrugexp_2023-12-04.rds")
exdrugexp_R_dsToCheck <- pullData(exdrugexp_R_datasetUrl,TRUE)
checkForDuplicateUniqueIds(exlab_R_dsToCheck,id,drgsrtkey,drgexpid)


exvisit_S_datasetUrl <- glue("{dsFolderUrl}/2023/2023-12-04/exvisit_2023-12-04.dta")
exvisit_S_dsToCheck <- pullData(exvisit_S_datasetUrl,FALSE)
checkForDuplicateUniqueIds(exvisit_S_dsToCheck,id,visitdate)

exlab_S_datasetUrl <- glue("{dsFolderUrl}/2023/2023-12-04/exlab_2023-12-04.dta")
exlab_S_dsToCheck <- pullData(exlab_S_datasetUrl,FALSE)
checkForDuplicateUniqueIds(exlab_S_dsToCheck,id,labdatet,edcvisitnum)

exdrugexp_S_datasetUrl <- glue("{dsFolderUrl}/2023/2023-12-04/exdrugexp_2023-12-04.dta")
exdrugexp_S_dsToCheck <- pullData(exdrugexp_S_datasetUrl,FALSE)




rm(list = ls())
