#' copyRomListingToFolder Copy the CDM/ROM listing to the appropriate folder upon request
#'
#' @param .reportOutputUrl The url to the base report folder where the DQ report has been output
#' @param .romReportUrl The url to the location for ROM/CDM to view the listing
#' @param .registry A text string with the initials of the specific registry ("ad", "ms", "raj", "aa", "pso", "ibd", "nmo")
#' @param .dataPullDate A date string of the data pull date in the format YYYY-DD-MM (e.g. "2024-01-10")
#'
#' @return The full string URL to the location of the Excel file in the new location
#' 
#' @importFrom glue glue
#' 
#' @export
copyRomListingToFolder <- function(.reportOutputUrl, .romReportUrl, .registry, .dataPullDate){
  
  # Define URL string to location of Excel listing for this month
  .folderUrl <- glue::glue("{.reportOutputUrl}listing/")
  
  # Pull list of files from folder
  .files <- list.files(.folderUrl, full.names = TRUE)
  
  # Identify the target file
  .targetFile <- grep("allDqChecks", .files, ignore.case = TRUE, value = TRUE)
  cat("Full URL to target file:", .targetFile)
  
  # Define URL string to location of where to copy the Excel listing to
  .fileLocation <- glue::glue("{.romReportUrl}/{.registry}/{format(as.Date(.dataPullDate), '%Y')}/{format(as.Date(.dataPullDate), '%Y-%m')}/")
  
  # Create folder if it does not alread exist
  createDataStoreFolder(.fileLocation)
  
  # Copy the file to the folder
  file.copy(.targetFile,.fileLocation)
  
  # Return the full string URL to the file
  return(.targetFile)
}