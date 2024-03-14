#' copyDataset A function to copy a dataset from one location to another location with an option to remove the dataset from the original location
#'
#' @param .datasetToCopy A direct URL to the dataset to copy from the original location to the final location
#' @param .folderToCopyTo Url of the folder to copy the datasets to
#' @param .remove (default = FALSE) an indicator whether to remove the files in the original location
copyDataset <- function(.dataSetToCopy, .folderToCopyTo, .remove = FALSE){
  file.copy(from = .dataSetToCopy, to = .folderToCopyTo)
  if(.remove == TRUE){
    # file.remove(.dataSetToCopy)
    print("Removal placeholder")
  }
}