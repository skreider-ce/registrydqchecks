# DESCRIPTION

```
Package: registrydqchecks
Title: Run data quality checks for registries
Version: 0.0.0.9000
Authors@R: 
    person("Scott", "Kreider", , "skreider@corevitas.com", role = c("aut", "cre"))
Description: Project to run data quality checks for CorEvitas registries.
License: MIT + file LICENSE
Encoding: UTF-8
Roxygen: list(markdown = TRUE)
RoxygenNote: 7.3.2
Remotes:
    github::Corrona-IT/registrydqchecksreportdown
Imports:
    glue
    ,labelled
    ,purrr
    ,readxl
    ,dplyr
    ,lubridate
    ,haven
    ,janitor
    ,registrydqchecksreportdown
    ,openxlsx
    ,stats
    ,stringr
    ,tibble
    ,utils
```

# `addCheckId`: addCheckId Add a checkId to the first column in a dataset

## Description

addCheckId Add a checkId to the first column in a dataset

## Usage

```r
addCheckId(.ds, .checkId)
```

## Arguments

* `.ds`: The dataset to add the column to
* `.checkId`: The checkId to add to the dataset

## Value

The original dataset with .checkId added as the first column

# `calculatePercentChange`: calculatePercentChange Function to add a % change column to a gtsummary object for NC24

## Description

calculatePercentChange Function to add a % change column to a gtsummary object for NC24

## Usage

```r
calculatePercentChange(data)
```

## Arguments

* `data`: A gtsummary object with 2 levels of a by variable

## Value

The gtsummary object with an added column showing % change

# `check_missing_variables`: check_missing_variables Check that the expected variables exist in the given sheet

## Description

check_missing_variables Check that the expected variables exist in the given sheet

## Usage

```r
check_missing_variables(sheet_data, expectedVariables)
```

## Arguments

* `sheet_data`: The data from the specific sheet in the Excel file
* `expectedVariables`: Character vector of variable names that should exist in the sheet

# `check_missingness_threshold_multiplier`: check_missingness_threshold_multiplier Check that missingnessThresholdMultiplier is a non-negative number (or missing)

## Description

check_missingness_threshold_multiplier Check that missingnessThresholdMultiplier is a non-negative number (or missing)

## Usage

```r
check_missingness_threshold_multiplier(sheet_data)
```

## Arguments

* `sheet_data`: Data from the specific sheet in the codebook

# `check_numeric_range`: check_numeric_range Check that numeric values fall within a specified range

## Description

check_numeric_range Check that numeric values fall within a specified range

## Usage

```r
check_numeric_range(sheet_data, var_name, min_val, max_val, condition_desc)
```

## Arguments

* `sheet_data`: Data from the Excel sheet
* `var_name`: Name of the variable to check
* `min_val`: Minimum value of that variable
* `max_val`: Maximum value of that variable
* `condition_desc`: Description to print to the log if check does not pass

# `check_numRange`: check_numRange Check the format and validity of numRange

## Description

check_numRange Check the format and validity of numRange

## Usage

```r
check_numRange(sheet_data)
```

## Arguments

* `sheet_data`: Data from the specific sheet in the codebook

# `check_variable_conditions`: check_variable_conditions Function to check that specific variables fit specific given conditions

## Description

check_variable_conditions Function to check that specific variables fit specific given conditions

## Usage

```r
check_variable_conditions(sheet_data, var_name, valid_values, condition_desc)
```

## Arguments

* `sheet_data`: Data from the specific sheet in the Excel file
* `var_name`: The variable name to check
* `valid_values`: The valid values of the given variable
* `condition_desc`: Description of the condition to print to the log

# `checkForAddedRows`: Check for how many rows were added to the dataset compared to last month

## Description

Check for how many rows were added to the dataset compared to last month

## Usage

```r
checkForAddedRows(.dsToCheck, .compDsToCheck)
```

## Arguments

* `.dsToCheck`: A dataframe to check
* `.compDsToCheck`: A dataframe from last month

## Value

A list with pass/fail, number of rows added, number of old rows, and the proportion increase in rows

# `checkForDuplicateUniqueIds`: Check for duplicate unique IDs in a given dataset

## Description

