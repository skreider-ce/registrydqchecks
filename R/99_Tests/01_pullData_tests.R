source("./R/01_pullData/00_pullData.R")



exvisit_R_datasetUrl <- glue("{dsFolderUrl}/2023/2023-12-04/exvisit_2023-12-04.rds")
exvisit_R_dsToCheck <- pullData(exvisit_R_datasetUrl,TRUE)

exlab_R_datasetUrl <- glue("{dsFolderUrl}/2023/2023-12-04/exlab_2023-12-04.rds")
exlab_R_dsToCheck <- pullData(exlab_R_datasetUrl,TRUE)

exdrugexp_R_datasetUrl <- glue("{dsFolderUrl}/2023/2023-12-04/exdrugexp_2023-12-04.rds")
exdrugexp_R_dsToCheck <- pullData(exdrugexp_R_datasetUrl,TRUE)





exvisit_S_datasetUrl <- glue("{dsFolderUrl}/2023/2023-12-04/exvisit_2023-12-04.dta")
exvisit_S_dsToCheck <- pullData(exvisit_S_datasetUrl,FALSE)

exlab_S_datasetUrl <- glue("{dsFolderUrl}/2023/2023-12-04/exlab_2023-12-04.dta")
exlab_S_dsToCheck <- pullData(exlab_S_datasetUrl,FALSE)

exdrugexp_S_datasetUrl <- glue("{dsFolderUrl}/2023/2023-12-04/exdrugexp_2023-12-04.dta")
exdrugexp_S_dsToCheck <- pullData(exdrugexp_S_datasetUrl,FALSE)




rm(list = ls())
