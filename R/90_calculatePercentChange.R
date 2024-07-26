#' calculatePercentChange Function to add a % change column to a gtsummary object for NC24
#'
#' @param .data A gtsummary object with 2 levels of a by variable
#'
#' @return The gtsummary object with an added column showing % change
#' @export
calculatePercentChange <- function(.data) {
  .data <- .data %>%
    mutate(
      percent_change = case_when(
        # Handle NA values: return a blank value
        is.na(stat_1) | is.na(stat_2) ~ "",
        # For continuous variables: extract means and calculate % change
        str_detect(stat_1, "\\d+\\.\\d+") & str_detect(stat_2, "\\d+\\.\\d+") ~ {
          mean_1 <- as.numeric(str_extract(stat_1, "\\d+\\.\\d+"))
          mean_2 <- as.numeric(str_extract(stat_2, "\\d+\\.\\d+"))
          percent_change <- ((mean_2 - mean_1) / abs(mean_1)) * 100
          sprintf("%.1f", percent_change)
        },
        # For categorical variables: extract percentages and calculate % change
        str_detect(stat_1, "\\d+\\.\\d+%") & str_detect(stat_2, "\\d+\\.\\d+%") ~ {
          perc_1 <- as.numeric(str_extract(stat_1, "\\d+\\.\\d+"))
          perc_2 <- as.numeric(str_extract(stat_2, "\\d+\\.\\d+"))
          percent_change <- ((perc_2 - perc_1) / abs(perc_1)) * 100
          sprintf("%.1f", percent_change)
        },
        TRUE ~ ""
      )
    )
  return(.data)
}