Check for duplicate unique IDs in a given dataset

## Usage

```r
checkForDuplicateUniqueIds(.dsToCheck, .uniqueKey)
```

## Arguments

* `.dsToCheck`: A dataframe of the dataset to check
* `.uniqueKey`: A character vector that contains the names of the unique keys

## Value

A list with pass/fail, number of duplicate rows, and a list of ids that are duplicates

# `checkForExtraVariables`: Check that there are no extra variables compared to the variables that should be there

## Description

Check that there are no extra variables compared to the variables that should be there

## Usage

```r
checkForExtraVariables(.dsToCheck, .listOfSupposedVars)
```

## Arguments

* `.dsToCheck`: A dataframe of the dataset to check
* `.listOfSupposedVars`: A character vector with the names of the variables that should be in the dataset

## Value

A list with pass/fail, the number of extra variables, and a list of the extra variables

# `checkForGivenItemsNonresponse`: Check the missingness for the given items

## Description

Check the missingness for the given items

## Usage

```r
checkForGivenItemsNonresponse(.dsToCheck, .listOfEssentialVars)
```

## Arguments

* `.dsToCheck`: A dataframe to check
* `.listOfEssentialVars`: A character vector with the variables deemed "essential"

## Value

A list with pass/fail, and a dataframe with the information on the missingness for those variables

# `checkForMissingVariableLabels`: Check if any variables have missing labels

## Description

Check if any variables have missing labels

## Usage

```r
checkForMissingVariableLabels(.dsToCheck)
```

## Arguments

* `.dsToCheck`: A dataframe to check

## Value

A list with pass/fail, the number of variables with missing labels, and a list of the variables with missing labels

# `checkForMonthlyMissingness`: Check the month-to-month missingness for the given items

## Description

Check the month-to-month missingness for the given items

## Usage

```r
checkForMonthlyMissingness(.dsToCheck, .compDsToCheck, .listOfEssentialVars)
```

## Arguments

* `.dsToCheck`: A dataframe to check
* `.compDsToCheck`: A dataframe to check from last month
* `.listOfEssentialVars`: A character vector with the variables deemed "essential"

## Value

A list with pass/fail, and a dataframe with the information on the missingness for those variables between the two datasets

# `checkForOmittedVariables`: Check for variables that have been left out of the comparator list

## Description

Check for variables that have been left out of the comparator list

## Usage

```r
checkForOmittedVariables(.dsToCheck, .listOfSupposedVars)
```

## Arguments

* `.dsToCheck`: A dataframe of the dataset to check
* `.listOfSupposedVars`: A character vector containing the list of variables that should be in the dataset

## Value

A list with pass/fail, the number of omitted variables, and a list of the omitted variables

# `checkForRemovedRows`: Check for rows that were in last months dataset but are not in this month

## Description

Check for rows that were in last months dataset but are not in this month

## Usage

```r
checkForRemovedRows(.dsToCheck, .compDsToCheck, .uniqueKey)
```

## Arguments

* `.dsToCheck`: A dataframe to check
* `.compDsToCheck`: A dataframe from last month
* `.uniqueKey`: A character vector with names of variables that define the unique keys

## Value

A list with pass/fail, number of removed rows, and a listing of unique keys that were removed

# `checkForValidAgeAtEnrollment`: checkForValidAgeAtEnrollment DQ check for CC10 - Check that age

## Description

checkForValidAgeAtEnrollment DQ check for CC10 - Check that age

## Usage

```r
checkForValidAgeAtEnrollment(
  .dsName,
  .dsToCheck,
  .codebookVariables,
  .uniqueKeys
)
```

## Arguments

* `.dsName`: The name of the dataset being checked
* `.dsToCheck`: The dataset to check
* `.codebookVariables`: The codebook variables for the dataset
* `.uniqueKeys`: The list of unique keys

## Value

The results of the check

# `checkForVariableTypes`: Check if any variables have unexpected types

## Description

Check if any variables have unexpected types

## Usage

```r
checkForVariableTypes(.dsToCheck, .codebookVariables)
```

## Arguments

* `.dsToCheck`: A dataframe to check
* `.codebookVariables`: The codebook variables for this specific check

## Value

