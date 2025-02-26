#' calculatePercentChange Function to add a % change column to a gtsummary object for NC24
#'
#' @param data A gtsummary object with 2 levels of a by variable
#'
#' @return The gtsummary object with an added column showing % change
#' @export
#' 
#' @importFrom dplyr rowwise mutate case_when ungroup group_by select
#' @importFrom stringr str_detect str_extract
calculatePercentChange <- function(data) {
  data <- data |>
    dplyr::rowwise() %>%
    dplyr::mutate(
      percentChange = dplyr::case_when(
        stringr::str_detect(stat_1, "%") & stringr::str_detect(stat_2, "%") ~ {
          pct_this <- as.numeric(str_extract(stat_1, "[0-9.]+(?=%)"))
          pct_last <- as.numeric(str_extract(stat_2, "[0-9.]+(?=%)"))
          round(pct_this - pct_last, 1)
        },
        stringr::str_detect(stat_1, "\\(") & stringr::str_detect(stat_2, "\\(") ~ {
          mean_this <- as.numeric(stringr::str_extract(stat_1, "^[0-9.]+"))
          mean_last <- as.numeric(stringr::str_extract(stat_2, "^[0-9.]+"))
          round((mean_this - mean_last) / mean_last * 100, 1)
        },
        TRUE ~ NA_real_
      )
    )
  
  # Find max percent change for each variable and add it to the label row
  data <- data |>
    dplyr::group_by(variable) |>
    dplyr::mutate(
      max_percent_change = ifelse(row_type == "label", 
                                  percentChange[which.max(abs(percentChange))],
                                  NA_real_)
    ) |>
    dplyr::ungroup() |>
    dplyr::mutate(
      percentChange = ifelse(row_type == "label", 
                             sprintf("%.1f", max_percent_change), 
                             percentChange)
    ) |>
    dplyr::select(-max_percent_change)
  
  return(data)
}




#' filterPercentChange Filter a gtsummary object to only show rows with percentChange >5
#'
#' @param data The gtsummary object to filter
#'
#' @return The filtered dataset
#' @export
#' 
#' @importFrom dplyr filter
filterPercentChange <- function(data) {
  data <- data |>
    dplyr::filter(
      !is.na(as.numeric(percentChange)) & abs(as.numeric(percentChange)) > 5
    )
  
  return(data)
}
