# Checking for deleted rows
source("./R/02_criticalChecks/06_checkForRemovedRows.R")

test_dir <- "~/../../Corrona LLC/Biostat Data Files - AD"
test_dsFolderUrl <- glue("{sharepoint_dir}/monthly")


# Rows in old dataset that are not in new dataset
exvisit_R_datasetUrl <- glue("{test_dsFolderUrl}/2023/2023-12-04/exvisit_2023-12-04.rds")
exvisit_R_dsToCheck <- pullData(exvisit_R_datasetUrl,TRUE)

comp_exvisit_R_datasetUrl <- glue("{test_dsFolderUrl}/2023/2023-11-03/exvisit_2023-11-03.rds")
comp_exvisit_R_dsToCheck <- pullData(comp_exvisit_R_datasetUrl,TRUE)


checkForRemovedRows(exvisit_R_dsToCheck,comp_exvisit_R_dsToCheck,id,visitdate)

# All rows in the datasets are the same
checkForRemovedRows(exvisit_R_dsToCheck,exvisit_R_dsToCheck,id,visitdate)

rm(list =
     c(
       "test_dir","test_dsFolderUrl"
       ,"exvisit_R_datasetUrl","exvisit_R_dsToCheck"
       ,"comp_exvisit_R_datasetUrl","comp_exvisit_R_dsToCheck"
     )
)