A list with pass/fail, the number of variables with unexpected types, and a list of the variables with unexpected types

# `cleanUniqueKeyClasses`: cleanUniqueKeyClasses Remove vctrs_vctr and haven_labelled from the classes of uniqueKey variables

## Description

cleanUniqueKeyClasses Remove vctrs_vctr and haven_labelled from the classes of uniqueKey variables

## Usage

```r
cleanUniqueKeyClasses(datasetToCheck, uniqueKeyVars)
```

## Arguments

* `datasetToCheck`: The data to remove the classes from
* `uniqueKeyVars`: The uniqueKey variables

## Value

the dataset with vctrs_vctr and haven_labelled removed from the classes of the uniqueKey variables

# `codebookNcChecks`: codebookNcChecks Run the codebook-specific noncritical checks and return the values

## Description

codebookNcChecks Run the codebook-specific noncritical checks and return the values

## Usage

```r
codebookNcChecks(
  .dsName,
  .dsToCheck,
  .compDsToCheck,
  .codebookVariables,
  .uniqueKeys
)
```

## Arguments

* `.dsName`: Name of the dataset being checked
* `.dsToCheck`: The dataset being checked
* `.compDsToCheck`: The comparator dataset being checked
* `.codebookVariables`: The variables from the codebook to run the checks
* `.uniqueKeys`: A character vector of the unique keys for the given dataset

## Value

.resultsOfCodebookNcChecks results of the codebookNcChecks

# `convert_to_numeric`: convert_to_numeric Convert columns from character to numeric

## Description

convert_to_numeric Convert columns from character to numeric

## Usage

```r
convert_to_numeric(column)
```

## Arguments

* `column`: Name of the column to convert

# `copyRomListingToFolder`: copyRomListingToFolder Copy the CDM/ROM listing to the appropriate folder upon request

## Description

copyRomListingToFolder Copy the CDM/ROM listing to the appropriate folder upon request

## Usage

```r
copyRomListingToFolder(
  .reportOutputUrl,
  .romReportUrl,
  .registry,
  .dataPullDate,
  .overwrite = FALSE
)
```

## Arguments

* `.reportOutputUrl`: The url to the base report folder where the DQ report has been output
* `.romReportUrl`: The url to the location for ROM/CDM to view the listing
* `.registry`: A text string with the initials of the specific registry ("ad", "ms", "raj", "aa", "pso", "ibd", "nmo")
* `.dataPullDate`: A date string of the data pull date in the format YYYY-DD-MM (e.g. "2024-01-10")
* `.overwrite`: (OBSOLETE) Whether or not to overwrite the currently existing report in the CDM/ROM folder (DEFAULT = FALSE)

## Value

The full string URL to the location of the Excel file in the new location

# `createDataStoreFolder`: Create a new folder at the specified location if it doesn't already exist

## Description

Create a new folder at the specified location if it doesn't already exist

## Usage

```r
createDataStoreFolder(.urlToCreate)
```

## Arguments

* `.urlToCreate`: A url string to the folder to be created

# `criticalChecks`: Run the critical checks on the specified files

## Description

Run the critical checks on the specified files

## Usage

```r
criticalChecks(
  .dsToCheck,
  .compDsToCheck,
  .listOfEssentialVars,
  .listOfSupposedVars,
  .uniqueKeys,
  .codebookVariables,
  .dsName
)
```

## Arguments

* `.dsToCheck`: A dataframe of the dataset to run the checks on
* `.compDsToCheck`: A dataframe of the dataset to compare the above dataset to
* `.listOfEssentialVars`: A character vector of variables deemed "essential"
* `.listOfSupposedVars`: A character vector of variables that "should" be in the dataset
* `.uniqueKeys`: A character vector of variables that uniquely identify rows in the dataset
* `.codebookVariables`: The codebook variables for the dataset
* `.dsName`: The name of the dataset being checked

## Value

A list with the results of the critical checks

# `dataset_exists`: dataset_exists Check if a given dataset name has a corresponding sheet in the codebook

## Description

dataset_exists Check if a given dataset name has a corresponding sheet in the codebook

## Usage

```r
dataset_exists(dataset, codebookSheets)
```

## Arguments

