#' calculatePercentChange Function to add a % change column to a gtsummary object for NC24
#'
#' @param data A gtsummary object with 2 levels of a by variable
#'
#' @return The gtsummary object with an added column showing % change
#' @export
calculatePercentChange <- function(data) {
  data <- data |>
    rowwise() %>%
    mutate(
      percentChange = case_when(
        str_detect(stat_1, "%") & str_detect(stat_2, "%") ~ {
          pct_this <- as.numeric(str_extract(stat_1, "[0-9.]+(?=%)"))
          pct_last <- as.numeric(str_extract(stat_2, "[0-9.]+(?=%)"))
          round(pct_this - pct_last, 1)
        },
        str_detect(stat_1, "\\(") & str_detect(stat_2, "\\(") ~ {
          mean_this <- as.numeric(str_extract(stat_1, "^[0-9.]+"))
          mean_last <- as.numeric(str_extract(stat_2, "^[0-9.]+"))
          round((mean_this - mean_last) / mean_last * 100, 1)
        },
        TRUE ~ NA_real_
      )
    )
  
  # Find max percent change for each variable and add it to the label row
  data <- data |>
    group_by(variable) |>
    mutate(
      max_percent_change = ifelse(row_type == "label", 
                                  sign(as.numeric(percentChange))*max(abs(as.numeric(percentChange)), na.rm = TRUE), 
                                  NA_real_)
    ) |>
    ungroup() |>
    mutate(
      percentChange = ifelse(row_type == "label", 
                             sprintf("%.1f", max_percent_change), 
                             percentChange)
    ) |>
    select(-max_percent_change)
  
  return(data)
}




#' filterPercentChange Filter a gtsummary object to only show rows with percentChange >5
#'
#' @param data The gtsummary object to filter
#'
#' @return The filtered dataset
#' @export
filterPercentChange <- function(data) {
  data <- data |>
    filter(
      !is.na(as.numeric(percentChange)) & abs(as.numeric(percentChange)) > 5
    )
  
  return(data)
}
