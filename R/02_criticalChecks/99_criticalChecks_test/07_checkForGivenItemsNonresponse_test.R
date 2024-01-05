# Checking for percent missingness for given variables
source("./R/02_criticalChecks/07_checkForGivenItemsNonresponse.R")

# Successfully generate listing
checkForGivenItemsNonresponse(exvisit_dsToCheck,c("id","drink_freq"))