* `dataset`: The dataset name to check against the sheet names
* `codebookSheets`: Names of the sheets in the codebook

# `extractValueLabels`: extractValueLabels Extract the values after the equal sign in each element in a vector

## Description

extractValueLabels Extract the values after the equal sign in each element in a vector

## Usage

```r
extractValueLabels(vec)
```

## Arguments

* `vec`: A vector to extract labels from

## Value

A vector of the labels of the levels of the variable

# `extractValueNumbers`: extractValueNumbers Extract the numbers before the equal sign in each element in a vector

## Description

extractValueNumbers Extract the numbers before the equal sign in each element in a vector

## Usage

```r
extractValueNumbers(vec)
```

## Arguments

* `vec`: A vector to extract numbers from

## Value

A vector of numbers of the levels of the variable

# `filterPercentChange`: filterPercentChange Filter a gtsummary object to only show rows with percentChange >5

## Description

filterPercentChange Filter a gtsummary object to only show rows with percentChange >5

## Usage

```r
filterPercentChange(data)
```

## Arguments

* `data`: The gtsummary object to filter

## Value

The filtered dataset

# `generateCheckSummary`: generateCheckSummary

## Description

generateCheckSummary

## Usage

```r
generateCheckSummary(.resultsOfChecks)
```

## Arguments

* `.resultsOfChecks`: A list containing "criticalChecks" and "nonCriticalChecks" in the appropriate CE DQ format

## Value

A list with the summaries of the critical and noncritical checks

# `generateCriticalCheckSummary`: generateCriticalCheckSummary

## Description

generateCriticalCheckSummary

## Usage

```r
generateCriticalCheckSummary(.criticalChecksToSummarize)
```

## Arguments

* `.criticalChecksToSummarize`: The critical checks to be summarized in the appropriate CE DQ format

## Value

Dataframe with a summary of the critical checks for the datasets

# `generateNoncriticalCheckSummary`: generateNoncriticalCheckSummary

## Description

generateNoncriticalCheckSummary

## Usage

```r
generateNoncriticalCheckSummary(.nonCriticalChecksToSummarize)
```

## Arguments

* `.nonCriticalChecksToSummarize`: The noncritical checks to be summarized in the appropriate CE DQ format

## Value

Dataframe with a summary of the critical checks for the datasets

# `outputListings`: Output specified listings in xlsx format for further review

## Description

Output specified listings in xlsx format for further review

## Usage

```r
outputListings(
  .registry,
  .listingUrl,
  .yearMonthTimestamp,
  .dataPullDate,
  .timestamp,
  .checksToOutput,
  .activeSites
)
```

## Arguments

* `.registry`: Name of the registry being checked
* `.listingUrl`: Url to where the listing output will live
* `.yearMonthTimestamp`: The year and month of the current datapull
* `.dataPullDate`: The YYYY-MM-DD of the current datapull
* `.timestamp`: Timestamp of the current run
* `.checksToOutput`: Registry DQ checks to output in list form with criticalChecks and nonCriticalChecks entries
* `.activeSites`: Information on the list of active sites for this registry

## Value

A text string with the URL to the CDM/ROM Excel listing

# `perpetuateExcelComments`: perpetuateExcelComments A function to read in the CDM/ROM report from last month and pull comments and place them in the new report

## Description

perpetuateExcelComments A function to read in the CDM/ROM report from last month and pull comments and place them in the new report

## Usage

```r
perpetuateExcelComments(
  .lastMonthCheckExcelFileUrl,
  .thisMonthCheckExcelFileUrl
)
```

## Arguments

* `.lastMonthCheckExcelFileUrl`: A direct URL to the Excel file from last month
* `.thisMonthCheckExcelFileUrl`: A direct URL to the Excel file from this month

# `process_dataset`: process_dataset A function to validate each tab of the codebook against the specifications

## Description

process_dataset A function to validate each tab of the codebook against the specifications

## Usage

```r
process_dataset(codebookUrl, dataset, expectedVariables)
```

## Arguments

* `codebookUrl`: Url to the codebook of interest
* `dataset`: Prefix of the dataset to check in the codebook
* `expectedVariables`: List of variables expected to be in the codebook

