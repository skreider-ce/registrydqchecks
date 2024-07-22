#' read_excel_sheets Read the names of the sheets in the given excel file
#'
#' @param codebookUrl A url to the codebook
read_excel_sheets <- function(codebookUrl) {
  readxl::excel_sheets(codebookUrl)
}



#' read_dataset Read the data from a specific sheet in the codebook
#'
#' @param codebookUrl A url to the codebook
#' @param dataset The name of the dataset tab
read_dataset <- function(codebookUrl, dataset) {
  readxl::read_excel(codebookUrl, sheet = dataset)
}



#' convert_to_numeric Convert columns from character to numeric
#'
#' @param column Name of the column to convert
convert_to_numeric <- function(column) {
  as.numeric(gsub("[^0-9.]", "", column))
}



#' dataset_exists Check if a given dataset name has a corresponding sheet in the codebook
#'
#' @param dataset The dataset name to check against the sheet names
#' @param codebookSheets Names of the sheets in the codebook
dataset_exists <- function(dataset, codebookSheets) {
  dataset %in% codebookSheets
}



#' check_missing_variables Check that the expected variables exist in the given sheet
#'
#' @param sheet_data The data from the specific sheet in the Excel file
#' @param expectedVariables Character vector of variable names that should exist in the sheet
check_missing_variables <- function(sheet_data, expectedVariables) {
  
  missing_variables <- expectedVariables[!expectedVariables %in% colnames(sheet_data)]
  
  if (length(missing_variables) > 0) {
    cat("  Missing variables:\n")
    cat("  ", paste(missing_variables, collapse = ", "), "\n")
  } else {
    cat("  All required variables exist\n")
  }
}



#' check_variable_conditions Function to check that specific variables fit specific given conditions
#'
#' @param sheet_data Data from the specific sheet in the Excel file
#' @param var_name The variable name to check
#' @param valid_values The valid values of the given variable
#' @param condition_desc Description of the condition to print to the log
check_variable_conditions <- function(sheet_data, var_name, valid_values, condition_desc) {
  
  if (var_name %in% colnames(sheet_data) && "Analytic Variable name" %in% colnames(sheet_data)) {
    
    invalid_values <- sheet_data[!(sheet_data[[var_name]] %in% valid_values), 
                                 c("Analytic Variable name", var_name)]
    invalid_values <- invalid_values[complete.cases(invalid_values), ] # Remove NA rows
    
    if (nrow(invalid_values) > 0) {
      cat("  Invalid", condition_desc, "values found for:\n")
      print(invalid_values, n = Inf)
    }
  }
}



#' check_numeric_range Check that numeric values fall within a specified range
#'
#' @param sheet_data Data from the Excel sheet
#' @param var_name Name of the variable to check
#' @param min_val Minimum value of that variable
#' @param max_val Maximum value of that variable
#' @param condition_desc Description to print to the log if check does not pass
check_numeric_range <- function(sheet_data, var_name, min_val, max_val, condition_desc) {
  
  if (var_name %in% colnames(sheet_data) && "Analytic Variable name" %in% colnames(sheet_data)) {
    
    invalid_values <- sheet_data[!(is.na(sheet_data[[var_name]]) |
                                     (sheet_data[[var_name]] >= min_val & sheet_data[[var_name]] <= max_val)), 
                                 c("Analytic Variable name", var_name)]
    invalid_values <- invalid_values[complete.cases(invalid_values), ] # Remove NA rows
    
    if (nrow(invalid_values) > 0) {
      cat("  Invalid", condition_desc, "values found for:\n")
      print(invalid_values, n = Inf)
    }
  }
}



#' check_missingness_threshold_multiplier Check that missingnessThresholdMultiplier is a non-negative number (or missing)
#'
#' @param sheet_data Data from the specific sheet in the codebook 
check_missingness_threshold_multiplier <- function(sheet_data) {
  
  if ("missingnessThresholdMultiplier" %in% colnames(sheet_data) && "Analytic Variable name" %in% colnames(sheet_data)) {
    
    invalid_values <- sheet_data[!(is.na(sheet_data$missingnessThresholdMultiplier) |
                                     sheet_data$missingnessThresholdMultiplier > 0), 
                                 c("Analytic Variable name", "missingnessThresholdMultiplier")]
    invalid_values <- invalid_values[complete.cases(invalid_values), ] # Remove NA rows
    
    if (nrow(invalid_values) > 0) {
      cat("  Invalid 'missingnessThresholdMultiplier' values found for:\n")
      print(invalid_values, n = Inf)
    }
  }
}



