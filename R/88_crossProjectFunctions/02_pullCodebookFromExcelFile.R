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

pullCodebookFromExcelFile <- function(.fileUrl,.fileName,.sheetName){
  
  .codebookColumns <- c(
    "varName"
    ,"varLabel"
    ,"varType"
    ,"catValues"
    ,"numRangeLower"
    ,"numRangeUpper"
    ,"charLength"
    ,"uniqueKey"
    ,"essential"
    ,"acceptableMissingness"
    ,"nonExtremeMissingness"
    ,"requiredNonMissing"
  )
  
  .pulledVars <- readxl::read_xlsx(
    glue("{.fileUrl}/{.fileName}.xlsx")
    ,sheet = .sheetName
  )
  
  return(.pulledVars[.codebookColumns])
}

