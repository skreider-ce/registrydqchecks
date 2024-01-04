# Checking for successfully reading an Stata .dta data file
source("./R/01_pullData/02_pullDTAfromUrl.R")

# Successfully reading in an Stata data file
exvisit_S_datasetUrl <- glue("{dsFolderUrl}/2023/2023-12-04/exvisit_2023-12-04.dta")
exvisit_S_dsToCheck <- pullDTAfromUrl(exvisit_S_datasetUrl)

# Unsuccessfully reading in a .rds file
exvisit_R_datasetUrl <- glue("{dsFolderUrl}/2023/2023-12-04/exvisit_2023-12-04.rds")
exvisit_R_dsToCheck <- pullDTAfromUrl(exvisit_R_datasetUrl)

rm(list =
     c(
       "exvisit_S_datasetUrl","exvisit_S_dsToCheck"
       ,"exvisit_R_datasetUrl","exvisit_R_dsToCheck"
     )
)