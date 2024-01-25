#' @export
createDataStoreFolder <- function(.urlToCreate){
  # If the folder for this url does not exist, create it
  if(!dir.exists(.urlToCreate)){
    dir.create(.urlToCreate,recursive = TRUE) 
  }
}