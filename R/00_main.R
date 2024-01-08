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


#-----------------
# Set Directories
#-----------------
# Use relative paths to point to relevant directories

# Registry data should be imported directly from its source: either Sharepoint (currently as of 2021) or AWS (future)
sharepoint_dir <- "~/../../Corrona LLC/Biostat Data Files - AD"
dsFolderUrl <- glue("{sharepoint_dir}/monthly")

# Check if the directory above exists
dir.exists(sharepoint_dir)
dir.exists(dsFolderUrl)

#----------------------
# Source Analysis Code
#----------------------

# Step 1: Pull the data - store in [dataframe] dsToCheck
source("./R/01_pullData/00_pullData.R")


  # Currently - requires the user to specifically give the URL to the file since I don't know
  #     if there is a consistent structure

  # URL directly to current month's data
  exvisit_datasetUrl <- glue("{dsFolderUrl}/2023/2023-12-04/exvisit_2023-12-04.rds")
  exlab_datasetUrl <- glue("{dsFolderUrl}/2023/2023-12-04/exlab_2023-12-04.rds")
  exdrugexp_datasetUrl <- glue("{dsFolderUrl}/2023/2023-12-04/exdrugexp_2023-12-04.rds")
  
  # Pull current month's data
  exvisit_dsToCheck <- pullData(exvisit_datasetUrl,TRUE)
  exlab_dsToCheck <- pullData(exlab_datasetUrl,TRUE)
  exdrugexp_dsToCheck <- pullData(exdrugexp_datasetUrl,TRUE)
  
  
  # URL directly to last month's data
  comp_exvisit_datasetUrl <- glue("{dsFolderUrl}/2023/2023-11-03/exvisit_2023-11-03.rds")
  comp_exlab_datasetUrl <- glue("{dsFolderUrl}/2023/2023-11-03/exlab_2023-11-03.rds")
  comp_exdrugexp_datasetUrl <- glue("{dsFolderUrl}/2023/2023-11-03/exdrugexp_2023-11-03.rds")
  
  # Pull last month's data
  comp_exvisit_dsToCheck <- pullData(comp_exvisit_datasetUrl,TRUE)
  comp_exlab_dsToCheck <- pullData(comp_exlab_datasetUrl,TRUE)
  comp_exdrugexp_dsToCheck <- pullData(comp_exdrugexp_datasetUrl,TRUE)
  
  
  

  

  
# Step 2: Run the critical checks - store output in [list] criticalCheckOutput
source("./R/02_criticalChecks/00_criticalChecks.R")
  
  
  # Currently - requires the user to specifically give the variables that define the
  #     unique keys as they vary from dataset to dataset

  exvisit_criticalCheckOutput <- criticalChecks(
    exvisit_dsToCheck
    ,comp_exvisit_dsToCheck
    ,c("id","drink_freq")
    ,c("id","drink_freq", "abcd", "xyz")
    ,id,visitdate)
  
  exlab_criticalCheckOutput <- criticalChecks(
    exlab_dsToCheck
    ,comp_exlab_dsToCheck
    ,c("id","labdate")
    ,c("id","labdate", "lmno", "pqrs", "mnyo")
    ,id,labdatet,edcvisitnum)
  
  exdrugexp_criticalCheckOutput <- criticalChecks(
    exdrugexp_dsToCheck
    ,comp_exdrugexp_dsToCheck
    ,c("id","stdosevalue")
    ,c("id","stdosevalue", "bbcy")
    ,id,expid)
  
  
  # Step 2.5: Run the non-critical checks - store output in [list] nonCriticalCheckOutput
  
  
  
  # Step 3: Create the data check report
  












#------------------------
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