#' check_numRange Check the format and validity of numRange
#'
#' @param sheet_data Data from the specific sheet in the codebook
check_numRange <- function(sheet_data) {
  
  if ("numRange" %in% colnames(sheet_data) && "Analytic Variable name" %in% colnames(sheet_data)) {
    
    numRange <- as.character(sheet_data$numRange) # Ensure numRange is character
    invalid_numRange <- sheet_data[!(numRange == "" |
                                       grepl("^\\[\\s*\\d+(\\.\\d+)?\\s*,\\s*\\d+(\\.\\d+)?\\s*\\]$", numRange)), 
                                   c("Analytic Variable name", "numRange")]
    invalid_numRange <- invalid_numRange[complete.cases(invalid_numRange), ] # Remove NA rows
    
    if (nrow(invalid_numRange) > 0) {
      cat("  Invalid 'numRange' values found for:\n")
      print(invalid_numRange, n = Inf)
    }
  }
}



#' process_dataset A function to validate each tab of the codebook against the specifications
#'
#' @param codebookUrl Url to the codebook of interest
#' @param dataset Prefix of the dataset to check in the codebook
#' @param expectedVariables List of variables expected to be in the codebook
process_dataset <- function(codebookUrl, dataset, expectedVariables) {
  codebookSheets <- read_excel_sheets(codebookUrl)
  
  if (dataset_exists(dataset, codebookSheets)) {
    cat(dataset, ": Tab exists with the matching name\n")
    
    # Read the content of the sheet
    sheet_data <- read_dataset(codebookUrl, dataset)
    
    # Convert relevant columns to numeric
    if ("acceptableMissingness" %in% colnames(sheet_data)) {
      sheet_data$acceptableMissingness <- convert_to_numeric(sheet_data$acceptableMissingness)
    }
    if ("nonExtremeMissingness" %in% colnames(sheet_data)) {
      sheet_data$nonExtremeMissingness <- convert_to_numeric(sheet_data$nonExtremeMissingness)
    }
    if ("missingnessThresholdMultiplier" %in% colnames(sheet_data)) {
      sheet_data$missingnessThresholdMultiplier <- convert_to_numeric(sheet_data$missingnessThresholdMultiplier)
    }
    
    # Perform checks
    check_missing_variables(sheet_data, expectedVariables)
    check_variable_conditions(sheet_data, "essential", c(1, "", NA), "'essential'")
    check_variable_conditions(sheet_data, "uniqueKey", c(1, "", NA), "'uniqueKey'")
    check_numeric_range(sheet_data, "acceptableMissingness", 0, 1, "'acceptableMissingness'")
    check_numeric_range(sheet_data, "nonExtremeMissingness", 0, 1, "'nonExtremeMissingness'")
    check_missingness_threshold_multiplier(sheet_data)
    check_numRange(sheet_data)
  } else {
    cat(dataset, ": Tab does not exist with the matching name\n")
  }
}



#' validateCodebook Function to check structure of the codebook against specifications
#'
#' @param codebookUrl Url to the codebook
#' @param datasetNames Character vector of dataset prefixes
#'
#' @export
validateCodebook <- function(codebookUrl, datasetNames) {
  for (dataset in datasetNames) {
    process_dataset(codebookUrl
                    ,dataset
                    ,c("Analytic Variable name"
                       ,"Analytic Variable label"
                       ,"catValues"
                       ,"numRange"
                       ,"uniqueKey"
                       ,"essential"
                       ,"acceptableMissingness"
                       ,"nonExtremeMissingness"
                       ,"missingnessThresholdMultiplier"
                       ,"skipLogic")
                    )
  }
}