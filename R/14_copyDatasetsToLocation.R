#' copyDatasetsToLocation A function to copy the preliminary analytic datasets to a final output location with an option to remove the files from the original location
#'
#' @param .datasetsToCopy A character list of the dataset prefixes to copy from the original location to the final location
#' @param .folderToCopyTo Url of the folder to copy the datasets to
#' @param .remove (default = FALSE) an indicator whether to remove the files in the original location
#' @param .prelimDataFolderUrl A text URL to the location of the datasets to be copied over
#' @param .prelimDataPullDate The datapull date of the preliminary files to be copied - the date in the dataset name
#' @param .isR Boolean indicating if the dataset being copied is an R file (if TRUE then dataset is R, if FALSE then dataset is .dta)
#'
#' @export
copyDatasetsToLocation <- function(.datasetsToCopy
                                   ,.prelimDataFolderUrl
                                   ,.prelimDataPullDate
                                   ,.folderToCopyTo
                                   ,.isR
                                   ,.remove = FALSE){
  for(.dsName in .datasetsToCopy){
    if(.isR == TRUE){
      .dsToCopy = glue::glue("{.prelimDataFolderUrl}{.dsName}_{.prelimDataPullDate}.rds")
    } else if(.isR == FALSE){
      .dsToCopy = glue::glue("{.prelimDataFolderUrl}{.dsName}_{.prelimDataPullDate}.dta")
    }
    copyDataset(.dataSetToCopy = .dsToCopy
                ,.folderToCopyTo = .folderToCopyTo
                ,.remove = .remove)
  }
}