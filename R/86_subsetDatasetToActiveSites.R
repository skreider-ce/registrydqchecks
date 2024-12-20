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
    names(.activeSites)[1] = .siteVar1
    .dataset <- .dataset |>
      dplyr::mutate(!!dplyr::sym(.siteVar1) := as.character(!!dplyr::sym(.siteVar1)))
    
    # Use variable1 to subset dataset if it exists
    subset <- dplyr::inner_join(
      .activeSites
      ,.dataset
      ,by = .siteVar1
    )
    
    if("checkId" %in% names(subset)){
      subset <- subset |>
        dplyr::relocate(checkId, .before = 1)
    }
    
    message("NOTE: Using ", .siteVar1, " to subset the dataset")
    return(subset)
  } else if (.siteVar2 %in% colnames(.dataset)) {
    names(.activeSites)[1] = .siteVar2
    .dataset <- .dataset |>
      dplyr::mutate(!!dplyr::sym(.siteVar2) := as.character(!!dplyr::sym(.siteVar2)))
    
    # Use variable2 to subset dataset if variable1 does not exist but variable2 exists
    subset <- dplyr::inner_join(
      .activeSites
      ,.dataset
      ,by = .siteVar2
    )
    
    if("checkId" %in% names(subset)){
      subset <- subset |>
        dplyr::relocate(checkId, .before = 1)
    }
    
    message("NOTE: Using ", .siteVar2, " to subset the dataset")
    return(subset)
  } else {
    # Log an error if neither variable1 nor variable2 exist in datasetA
    message("NOTE: neither ", .siteVar1, " nor ", .siteVar2, " exist in this dataset. No subsetting was done on the dataset")
    return(.dataset)  # Return the original dataset without subsetting
  }
}