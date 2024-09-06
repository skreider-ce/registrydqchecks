#' calculatePercentChange Function to add a % change column to a gtsummary object for NC24
#'
#' @param data A gtsummary object with 2 levels of a by variable
#'
#' @return The gtsummary object with an added column showing % change
#' @export
calculatePercentChange <- function(data) {
  data <- data |>
    mutate(
      percentChange = case_when(
        # Handle NA values: return a blank value
        is.na(stat_1) | is.na(stat_2) ~ "",
        # For continuous variables: extract means and calculate % change
        str_detect(stat_1, "\\d+\\.\\d+") & str_detect(stat_2, "\\d+\\.\\d+") ~ {
          mean_1 <- as.numeric(str_extract(stat_1, "\\d+\\.\\d+"))
          mean_2 <- as.numeric(str_extract(stat_2, "\\d+\\.\\d+"))
          percentChange <- ((mean_1 - mean_2) / abs(mean_2)) * 100
          sprintf("%.1f", percentChange)
        },
        # For categorical variables: extract percentages and calculate % change
        str_detect(stat_1, "\\d+\\.\\d+%") & str_detect(stat_2, "\\d+\\.\\d+%") ~ {
          perc_1 <- as.numeric(str_extract(stat_1, "\\d+\\.\\d+"))
          perc_2 <- as.numeric(str_extract(stat_2, "\\d+\\.\\d+"))
          percentChange <- (perc_1 - perc_2)
          sprintf("%.1f", percentChange)
        },
        TRUE ~ ""
      )
    )
  
  # Find max percent change for each variable and add it to the label row
  data <- data |>
    group_by(variable) |>
    mutate(
      max_percent_change = ifelse(row_type == "label", 
                                  max(sign(as.numeric(percentChange))*abs(as.numeric(percentChange)), na.rm = TRUE), 
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
