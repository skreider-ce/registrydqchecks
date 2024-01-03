#-----------------------------------------------------------
# Program: 00_main.R
# Author:  Ryan Harrison
# Date:    2021-10-19
# Purpose: Main File for {REG-###} Query
#-----------------------------------------------------------

#----------------
# Load Libraries
#----------------
# Load packages used in the analysis at the very beginning.
# Be mindful of namespace conflicts, and versions of packages being used
# Save session information so you can recreate the environment at a later date

library(tidyverse, warn.conflicts = FALSE) # Recommended packages for data manipulation
library(arsenal)                           # Recommended package for creating tables
library(tidycoRe)                          # Internal package for CorEvitas helper functions, styles, templates
library(lubridate)                         # Recommended package for manipulating dates
library(glue)                              # Recommended package for concatenating strings


#------------------
# Session Info Log
#------------------
writeLines(capture.output(sessionInfo()), "sessionInfo.txt")

#-------------
# Freeze Date
#-------------

# Set the date of your data extract for future use
# Recommended to use ISO 8601 format: YYYY-MM-DD or YYYYMMDD
frz_dt <- "2021-11-01"

# Use lubridate to extract  year
frz_yr <- lubridate::as_date(frz_dt) %>% lubridate::year(.)

#-----------------
# Set Directories
#-----------------
# Use relative paths to point to relevant directories

# "~" refers to your HOME directory
# ".." goes up one level in the directory structure
# "." refers to your current working directory
# The current working directory should be the location of your .RProj file for this GitHub repository

# Registry data should be imported directly from its source: either Sharepoint (currently as of 2021) or AWS (future)
sharepoint_dir <- "~/../../Corrona LLC/Biostat Data Files - AD"
dsFolderUrl <- glue("{sharepoint_dir}/monthly")


# Example:
# Set up directory for downloading the IBD Registry data from 2021-11-01
# sharepoint_ibd <- "~/../Corrona LLC/Biostat Data Files - Registry Data/IBD/monthly/2021/2021-11-01/Analytic Data"
# or using paste0 function
# sharepoint_ibd <- paste0(sharepoint_dir, "/IBD/monthly/", frz_yr, "/", frz_dt, "/Analytic Data")
# or using glue function from glue package
# sharepoint_ibd <- glue::glue("{sharepoint_dir}/IBD/monthly/{frz_yr}/{frz_dt}/Analytic Data")

# Check if the directory above exists
dir.exists(sharepoint_dir)
dir.exists(dsFolderUrl)

#----------------------
# Source Analysis Code
#----------------------
# Programs should be organized into smaller, separate, modular files
# Use the source() function to run external programs
# Recommended naming convention: use a numeric prefix to indicate the order it should be executed


source("./R/01_pullData/00_pullData.R")
dsToCheck <- pullData(dsFolderUrl,"2023","2023-12-04","exvisit")


testDups = bind_rows(dsToCheck,dsToCheck)

source("./R/02_criticalChecks/00_criticalChecks.R")
criticalCheckOutput <- criticalChecks(dsToCheck)



# Output values
testDups_criticalCheckOutput <- criticalChecks(testDups)
print(testDups_criticalCheckOutput$criticalCheck1)
print(testDups_criticalCheckOutput$criticalCheck4)

print(criticalCheckOutput$criticalCheck1)
print(criticalCheckOutput$criticalCheck1$nDuplicateRows)
print(criticalCheckOutput$criticalCheck1$listOfDuplicateRows)

print(criticalCheckOutput$criticalCheck4)
print(criticalCheckOutput$criticalCheck4$nMissingVariableLabels)
print(criticalCheckOutput$criticalCheck4$listOfVarsWithMissingLabels)

#-------------------------
# Export Analysis Results
#-------------------------

# Send to Markdown - Local output
# rmarkdown::render(
#   input         = "{}.Rmd",        # Your analysis markdown file
#   output_dir    = "./reports",     # Your output directory for markdown file
#   output_file   = "",              # Your output file name
#   output_format = "word_document", # Output format, word, powerpoint, html, pdf, etc
#   envir         = new.env()        # new.env() creates a new environment within the RMarkdown file to improve reproducibility
# )

#----------------------------
# Send Results to Sharepoint
#----------------------------

# You may want to share your analysis results with people outside of Biostats
# You can copy files from your project ./reports folder to Sharepoint

# Copy Local output to Sharepoint
# file.copy(
#   from      = "./reports", # Directory or filename to copy
#   to        = "",           # Destination directory or filename
#   overwrite = TRUE          # Overwrite files with existing names on Sharepoint? If TRUE and a file exists, it will increment the version number
# )
