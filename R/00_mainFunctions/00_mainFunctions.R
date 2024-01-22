source("./R/88_crossProjectFunctions/01_pullVariableListFromExcelFile.R")
source("./R/88_crossProjectFunctions/02_pullCodeBookFromExcelFile.R")

source("./R/00_mainFunctions/01_adRun.R")
source("./R/00_mainFunctions/02_msRun.R")
source("./R/00_mainFunctions/03_psoRun.R")

source("./R/01_pullData/00_pullData.R")
source("./R/02_criticalChecks/00_criticalChecks.R")
source("./R/03_checkDataStore/00_checkDataStore.R")

# Run the registry-specific checks
#   FUNCTION: runRegistryChecks()
#
#   Input: .registry [char] = the abbreviation for the registry being run
#             ... = remaining list of variable being sent in to the specific checks
#
#   Returns: .registryCheck [list] = list of the checks that were run
#
#   TO DO:
#       1) [what needs done]
#



#' runRegistryChecks
#'
#' @param .registry Abreviation for the specific registry being run (ad, ms, pso)
#' @inheritParams criticalChecks
#'
#' @return List with results of the checks
#' @export
#'
#' @examples
runRegistryChecks <- function(.registry,...){
  # Create a list of the ... variables to use in data store submission
  .varList <- list(...)
  
  # Check which registry and run the appropriate code
  if(.registry == "ad"){
    .registryCheck <- runAd(...)
  } else if(.registry == "ms"){
    .registryCheck <- runMs(...)
  } else if(.registry == "pso"){
    .registryCheck <- runPso(...)
  }
  
  # Submit the results to the appropriate data store
  submitToDataStore(.registry,.varList$.dsYear,.varList$.dsPullDate,.registryCheck)
  
  return(.registryCheck)
}

