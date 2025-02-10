#' copyRomListingToFolder Copy the CDM/ROM listing to the appropriate folder upon request
#'
#' @param .reportOutputUrl The url to the base report folder where the DQ report has been output
#' @param .romReportUrl The url to the location for ROM/CDM to view the listing
#' @param .registry A text string with the initials of the specific registry ("ad", "ms", "raj", "aa", "pso", "ibd", "nmo")
#' @param .dataPullDate A date string of the data pull date in the format YYYY-DD-MM (e.g. "2024-01-10")
#' @param .overwrite (OBSOLETE) Whether or not to overwrite the currently existing report in the CDM/ROM folder (DEFAULT = FALSE)
#'
#' @return The full string URL to the location of the Excel file in the new location
#' 
#' @importFrom glue glue
#' 
#' @export
copyRomListingToFolder <- function(.reportOutputUrl, .romReportUrl, .registry, .dataPullDate, .overwrite = FALSE){
  
  # Define URL string to location of Excel listing for this month
  .folderUrl <- glue::glue("{.reportOutputUrl}listing/")
  
  # Pull list of files from folder
  .files <- list.files(.folderUrl, full.names = TRUE)
  
  # Identify the target file
  .targetFile <- grep("allDqChecks", .files, ignore.case = TRUE, value = TRUE)
  cat("Full URL to target file:", .targetFile)
  
  # Define URL string to location of where to copy the Excel listing to
  .fileLocation <- glue::glue("{.romReportUrl}/{.registry}/{format(as.Date(.dataPullDate), '%Y')}/{format(as.Date(.dataPullDate), '%Y-%m')}/")
  .locFiles <- list.files(.fileLocation)
  .existingFile <- length(grep("allDqChecks", .locFiles, ignore.case = TRUE, value = TRUE))

  # Create folder if it does not alread exist
  createDataStoreFolder(.fileLocation)
  
  # Copy the file to the folder
  if(.existingFile == 0){
    file.copy(.targetFile,.fileLocation, overwrite = FALSE)
    message("\nFile copied successfully.")
    cat("Full URL to destination folder:", .fileLocation)
  } else{
    message("\nFile was NOT overwritten.")
    message("The functionality to automatically OVERWRITE the existing file has been removed.")
    message("You must review the existing report in the .exampleRomOutputFolder and manually delete it if you wish to re-output and copy over.")
    message("Do NOT delete or remove an Excel report that has been filled out by members of the CDM/ROM team.")
  }


  
  # Return the full string URL to the .targetFile and the destination folder
  invisible(
    list(
      "targetFile" = .targetFile
      ,"destinationFolder" = .fileLocation
    )
  )
}