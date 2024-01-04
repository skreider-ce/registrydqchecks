# Checking for missing variable labels
source("./R/02_criticalChecks/04_checkForMissingVariableLabels.R")

# No missing variable labels on exvisit
exvisit_R_datasetUrl <- glue("{dsFolderUrl}/2023/2023-12-04/exvisit_2023-12-04.rds")
exvisit_R_dsToCheck <- pullData(exvisit_R_datasetUrl,TRUE)
checkForMissingVariableLabels(exvisit_R_dsToCheck)

# Missing variable labels on exvisit
checkForMissingVariableLabels(bind_rows(exvisit_R_dsToCheck,exvisit_R_dsToCheck))

rm(list =
     c(
       "exvisit_R_datasetUrl","exvisit_R_dsToCheck"
     )
)



# No missing variable labels on exlab
exlab_R_datasetUrl <- glue("{dsFolderUrl}/2023/2023-12-04/exlab_2023-12-04.rds")
exlab_R_dsToCheck <- pullData(exlab_R_datasetUrl,TRUE)
checkForMissingVariableLabels(exlab_R_dsToCheck)

# Missing variable labels on exlab
checkForMissingVariableLabels(bind_rows(exlab_R_dsToCheck,exlab_R_dsToCheck))

rm(list =
     c(
       "exlab_R_datasetUrl","exlab_R_dsToCheck"
     )
)




# No missing variable labels on exdrugexp
exdrugexp_R_datasetUrl <- glue("{dsFolderUrl}/2023/2023-12-04/exdrugexp_2023-12-04.rds")
exdrugexp_R_dsToCheck <- pullData(exdrugexp_R_datasetUrl,TRUE)
checkForMissingVariableLabels(exdrugexp_R_dsToCheck)

# Missing variable labels on exdrugexp
checkForMissingVariableLabels(bind_rows(exdrugexp_R_dsToCheck,exdrugexp_R_dsToCheck))

rm(list =
     c(
       "exdrugexp_R_datasetUrl","exdrugexp_R_dsToCheck"
     )
)

