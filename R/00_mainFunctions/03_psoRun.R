# There will need to be updates to this code for each dataset to be run
#   NOTE: This will vary between registries
#   e.g.: AD is looking at exvisit, exlab, and exdrugexp


runPso <- function(
                  .dsYear
                  ,.dsFolderDate
                  ,.dsPullDate
                  ,.compDsYear
                  ,.compDsFolderDate
                  ,.compDsPullDate
                  ,.isR){
  
  
  # dsFolderUrl should point to the parent monthly folder
  #   NOTE: each registry will need to update their xx_<reg>Run code to properly point to their datasets
  pso_sharepoint_dir <- "~/../../Corrona LLC/Biostat Data Files - PsO"
  dsFolderUrl <- glue("{pso_sharepoint_dir}/monthly")
    
  # Check if the directory above exists
  dir.exists(pso_sharepoint_dir)
  dir.exists(dsFolderUrl)
  
  # Step 1: Pull the data - store in [dataframe] dsToCheck
  
  
  # Currently - requires the user to specifically give the URL to the file since I don't know
  #     if there is a consistent structure
  
  
  # URL directly to current month's data
  #   NOTE: This may be different for each registry - update accordingly
  #   NOTE: There will be a separate pull for each dataset being compared
  exvisit_datasetUrl <- glue("{dsFolderUrl}/{.dsYear}/{.dsFolderDate}/exvisit_{.dsPullDate}.dta")
  exdrugexp_datasetUrl <- glue("{dsFolderUrl}/{.dsYear}/{.dsFolderDate}/exdrugexp_{.dsPullDate}.dta")

  # Pull current month's data
  exvisit_dsToCheck <- pullData(exvisit_datasetUrl,.isR)
  exdrugexp_dsToCheck <- pullData(exdrugexp_datasetUrl,.isR)

  
  
  # URL directly to last month's data
  #   NOTE: This may be different for each registry - update accordingly
  #   NOTE: There will be a separate pull for each dataset being compared
  comp_exvisit_datasetUrl <- glue("{dsFolderUrl}/{.compDsYear}/{.compDsFolderDate}/exvisit_{.compDsPullDate}.dta")
  comp_exdrugexp_datasetUrl <- glue("{dsFolderUrl}/{.compDsYear}/{.compDsFolderDate}/exdrugexp_{.compDsPullDate}.dta")

  # Pull last month's data
  comp_exvisit_dsToCheck <- pullData(comp_exvisit_datasetUrl,.isR)
  comp_exdrugexp_dsToCheck <- pullData(comp_exdrugexp_datasetUrl,.isR)

  
  
  
  # Step 2: Run the critical checks - store output in [list] criticalCheckOutput
  
  # Currently - requires the user to specifically give the variables that define the
  #     unique keys as they vary from dataset to dataset
  
  .exvisit_criticalCheckOutput <- criticalChecks(
    exvisit_dsToCheck
    ,comp_exvisit_dsToCheck
    ,c("id","smoke_current")
    ,c("id","smoke_current", "abcd", "xyz")
    ,c("id","visitdate"))
  
  .exdrugexp_criticalCheckOutput <- criticalChecks(
    exdrugexp_dsToCheck
    ,comp_exdrugexp_dsToCheck
    ,c("id","nbnaive","visitdate0")
    ,c("id","nbnaive","visitdate0", "abcd", "xyz")
    ,c("id","expid"))

  
  # Step 2.5: Run the non-critical checks - store output in [list] nonCriticalCheckOutput
  
  
  
  # Step 3: Create the data check report
  
  .returnOutput <- list(
    exvisit_criticalCheckOutput = .exvisit_criticalCheckOutput
    ,exdrugexp_criticalCheckOutput = .exdrugexp_criticalCheckOutput
  )
  
  return(.returnOutput)
}

