# There will need to be updates to this code for each dataset to be run
#   NOTE: This will vary between registries
#   e.g.: AD is looking at exvisit, exlab, and exdrugexp


runMs <- function(
                  .dsYear
                  ,.dsFolderDate
                  ,.dsPullDate
                  ,.compDsYear
                  ,.compDsFolderDate
                  ,.compDsPullDate
                  ,.isR){
  
  
  # dsFolderUrl should point to the parent monthly folder
  #   NOTE: each registry will need to update their xx_<reg>Run code to properly point to their datasets
  ms_sharepoint_dir <- "~/../../Corrona LLC/Biostat Data Files - MS"
  dsFolderUrl <- glue("{ms_sharepoint_dir}/monthly")
  
  # Check if the directory above exists
  dir.exists(ms_sharepoint_dir)
  dir.exists(dsFolderUrl)
  
  # Step 1: Pull the data - store in [dataframe] dsToCheck
  
  
  # Currently - requires the user to specifically give the URL to the file since I don't know
  #     if there is a consistent structure
  
  
  # URL directly to current month's data
  #   NOTE: This may be different for each registry - update accordingly
  #   NOTE: There will be a separate pull for each dataset being compared
  dwsub1_datasetUrl <- glue("{dsFolderUrl}/{.dsYear}/{.dsFolderDate}/final/ms_dwsub1_{.dsPullDate}.dta")
  
  # Pull current month's data
  dwsub1_dsToCheck <- pullData(dwsub1_datasetUrl,.isR)
  
  
  
  # URL directly to last month's data
  #   NOTE: This may be different for each registry - update accordingly
  #   NOTE: There will be a separate pull for each dataset being compared
  comp_dwsub1_datasetUrl <- glue("{dsFolderUrl}/{.compDsYear}/{.compDsFolderDate}/final/ms_dwsub1_{.compDsPullDate}.dta")

  # Pull last month's data
  comp_dwsub1_dsToCheck <- pullData(comp_dwsub1_datasetUrl,.isR)

  
  
  
  # Step 2: Run the critical checks - store output in [list] criticalCheckOutput
  
  # Currently - requires the user to specifically give the variables that define the
  #     unique keys as they vary from dataset to dataset
  
  .dwsub1_criticalCheckOutput <- criticalChecks(
    dwsub1_dsToCheck
    ,comp_dwsub1_dsToCheck
    ,c("id","lastvisit_dt")
    ,c("id","lastvisit_dt", "abcd", "xyz")
    ,id,visitdate)

  # Step 2.5: Run the non-critical checks - store output in [list] nonCriticalCheckOutput
  
  
  
  # Step 3: Create the data check report
  
  .returnOutput <- list(
    dwsub1_criticalCheckOutput = .dwsub1_criticalCheckOutput
  )
  
  return(.returnOutput)
}

