# Checking for successfully reading an R .rds data file
source("./R/01_pullData/01_pullRDSfromUrl.R")

# Successfully reading in an R data file
exvisit_R_datasetUrl <- glue("{dsFolderUrl}/2023/2023-12-04/exvisit_2023-12-04.rds")
exvisit_R_dsToCheck <- pullRDSfromUrl(exvisit_R_datasetUrl)

# Unsuccessfully reading in a .dta file
exvisit_S_datasetUrl <- glue("{dsFolderUrl}/2023/2023-12-04/exvisit_2023-12-04.dta")
exvisit_S_dsToCheck <- pullRDSfromUrl(exvisit_S_datasetUrl)

rm(list =
     c(
       "exvisit_R_datasetUrl","exvisit_R_dsToCheck"
       ,"exvisit_S_datasetUrl","exvisit_S_dsToCheck"
     )
)