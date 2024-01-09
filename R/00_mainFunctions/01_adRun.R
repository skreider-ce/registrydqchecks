# There will need to be updates to this code for each dataset to be run
#   NOTE: This will vary between registries
#   e.g.: AD is looking at exvisit, exlab, and exdrugexp


runAd <- function(
                  .dsYear
                  ,.dsFolderDate
                  ,.dsPullDate
                  ,.compDsYear
                  ,.compDsFolderDate
                  ,.compDsPullDate
                  ,.isR){


  # dsFolderUrl should point to the parent monthly folder
  #   NOTE: each registry will need to update their xx_<reg>Run code to properly point to their datasets
  ad_sharepoint_dir <- "~/../../Corrona LLC/Biostat Data Files - AD"
  dsFolderUrl <- glue("{ad_sharepoint_dir}/monthly")
  
  # Check if the directory above exists
  dir.exists(ad_sharepoint_dir)
  dir.exists(dsFolderUrl)
  
  # Step 1: Pull the data - store in [dataframe] dsToCheck
  
  
  # Currently - requires the user to specifically give the URL to the file since I don't know
  #     if there is a consistent structure
  
  
  # URL directly to current month's data
  #   NOTE: This may be different for each registry - update accordingly
  #   NOTE: There will be a separate pull for each dataset being compared
  exvisit_datasetUrl <- glue("{dsFolderUrl}/{.dsYear}/{.dsFolderDate}/exvisit_{.dsPullDate}.rds")
  exlab_datasetUrl <- glue("{dsFolderUrl}/{.dsYear}/{.dsFolderDate}/exlab_{.dsPullDate}.rds")
  exdrugexp_datasetUrl <- glue("{dsFolderUrl}/{.dsYear}/{.dsFolderDate}/exdrugexp_{.dsPullDate}.rds")
  
  # Pull current month's data
  exvisit_dsToCheck <- pullData(exvisit_datasetUrl,.isR)
  exlab_dsToCheck <- pullData(exlab_datasetUrl,.isR)
  exdrugexp_dsToCheck <- pullData(exdrugexp_datasetUrl,.isR)
  
  
  
  # URL directly to last month's data
  #   NOTE: This may be different for each registry - update accordingly
  #   NOTE: There will be a separate pull for each dataset being compared
  comp_exvisit_datasetUrl <- glue("{dsFolderUrl}/{.compDsYear}/{.compDsFolderDate}/exvisit_{.compDsPullDate}.rds")
  comp_exlab_datasetUrl <- glue("{dsFolderUrl}/{.compDsYear}/{.compDsFolderDate}/exlab_{.compDsPullDate}.rds")
  comp_exdrugexp_datasetUrl <- glue("{dsFolderUrl}/{.compDsYear}/{.compDsFolderDate}/exdrugexp_{.compDsPullDate}.rds")
  
  # Pull last month's data
  comp_exvisit_dsToCheck <- pullData(comp_exvisit_datasetUrl,.isR)
  comp_exlab_dsToCheck <- pullData(comp_exlab_datasetUrl,.isR)
  comp_exdrugexp_dsToCheck <- pullData(comp_exdrugexp_datasetUrl,.isR)
  
  
  
  
  # Step 2: Run the critical checks - store output in [list] criticalCheckOutput
  
  # Currently - requires the user to specifically give the variables that define the
  #     unique keys as they vary from dataset to dataset
  
  # Pull essential variable names
  fileLoc = "C:/Users/ScottKreider/Corrona LLC/Biostat and Epi Team Site - Registry Data QC Checks/Phase I/01_AD/Specifications"
  fileName = "Phase I checks specifications - AD exvisit"
  sheetName = "CC8&CC9&NC3 essential variables"
  colId = "Variable name"
  exvisit_essVars <- pullVariableListFromExcelFile(fileLoc,fileName,sheetName,colId)

  .exvisit_criticalCheckOutput <- criticalChecks(
    exvisit_dsToCheck
    ,comp_exvisit_dsToCheck
    ,exvisit_essVars
    ,c("id","drink_freq", "abcd", "xyz")
    ,id,visitdate)
  
  
  # Pull essential variable names
  fileLoc = "C:/Users/ScottKreider/Corrona LLC/Biostat and Epi Team Site - Registry Data QC Checks/Phase I/01_AD/Specifications"
  fileName = "Phase I checks specifications - AD exlab"
  sheetName = "CC8&CC9&NC3 essential variables"
  colId = "Variable name"
  exlab_essVars <- pullVariableListFromExcelFile(fileLoc,fileName,sheetName,colId)
  
  .exlab_criticalCheckOutput <- criticalChecks(
    exlab_dsToCheck
    ,comp_exlab_dsToCheck
    ,exlab_essVars
    ,c("id","labdate", "lmno", "pqrs", "mnyo")
    ,id,labdatet,edcvisitnum)
  
  
  # Pull essential variable names
  fileLoc = "C:/Users/ScottKreider/Corrona LLC/Biostat and Epi Team Site - Registry Data QC Checks/Phase I/01_AD/Specifications"
  fileName = "Phase I checks specifications - AD exdrugexp"
  sheetName = "CC8&NC3 essential variables"
  colId = "Variable name"
  exdrugexp_essVars <- pullVariableListFromExcelFile(fileLoc,fileName,sheetName,colId)
  
  .exdrugexp_criticalCheckOutput <- criticalChecks(
    exdrugexp_dsToCheck
    ,comp_exdrugexp_dsToCheck
    ,exdrugexp_essVars
    ,c("id","stdosevalue", "bbcy")
    ,id,expid)
  
  # Step 2.5: Run the non-critical checks - store output in [list] nonCriticalCheckOutput
  
  
  
  # Step 3: Create the data check report
  
  .returnOutput <- list(
    exvisit_criticalCheckOutput = .exvisit_criticalCheckOutput
    ,exlab_criticalCheckOutput = .exlab_criticalCheckOutput
    ,exdrugexp_criticalCheckOutput = .exdrugexp_criticalCheckOutput
  )
  
  return(.returnOutput)
}

