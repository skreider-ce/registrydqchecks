#' copyRomListingToFolder Copy the CDM/ROM listing to the appropriate folder upon request
#'
#' @param .reportOutputUrl The url to the base report folder where the DQ report has been output
#' @param .romReportUrl The url to the location for ROM/CDM to view the listing
#'
#' @return The URL
#' @export
copyRomListingToFolder <- function(.reportOutputUrl, .romReportUrl){
  .folderUrl <- glue::glue("{.reportOutputUrl}listing/")
  .files <- list.files(.folderUrl, full.names = TRUE)
  .targetFile <- grep("allChecks", .files, ignore.case = TRUE, value = TRUE)
  cat("Full URL to target file:", .targetFile)
  file.copy(.targetFile,.romReportUrl)
  return(.targetFile)
}