# `pullCodebookFromExcelFile`: (internal function) Pull a registrydqchecks specific codebook from a specified location

## Description

(internal function) Pull a registrydqchecks specific codebook from a specified location

## Usage

```r
pullCodebookFromExcelFile(.fileUrl, .sheetName)
```

## Arguments

* `.fileUrl`: A text url to the Excel file to pull in
* `.sheetName`: A text string with the name of the sheet to pull from

## Value

A dataframe with the columns from the file that had been specified

# `pullData`: (internal function) A function to pull the R dataset from the given url location

## Description

(internal function) A function to pull the R dataset from the given url location

## Usage

```r
pullData(.datasetUrl, .isR = TRUE)
```

## Arguments

* `.datasetUrl`: A url string that points to the location of the dataset
* `.isR`: A boolean indicating if the dataset is a .RDS or a .DTA (default = TRUE)

## Value

A dataframe of the dataset that was pulled

# `pullDTAfromUrl`: (internal function) Pull a .DTA file from a specified path

## Description

(internal function) Pull a .DTA file from a specified path

## Usage

```r
pullDTAfromUrl(.datasetUrl)
```

## Arguments

* `.datasetUrl`: A url string to the .DTA file being pulled

## Value

A dataframe of the file being pulled

# `pullRDSfromUrl`: (internal function) Pull a .RDS file from a specified path

## Description

(internal function) Pull a .RDS file from a specified path

## Usage

```r
pullRDSfromUrl(.datasetUrl)
```

## Arguments

* `.datasetUrl`: A url string to the .RDS file being pulled

## Value

A dataframe of the file being pulled

# `pullSiteInfoFromExcelFile`: (internal function) pullSiteInfoFromExcelFile Pull a site information

## Description

(internal function) pullSiteInfoFromExcelFile Pull a site information

## Usage

```r
pullSiteInfoFromExcelFile(.fileUrl, .registry)
```

## Arguments

* `.fileUrl`: A text url to the Excel file to pull in
* `.registry`: The acronym for the current registry

## Value

A dataframe with the columns from the file that had been specified

# `pullVariableListFromExcelFile`: (internal function) Pull a list of variables from a specific column in a specific excel file

## Description

(internal function) Pull a list of variables from a specific column in a specific excel file

## Usage

```r
pullVariableListFromExcelFile(.fileUrl, .fileName, .sheetName, .colName)
```

## Arguments

* `.fileUrl`: A text url to the location of the Excel file
* `.fileName`: A text string with the name of the file
* `.sheetName`: A text string with the name of the sheet to pull from
* `.colName`: A character vector with the names of the columns to pull from

## Value

A dataframe that contains the columns that have been specified

# `read_dataset`: read_dataset Read the data from a specific sheet in the codebook

## Description

read_dataset Read the data from a specific sheet in the codebook

## Usage

```r
read_dataset(codebookUrl, dataset)
```

## Arguments

* `codebookUrl`: A url to the codebook
* `dataset`: The name of the dataset tab

# `read_excel_sheets`: read_excel_sheets Read the names of the sheets in the given excel file

## Description

read_excel_sheets Read the names of the sheets in the given excel file

## Usage

```r
read_excel_sheets(codebookUrl)
```

## Arguments

* `codebookUrl`: A url to the codebook

# `README`: README

## Description

README

## Usage

```r
README()
```

## Value

Prints out text for README

# `removeQuotes`: removeQuotes A function to remove quotes from each element in a character string

## Description

removeQuotes A function to remove quotes from each element in a character string

## Usage

```r
removeQuotes(vec)
```

## Arguments

* `vec`: A vector to remove quotes from

# `replaceNullWithNa`: replaceNullWithNa Replace NULL values with NA in specified columns of a dataframe

## Description

replaceNullWithNa Replace NULL values with NA in specified columns of a dataframe

## Usage

```r
replaceNullWithNa(df, columns)
```

## Arguments

* `df`: A dataframe in which to replace NULL values
* `columns`: A vector of column names or indices where NULL values should be replaced with NA

## Value

The dataframe with NULL values replaced with NA in the specified columns

# `runCategoricalValueChecks`: runCategoricalValueChecks Run a check to ensure categorical variables have the appropriate values

