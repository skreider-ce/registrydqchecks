# FUNCTION: Primary pullData() function that pulls the file from the specified URL components
#
#   Input: The URL information of the dataset to pull
#           .dsFolderUrl = URL to the Registry parent directory
#           .year = year to be pulled
#           .pullDate = date of the data to be pulled
#           .dsname = name of the dataset to be pulled
#
#   Returns: a [dataframe] of the dataset being pulled
#
#   TO UPDATE:
#         1) Increase flexibility to pull in RDS or DTA
#         2) Increase flexibility for differently formatted URLs
#             - Possibly require direct URL given in previous step
#
pullData <- function(.dsFolderUrl,.year,.pullDate,.dsname){
  
  .datasetUrl <- glue("{.dsFolderUrl}/{.year}/{.pullDate}/",glue("{.dsname}_{.pullDate}.rds"))
  
  .pulledRDS <- pullRDSfromUrl(.datasetUrl)
  
  return(.pulledRDS);
}



# FUNCTION: pullRDSfromUrl that pulls the RDS file from the specified direct URL
#
#   Input: The URL of the RDS dataset to pull
#           .datasetUrl = URL directly to the RDS dataset to pull
#
#   Returns: a [dataframe] of the dataset being pulled
#
#
pullRDSfromUrl <- function(.datasetUrl){

  print(.datasetUrl)
  .ds <- readRDS(.datasetUrl)

  return(.ds)
}
