#' (internal function) pullSiteInfoFromExcelFile Pull a site information
#'
#' @param .fileUrl A text url to the Excel file to pull in
#' @param .registry The acronym for the current registry
#'
#' @returns A dataframe with the columns from the file that had been specified
#'
#' @export
#' 
#' @importFrom dplyr filter
#' @importFrom dplyr mutate
#' @importFrom dplyr select
pullSiteInfoFromExcelFile <- function(.fileUrl,.registry){
  print(glue::glue("Location of site information: {.fileUrl}"))
  
  .colNames <- c(
    "site_id"
    ,"status"
    ,"registry"
  )
  
  .registryFilter = .registry
  if(.registry == "raj"){
    .registryFilter = "ra-japan"
  }
  if(.registry == "psa"){
    .registryFilter = "psa/spa"
  }
  
  .activeSites <- read.csv(.fileUrl)[.colNames] |>
    dplyr::filter(status %in% "Approved / Active") |>
    dplyr::mutate(
      status = tolower(status)
      ,registry = tolower(registry)
    ) |>
    dplyr::filter(
      registry == .registryFilter
    ) |>
    dplyr::select(
      site_id
    )

  return(.activeSites)
}

