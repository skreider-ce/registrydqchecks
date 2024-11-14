#' copyRomListingToFolder Copy the CDM/ROM listing to the appropriate folder upon request
#'
#' @param .reportOutputUrl The url to the base report folder where the DQ report has been output
#' @param .romReportUrl The url to the location for ROM/CDM to view the listing
#' @param .registry A text string with the initials of the specific registry ("ad", "ms", "raj", "aa", "pso", "ibd", "nmo")
#' @param .dataPullDate A date string of the data pull date in the format YYYY-DD-MM (e.g. "2024-01-10")
#'
#' @return The URL
#' @export
copyRomListingToFolder <- function(.reportOutputUrl, .romReportUrl, .registry, .dataPullDate){
  .folderUrl <- glue::glue("{.reportOutputUrl}listing/")
  .files <- list.files(.folderUrl, full.names = TRUE)
  .targetFile <- grep("allDqChecks", .files, ignore.case = TRUE, value = TRUE)
  cat("Full URL to target file:", .targetFile)
  .fileLocation <- glue::glue("{.romReportUrl}/{.registry}/{format(as.Date(.dataPullDate), '%Y')}/{format(as.Date(.dataPullDate), '%Y-%m')}/")
  createDataStoreFolder(.fileLocation)
  file.copy(.targetFile,.fileLocation)
  return(.targetFile)
}