## Description

runCategoricalValueChecks Run a check to ensure categorical variables have the appropriate values

## Usage

```r
runCategoricalValueChecks(.dsName, .dsToCheck, .codebookVariables, .uniqueKeys)
```

## Arguments

* `.dsName`: The name of the dataset being checked
* `.dsToCheck`: The dataset being checked
* `.codebookVariables`: The codebook variables for this specific check
* `.uniqueKeys`: The unique keys for the dataset

## Value

Results of the check

# `runMonthlyMissingnessCheck`: runMonthlyMissingnessCheck Run a check to look at amount of month-to-month missingness for all variables

## Description

runMonthlyMissingnessCheck Run a check to look at amount of month-to-month missingness for all variables

## Usage

```r
runMonthlyMissingnessCheck(.dsToCheck, .compDsToCheck, .codebookVariables)
```

## Arguments

* `.dsToCheck`: The dataset to run the checks on
* `.compDsToCheck`: The dataset from last month to compare to
* `.codebookVariables`: The codebook-specific variables needed for this check

## Value

Results of the check

# `runNumericRangeChecks`: runNumericRangeChecks Run a check to ensure numeric variables fall within an appropriate range

## Description

runNumericRangeChecks Run a check to ensure numeric variables fall within an appropriate range

## Usage

```r
runNumericRangeChecks(.dsName, .dsToCheck, .codebookVariables, .uniqueKeys)
```

## Arguments

* `.dsName`: The name of the dataset being checked
* `.dsToCheck`: The dataset being checked
* `.codebookVariables`: The codebook variabled needed for this specific check
* `.uniqueKeys`: The unique keys for the dataset being checked

## Value

Results of the check

# `runRangeAndValueChecks`: runRangeAndValueChecks Run nc1 which checks the numeric and categorical variables against their supposed values

## Description

runRangeAndValueChecks Run nc1 which checks the numeric and categorical variables against their supposed values

## Usage

```r
runRangeAndValueChecks(.dsName, .dsToCheck, .codebookVariables, .uniqueKeys)
```

## Arguments

* `.dsName`: The name of the dataset being checked
* `.dsToCheck`: The dataset to run the checks on
* `.codebookVariables`: The codebook variables for this specific check
* `.uniqueKeys`: The unique keys for the dataset being checked

## Value

The results of the numeric range and categorical value checks

# `runReasonableMissingnessCheck`: runReasonableMissingnessCheck Run a check to look at reasonable amount of missingness for all variables

## Description

runReasonableMissingnessCheck Run a check to look at reasonable amount of missingness for all variables

## Usage

```r
runReasonableMissingnessCheck(.dsToCheck, .codebookVariables)
```

## Arguments

* `.dsToCheck`: The dataset to run the checks on
* `.codebookVariables`: The codebook variables needed to run this specific check

## Value

Results of the check

# `runRegistryChecks`: The main function call to run the CorEvitas Registry DQ Checks and the Report

## Description

The main function call to run the CorEvitas Registry DQ Checks and the Report

## Usage

```r
runRegistryChecks(
  .registry = "defaultRegistry",
  .prelimDataFolderUrl,
  .prelimDataPullDate,
  .lastMonthDataFolderUrl,
  .lastMonthDataPullDate,
  .codebookUrl,
  .siteInfoUrl = NULL,
  .cdmRomReportUrl,
  .datasetsToCheck,
  .nonCriticalChecks = NULL,
  .outputUrl,
  .isR
)
```

## Arguments

