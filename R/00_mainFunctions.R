#' @export
runRegistryChecks <- function(.registry
                              ,.dsYear
                              ,.dsFolderDate
                              ,.dsPullDate
                              ,.compDsYear
                              ,.compDsFolderDate
                              ,.compDsPullDate
                              ,.isR){
  
  
  # function(.registry
  #          ,.prelimDataFolderUrl
  #          ,.prelimDataPullDate
  #          ,.lastMonthDataFolderUrl
  #          ,.lastMonthDataPullDate
  #          ,.codebookUrl
  #          ,.dataSetsToCheck
  #          ,.outputFolderUrl
  #          ,.isR)
  
  # Create a list of the ... variables to use in data store submission
  .varList <- list(.registry
                   ,.dsYear
                   ,.dsFolderDate
                   ,.dsPullDate
                   ,.compDsYear
                   ,.compDsFolderDate
                   ,.compDsPullDate
                   ,.isR)
  
  # Check which registry and run the appropriate code
  if(.registry == "ad"){
    .registryCheck <- runAd(.dsYear
                            ,.dsFolderDate
                            ,.dsPullDate
                            ,.compDsYear
                            ,.compDsFolderDate
                            ,.compDsPullDate
                            ,.isR)
  } else if(.registry == "ms"){
    .registryCheck <- runMs(.dsYear
                            ,.dsFolderDate
                            ,.dsPullDate
                            ,.compDsYear
                            ,.compDsFolderDate
                            ,.compDsPullDate
                            ,.isR)
  } else if(.registry == "pso"){
    .registryCheck <- runPso(.dsYear
                             ,.dsFolderDate
                             ,.dsPullDate
                             ,.compDsYear
                             ,.compDsFolderDate
                             ,.compDsPullDate
                             ,.isR)
  }
  
  # Submit the results to the appropriate data store
  submitToDataStore(.registry,.varList$.dsYear,.varList$.dsPullDate,.registryCheck)
  
  return(.registryCheck)
}

