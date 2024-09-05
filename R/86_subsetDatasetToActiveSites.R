#' subsetDatasetToActiveSites Function to subset dataset based on active sites
#'
#' @param .dataset The dataset to subset
#' @param .siteVar1 The primary site variable to check for
#' @param .siteVar2 The secondary site variable to check for
#' @param .activeSites The date of the current datapull
#'
#' @return The subset dataset
#' @export
subsetDatasetToActiveSites <- function(.dataset, .siteVar1, .siteVar2, .activeSites) {
  if (.siteVar1 %in% colnames(.dataset)) {
    # Use variable1 to subset dataset if it exists
    subset <- .dataset
    message("Using ", .siteVar1, " to subset the dataset")
    return(subset)
  } else if (.siteVar2 %in% colnames(.dataset)) {
    # Use variable2 to subset dataset if variable1 does not exist but variable2 exists
    subset <- .dataset
    message("Using ", .siteVar2, " to subset the dataset")
    return(subset)
  } else {
    # Log an error if neither variable1 nor variable2 exist in datasetA
    message("Error: neither ", .siteVar1, " nor ", .siteVar2, " exist in this dataset. No subsetting was done on the dataset")
    return(.dataset)  # Return the original dataset without subsetting
  }
}