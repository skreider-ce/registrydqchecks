#' subsetDatasetToNonCalculatedVariables Function to subset dataset based on active sites
#'
#' @param .dataset The dataset to subset
#'
#' @return The subset dataset
#' @export
subsetDatasetToNonCalculatedVariables <- function(.dataset) {
  if(!("calculatedVariable" %in% names(.dataset))){
    message("NOTE: calculatedVariable is not in this dataset. No subsetting was done on the dataset")
    return(.dataset)  # Return the original dataset without subsetting
  }
  
  # Filter output to only calculatedVariable != 1
  .returnDataset <- .dataset |>
    dplyr::filter(as.numeric(calculatedVariable) %in% c(NA, 0))
  message("NOTE: calculatedVariable was used to subset this dataset")
  
  return(.returnDataset)  # Return the subset dataset
}