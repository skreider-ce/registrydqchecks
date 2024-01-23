# install.packages("RegistryDQChecks")
# library(RegistryDQChecks)

# criticalCheck main() function that runs the individual critical checks
#
#   Input: .dsToCheck = The [dataframe] to Check
#           .compDsToCheck = The [dataframe] to compare to (usually the previous months datapull)
#           .listOfEssentialVars = A [character vector] with the variable names deemed "essential"
#           .listOfSupposedVars = A [character vector] with the variable names that "should" be in the dataset
#           .uniqueKey = A [character vector] of the unique keys for the dataset being checked
#
#   Returns: a list with
#     $criticalCheck1 = list with results from checkForDuplicateUniqueIds
#     $criticalCheck2 = list with results from checkForOmittedVariables
#     $criticalCheck3 = list with results from checkForExtraVariables
#     $criticalCheck4 = list with results from checkForMissingVariableLabels
#     $criticalCheck5 = list with results from checkForAddedRows
#     $criticalCheck6 = list with results from checkForRemovedRows
#     $criticalCheck7 = list with results from checkForGivenItemsNonresponse
#     $criticalCheck8 = list with results from checkForMonthlyMissingness
#
#   TO UPDATE: add additional critical checks
#



# Prerequisites
#     A [list] of check results exists
#     A [text URL] is available to store the data
#
# GIVEN a [list] of results from data checks
#   AND GIVEN a [text URL] of where to store the data
#   THEN store the results in the specified location

# Submit results of checks to a data storage location
#   FUNCTION: submitToDataStore(.resultsOfChecks)
#
#   Input: .resultsOfChecks [list] = results of the data checks to be stored
#
#   Returns: n/a
#
#   TO DO:
#       1) [what needs done]
#


# source("./R/01_pullRDSfromUrl.R")
# source("./R/02_pullDTAfromUrl.R")

# Given a direct link, in URL format, to the dataset you want to pull
#   AND Given an indication if the dataset is an R dataset or not
#   PULL the dataset from the given location
#   RETURN a [dataframe] of the dataset being pulled


# FUNCTION: Primary pullData() function that pulls the file from the specified URL
#
#   Input: The direct URL of the dataset to pull
#           .datasetUrl = URL to the Registry parent directory
#           .isR = boolean - TRUE if dataset being pulled is an RDS file (FALSE if a .dta)
#                   DEFAULT: TRUE
#
#   Returns: a [dataframe] of the dataset being pulled
#



# FUNCTION: pullRDSfromUrl that pulls the RDS file from the specified direct URL
#
#   Input: The URL of the RDS dataset to pull
#           .datasetUrl = URL directly to the RDS dataset to pull
#
#   Returns: a [dataframe] of the dataset being pulled
#



# FUNCTION: pullDTAfromUrl that pulls the DTA file from the specified direct URL
#
#   Input: The URL of the DTA dataset to pull
#           .datasetUrl = URL directly to the DTA dataset to pull
#
#   Returns: a [dataframe] of the dataset being pulled
#


# Given you have a dataframe you want to check
#   AND Given a list of the variables that are used as a unique key
#   THEN Run the specified Critical Check on the dataframe
#     AND Output the results of the Critical Check

# Critical Check 1
#   Test for 0 duplicates based on given unique key
#
#   Input: The [dataframe] to Check
#           A list (...) of variables to be used as the unique key
#   Returns: A [list] with
#           $pass = [boolean] with whether or not the number of duplicates is > 0
#           $nDuplicateRows = [number] of rows of the dataset which indicates the number of duplicate rows
#           $listOfDuplicateRows = [dataframe] of the duplicated IDs
#



# Prerequisites
#     A [dataframe] exists to check
#     A [character vector] exists with the required variables
#
# GIVEN A [dataframe] to check
#   AND GIVEN a [character vector] of supposed variables
#   THEN I should compare the supposed variables to the variables in the dataset to check
#     AND return a [character vector] of variables not in the dataset

# Check for variables omitted from the dataset
#   FUNCTION: checkForOmittedVariables()
#
#   Input: .dsToCheck = a [dataframe] to check the variables of
#           .listOfSupposedVars = a [character vector] of variables that should be there
#
#   Returns: $pass = [boolean] TRUE (no omitted variables) or FALSE (variables are omitted)
#           $numOmittedVars = [numeric] the number of variables omitted
#           $omittedVars = [character vector] of the omitted variables
#
#   TO DO:
#       1) [what needs done]
#       2) [what else needs done]
#



# Prerequisites
#     A [dataframe] exists to check
#     A [character vector] exists with the required variables
#
# GIVEN A [dataframe] to check
#   AND GIVEN a [character vector] of supposed variables
#   THEN I should compare the supposed variables to the variables in the dataset to check
#     AND return a [character vector] of variables not in the dataset

# Check for variables extra in the the dataset
#   FUNCTION: checkForExtraVariables()
#
#   Input: .dsToCheck = a [dataframe] to check the variables of
#           .listOfSupposedVars = a [character vector] of variables that should be there
#
#   Returns: $pass = [boolean] TRUE (no extra variables) or FALSE (variables are all the same)
#           $numExtraVars = [numeric] the number of variables extra
#           $extraVars = [character vector] of the extra variables
#
#   TO DO:
#       1) [what needs done]
#       2) [what else needs done]
#



# Critical Check 4
#   Test for 0 missing variable labels
#
#   Input: The [dataframe] to Check
#   Returns: A [list] with
#           $pass = [boolean] with whether or not the number of vars with missing labels is > 0
#           $nMissingVariableLabels = [number] of variables with missing labels
#           $listOfVarsWithMissingLabels = [vector] of the variables with missing labels
#



