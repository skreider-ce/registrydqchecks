#' (internal function) Create a new folder at the specified location if it doesn't already exist
#'
#' @param .urlToCreate A url string to the folder to be created
#'
#' @export
createDataStoreFolder <- function(.urlToCreate){
  # If the folder for this url does not exist, create it
  if(!dir.exists(.urlToCreate)){
    dir.create(.urlToCreate,recursive = TRUE) 
  }
  
  .listUrl <- glue::glue(.urlToCreate,"/listing")
  
  if(!dir.exists(.listUrl)){
    dir.create(.listUrl,recursive = TRUE) 
  }
}