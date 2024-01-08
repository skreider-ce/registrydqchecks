source("./R/00_mainFunctions/01_adRun.R")
source("./R/00_mainFunctions/02_msRun.R")
source("./R/00_mainFunctions/03_psoRun.R")

source("./R/01_pullData/00_pullData.R")
source("./R/02_criticalChecks/00_criticalChecks.R")



runRegistryChecks <- function(.registry,...){

  if(.registry == "ad"){
    .registryCheck <- runAd(...)  
  } else if(.registry == "ms"){
    .registryCheck <- runMs(...)  
  } else if(.registry == "pso"){
    .registryCheck <- runPso(...)  
  }
  
  return(.registryCheck)
}