* `.registry`: A text string with the initials of the specific registry ("ad", "ms", "raj", "aa", "pso", "ibd", "nmo")
* `.prelimDataFolderUrl`: (FOLDER URL) A url string to the FOLDER with the preliminary datasets
* `.prelimDataPullDate`: A date string of the data pull date in the format YYYY-DD-MM (e.g. "2024-01-10")
* `.lastMonthDataFolderUrl`: (FOLDER URL) A url string to the FOLDER with the last month's datasets
* `.lastMonthDataPullDate`: A date string of last month's data pull date in the format YYYY-DD-MM (e.g. "2023-12-05")
* `.codebookUrl`: (FILE URL - .XLSX) A url string to the registry-specific codebook FILE (MUST BE DIRECTLY TO THE .XLSX FILE)
* `.siteInfoUrl`: (FILE URL - .CSV) A Url to the FILE for site/provider data (MUST BE DIRECTLY TO THE site_data_clean.csv FILE)
* `.cdmRomReportUrl`: (FOLDER URL) A url string to the location of the base CDM/ROM Report folder
* `.datasetsToCheck`: A string vector with the names of the datasets to be checked (e.g. c("exvisit", "exlab", "exdrugexp")) - NOTE: These must perfectly match both the tab names in the codebook AND the names of the datasets being checked
* `.nonCriticalChecks`: A list of the manually generated non-critical checks in the CE DQ specified format (see additional documentation)
* `.outputUrl`: (FOLDER URL) A url string to the location of the output datasets - NOTE: A subfolder will be created here called /checks that will house the results of the checks and will be the location called by the check report
* `.isR`: A boolean indicating if the datasets being checked are in R or Stata format (e.g. if R then .isR = TRUE; if Stata then .isR = FALSE)

## Value

A personalized URL to the location of the report

# `submitToDataStore`: (internal function) Submit the results of the data quality checks to a set location

## Description

(internal function) Submit the results of the data quality checks to a set location

## Usage

```r
submitToDataStore(
  .registry,
  .dsPullDate,
  .timestamp,
  .folderName,
  .dataStoreUrl,
  .resultsOfChecks,
  .activeSites,
  .cdmRomReportUrl,
  .lastMonthDataPullDate
)
```

## Arguments

* `.registry`: A text string with the initials of the registry (e.g. "ad", "pso", "ms")
* `.dsPullDate`: A date string of the data pull date in YYYY-MM-DD format (e.g. "2024-01-10")
* `.timestamp`: Timestamp that the checks were run
* `.folderName`: Name for the folder where results will be output
* `.dataStoreUrl`: A text url of the location where the check results will be stored
* `.resultsOfChecks`: A list with the results of the data checks
* `.activeSites`: Information on the list of active sites for this registry
* `.cdmRomReportUrl`: (FOLDER URL) A url string to the location of the base CDM/ROM Report folder
* `.lastMonthDataPullDate`: A date string of last month's data pull date in the format YYYY-DD-MM (e.g. "2023-12-05")

# `subsetDatasetToActiveSites`: subsetDatasetToActiveSites Function to subset dataset based on active sites

## Description

subsetDatasetToActiveSites Function to subset dataset based on active sites

## Usage

```r
subsetDatasetToActiveSites(.dataset, .siteVar1, .siteVar2, .activeSites)
```

## Arguments

* `.dataset`: The dataset to subset
* `.siteVar1`: The primary site variable to check for
* `.siteVar2`: The secondary site variable to check for
* `.activeSites`: The date of the current datapull

## Value

The subset dataset

# `subsetDatasetToLastYear`: subsetDatasetToLastYear Function to subset dataset to last year for given date variables

## Description

subsetDatasetToLastYear Function to subset dataset to last year for given date variables

## Usage

```r
subsetDatasetToLastYear(.dataset, .timeVar1, .timeVar2, .dataPullDate)
```

## Arguments

* `.dataset`: The dataset to subset
* `.timeVar1`: The primary time variable to check for
* `.timeVar2`: The secondary variable to check for
* `.dataPullDate`: The date of the current datapull

## Value

The subset dataset

# `subsetDatasetToNonCalculatedVariables`: subsetDatasetToNonCalculatedVariables Function to subset dataset based on active sites

## Description

subsetDatasetToNonCalculatedVariables Function to subset dataset based on active sites

## Usage

```r
subsetDatasetToNonCalculatedVariables(.dataset)
```

## Arguments

* `.dataset`: The dataset to subset

## Value

The subset dataset

# `validateCodebook`: validateCodebook Function to check structure of the codebook against specifications

## Description

validateCodebook Function to check structure of the codebook against specifications

## Usage

```r
validateCodebook(codebookUrl, datasetNames)
```

## Arguments

* `codebookUrl`: Url to the codebook
* `datasetNames`: Character vector of dataset prefixes