# Given I have a current dataset
#   AND Given I have a previous dataset to compare it to
#   RETURN number of rows in the new dataset compared to the old
#     AND number of rows in the old dataset
#     AND the proportion of the change in the number of rows

# Critical Check 5
#   FUNCTION: checkForAddedRows() Test for reasonable number of added rows
#
#   Input: The [dataframe] to Check
#           The [dataframe] to compare to (usually the previous month datapull)
#           A list (...) of the unique keys for the dataset
#   Returns: A [list] with
#           $nAddedRows = [number] of new rows in the dataset
#           $nOldRows = [number] of rows in the compare dataset
#           $propRowIncrease = [proportion] increase in the number of rows from last to now
#                 NOTE: (nNew - nOld) / (nOld)
#
#   TO DO:
#       1) Decide how to handle parameterizing the "proportion" to compare to
#



# Given I have a current dataset
#   AND Given I have a previous dataset to compare it to
#   RETURN number of rows in the old dataset that are not in the new dataset
#     AND RETURN a dataframe of those rows for followup

# Critical Check 6
#   FUNCTION: checkForRemovedRows() Test for reasonable number of removed rows
#
#   Input: The [dataframe] to Check
#           The [dataframe] to compare to (usually the previous month datapull)
#           A list (...) of the unique keys for the dataset
#   Returns: A [list] with
#           $nRemovedRows = [number] of rows in .compDsToCheck but not in .dsToCheck
#           $inOldAndNotInNew = [dataframe] of rows in .compDsToCheck but not in .dsToCheck
#
#   TO DO:
#       1) Decide how to handle what to compare to
#



# Prerequisites
#   A dataset exists in [dataframe] format that you want to check
#   A list of variables exists in [character vector] format that are deemed essential
#
# GIVEN A [dataframe] to check
#   AND GIVEN a [character vector] of essential variables
#   THEN FOR EACH essential variable
#     CALCULATE percentage of missing values
#       AND RETURN that value

# Essential item nonresponse is low
#   FUNCTION: checkForGivenItemsNonresponse(.dsToCheck, .listOfEssentialVars)
#
#   Input: [dataframe] .dsToCheck = the dataset to check
#           [character vector] .listOfEssentialVars = list of variables deemed essential
#
#   Returns: A [list] containing the results
#             $essentialVariablesMissingness = dataframe that contains a row for each
#                 essential variable and the number and proportion of missingness
#
#   TO DO:
#       1) Determine "pass" vs "fail"
#       2) Determine if item nonresponse should be just for NEW rows
#       3) Add tests for this
#



# Prerequisites
#   A dataset exists in [dataframe] format that you want to check
#   A dataset exists in [dataframe] format that you want to compare to
#   A list of variables exists in [character vector] format that are deemed essential
#
# GIVEN A [dataframe] to check
#   AND GIVEN a [dataframe] to compare to
#   AND GIVEN a [character vector] of essential variables
#   THEN FOR EACH essential variable
#     CALCULATE percentage of missing values
#       AND RETURN that value

# Essential item nonresponse is low between comparative datasets
#   FUNCTION: checkForMonthlyMissingness()
#
#   Input: .dsToCheck = a [dataframe] to check
#           .compDsToCheck = a [dataframe] to compare to
#           .listOfEssentialVars = a [character vector] of variables deemed essential
#
#   Returns: [a description of the return type]
#           $essentialVariablesMissingness = dataframe that contains a row for each
#                 essential variable and the number and proportion of missingness
#
#   TO DO:
#       1) [what needs done]
#       2) [what else needs done]
#       […]
#


# Create a folder to store the data if it does not exist
#   FUNCTION: createDataStoreFolder()
#
#   Input: .urlToCreate [text string] = url of the folder to store the data
#
#   Returns: n/a
#



# Prerequisites
#   - An Excel file that has a column of variable names of interest
#
# GIVEN An [Excel file] with variable names of interest
#   THEN READ in the list
#     AND RETURN a [character vector] with the list of variable names

# Pull a list of variables from an Excel file and store in a character string
#   FUNCTION: pullVariableListFromExcelFile()
#
#   Input: .fileUrl [url char] = URL string to the file of interest
#           .fileName [char] = the name of the Excel file
#           .sheetName [char] = the name of the sheet you want to pull from
#           .colname [char] = the column name that has the variables of interest
#
#   Returns: A [character vector] with the variables of interest
#
#   TO DO:
#       1) [what needs done]
#



# Prerequisites
#   - An Excel file in [codebook format] that has the columns of interest
#
# GIVEN An [Excel file] with variable names of interest
#   THEN READ in the file
#     AND RETURN a [dataframe] with the variables and their information

# Pull a list of variables from an Excel file and store in a character string
#   FUNCTION: pullCodebookFromExcelFile()
#
#   Input: .fileUrl [url char] = URL string to the file of interest
#           .fileName [char] = the name of the Excel file
#           .sheetName [char] = the name of the sheet you want to pull from
#
#   Returns: A [dataframe] with the variables of interest
#
#   TO DO:
#       1) [what needs done]
#


# Run the registry-specific checks
#   FUNCTION: runRegistryChecks()
#
#   Input: .registry [char] = the abbreviation for the registry being run
#             ... = remaining list of variable being sent in to the specific checks
#
#   Returns: .registryCheck [list] = list of the checks that were run
#
#   TO DO:
#       1) [what needs done]
#


