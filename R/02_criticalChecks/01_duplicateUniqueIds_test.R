# Checking duplicate unique keys
source("./R/02_criticalChecks/01_duplicateUniqueIds.R")

# No duplicate unique IDs on exvisit
exvisit_R_datasetUrl <- glue("{dsFolderUrl}/2023/2023-12-04/exvisit_2023-12-04.rds")
exvisit_R_dsToCheck <- pullData(exvisit_R_datasetUrl,TRUE)
checkForDuplicateUniqueIds(exvisit_R_dsToCheck,id,visitdate)

# Duplicate unique IDs on exvisit
checkForDuplicateUniqueIds(bind_rows(exvisit_R_dsToCheck,exvisit_R_dsToCheck),id,visitdate)

rm(list =
     c(
       "exvisit_R_datasetUrl","exvisit_R_dsToCheck"
     )
)



# No duplicate unique IDs on exlab
exlab_R_datasetUrl <- glue("{dsFolderUrl}/2023/2023-12-04/exlab_2023-12-04.rds")
exlab_R_dsToCheck <- pullData(exlab_R_datasetUrl,TRUE)
checkForDuplicateUniqueIds(exlab_R_dsToCheck,id,labdatet,edcvisitnum)

# Duplicate unique IDs on exlab
checkForDuplicateUniqueIds(bind_rows(exlab_R_dsToCheck,exlab_R_dsToCheck),id,labdatet,edcvisitnum)

rm(list =
     c(
       "exlab_R_datasetUrl","exlab_R_dsToCheck"
     )
)


# No duplicate unique IDs on exdrugexp
exdrugexp_R_datasetUrl <- glue("{dsFolderUrl}/2023/2023-12-04/exdrugexp_2023-12-04.rds")
exdrugexp_R_dsToCheck <- pullData(exdrugexp_R_datasetUrl,TRUE)
checkForDuplicateUniqueIds(bind_rows(exlab_R_dsToCheck,exlab_R_dsToCheck),id,drgsrtkey,drgexpid)

rm(list =
     c(
       "exdrugexp_R_datasetUrl","exdrugexp_R_dsToCheck"
     )
)