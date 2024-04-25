#' copyDataset A function to copy a dataset from one location to another location with an option to remove the dataset from the original location
#'
#' @param .folderToCopyTo Url of the folder to copy the datasets to
#' @param .dataSetToCopy A text URL to the dataset to copy from the original location to the final location
#' @param .remove (default = FALSE) an indicator whether to remove the files in the original location
copyDataset <- function(.dataSetToCopy, .folderToCopyTo, .remove = FALSE){
  file.copy(from = .dataSetToCopy, to = .folderToCopyTo, overwrite = TRUE)
  if(.remove == TRUE){
    if(confirmDeletion(.dataSetToCopy)){
      # file.remove(.dataSetToCopy)
      print("Removal placeholder")
    }
  }
}



#' confirmDeletion Requires manual typed confirmation of file deletion
#' 
#' @param .dsName The name of the dataset to be deleted
#'
#' @return Boolean - TRUE if confirmed, FALSE if not
confirmDeletion <- function(.dsName){
  cat(glue::glue("This function will delete the following file from the original location. Are you sure you want to perform this action?\n\n{.dsName}\n\nTYPE 'confirm' to continue: "))
  
  confirmation <- readline(prompt = "> ")
  
  if(confirmation == "confirm"){
    print("This action is confirmed. The files have been removed from the original location.")
    return(TRUE)
  } else {
    print("This action is NOT confirmed. The files have been kept in the original location but have still been copied to the new location.")
    return(FALSE)
  }
}