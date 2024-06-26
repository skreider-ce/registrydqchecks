#' cleanUniqueKeyClasses Remove vctrs_vctr and haven_labelled from the classes of uniqueKey variables
#'
#' @param datasetToCheck The data to remove the classes from
#' @param uniqueKeyVars The uniqueKey variables 
#'
#' @return the dataset with vctrs_vctr and haven_labelled removed from the classes of the uniqueKey variables
cleanUniqueKeyClasses <- function(datasetToCheck, uniqueKeyVars) {
  for (var in unlist(uniqueKeyVars)) {
    if (var %in% names(datasetToCheck)) {
      class(datasetToCheck[[var]]) <- setdiff(class(datasetToCheck[[var]]), c("haven_labelled", "vctrs_vctr"))
    }
  }
  return(datasetToCheck)
}