# Create a folder to store the data if it does not exist
#   FUNCTION: createDataStoreFolder()
#
#   Input: .urlToCreate [text string] = url of the folder to store the data
#
#   Returns: n/a
#

createDataStoreFolder <- function(.urlToCreate){
  # If the folder for this url does not exist, create it
  if(!dir.exists(.urlToCreate)){
    dir.create(.urlToCreate,recursive = TRUE) 
  }
}