pullData <- function(.dsFolderUrl,.year,.pullDate,.dsname){
  
  pulledRDS <- pullRDSfromUrl(.dsFolderUrl,.year,.pullDate,.dsname)
  
  return(pulledRDS);
}

pullRDSfromUrl <- function(.dsFolderUrl,.year,.pullDate,.dsname){
  .ds_url <- glue("{.dsFolderUrl}/{.year}/{.pullDate}/",glue("{.dsname}_{.pullDate}.rds"))
  print(.ds_url)
  ds <- readRDS(.ds_url)
  
  head(ds)
  return(ds)
}
