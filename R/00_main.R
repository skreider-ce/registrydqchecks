rm(list = ls())
#-----------------------------------------------------------
# Program: 00_main.R
# Author:  Scott Kreider
# Date:    2021-10-19
# Purpose: Main File for running registry data checks
#-----------------------------------------------------------

#----------------
# Load Libraries
#----------------
library(tidyverse, warn.conflicts = FALSE) # Recommended packages for data manipulation
library(arsenal)                           # Recommended package for creating tables
library(tidycoRe)                          # Internal package for CorEvitas helper functions, styles, templates
library(lubridate)                         # Recommended package for manipulating dates
library(glue)                              # Recommended package for concatenating strings

#------------------
# Session Info Log
#------------------
writeLines(capture.output(sessionInfo()), "sessionInfo.txt")



#----------------------
# Source Analysis Code
#----------------------


# source("./R/00_mainFunctions/00_mainFunctions.R")
source("./R/adAll2023Checks.R")
source("./R/msAll2023Checks.R")
source("./R/psoAll2023Checks.R")


runAllAd2023()
runAllMs2023()
runAllPso2023()

# adChecks <- runRegistryChecks(.registry = "ad"
#                             ,.dsYear = "2023"
#                             ,.dsFolderDate = "2023-12-04"
#                             ,.dsPullDate = "2023-12-04"
#                             ,.compDsYear = "2023"
#                             ,.compDsFolderDate = "2023-11-03"
#                             ,.compDsPullDate = "2023-11-03"
#                             ,.isR = TRUE)
# 
adChecks01 <- runRegistryChecks(.registry = "ad"
                            ,.dsYear = "2024"
                            ,.dsFolderDate = "2024-01-04"
                            ,.dsPullDate = "2024-01-04"
                            ,.compDsYear = "2023"
                            ,.compDsFolderDate = "2023-12-04"
                            ,.compDsPullDate = "2023-12-04"
                            ,.isR = TRUE)


# msChecks <- runRegistryChecks(.registry = "ms"
#                             ,.dsYear = "2023"
#                             ,.dsFolderDate = "2023-12-05"
#                             ,.dsPullDate = "2023-12-05"
#                             ,.compDsYear = "2023"
#                             ,.compDsFolderDate = "2023-11-05"
#                             ,.compDsPullDate = "2023-11-05"
#                             ,.isR = FALSE)
# 
msChecks01 <- runRegistryChecks(.registry = "ms"
                            ,.dsYear = "2024"
                            ,.dsFolderDate = "2024-01-05"
                            ,.dsPullDate = "2024-01-05"
                            ,.compDsYear = "2023"
                            ,.compDsFolderDate = "2023-12-05"
                            ,.compDsPullDate = "2023-12-05"
                            ,.isR = FALSE)

# 
# 
# psoChecks <- runRegistryChecks(.registry = "pso"
#                               ,.dsYear = "2023"
#                               ,.dsFolderDate = "2023-12-10"
#                               ,.dsPullDate = "2023-12-11"
#                               ,.compDsYear = "2023"
#                               ,.compDsFolderDate = "2023-11-10"
#                               ,.compDsPullDate = "2023-11-13"
#                               ,.isR = FALSE)
# 
psoChecks01 <- runRegistryChecks(.registry = "pso"
                              ,.dsYear = "2024"
                              ,.dsFolderDate = "2024-01-10"
                              ,.dsPullDate = "2024-01-10"
                              ,.compDsYear = "2023"
                              ,.compDsFolderDate = "2023-12-10"
                              ,.compDsPullDate = "2023-12-11"
                              ,.isR = FALSE)



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
