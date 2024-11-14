#' perpetuateExcelComments A function to read in the CDM/ROM report from last month and pull comments and place them in the new report
#'
#' @param .lastMonthCheckExcelFileUrl A direct URL to the Excel file from last month
#' @param .thisMonthCheckExcelFileUrl A direct URL to the Excel file from this month
#' 
#' @importFrom glue glue
#' @importFrom readxl read_xlsx
#' @importFrom openxlsx loadWorkbook writeData saveWorkbook
#' @importFrom dplyr slice select filter distinct bind_cols starts_with
#' @importFrom janitor row_to_names clean_names

perpetuateExcelComments <- function(.lastMonthCheckExcelFileUrl
                                    ,.thisMonthCheckExcelFileUrl
                                    ){
    # Read in Excel file with the checks
    lastMonthAllChecksExcel <- readxl::read_xlsx(glue::glue("{.lastMonthCheckExcelFileUrl}"))
    thisMonthAllChecksExcel <- readxl::read_xlsx(glue::glue("{.thisMonthCheckExcelFileUrl}"))
    
    # Identify unique check identifiers
    lastMonthDsToWorkWith <- lastMonthAllChecksExcel |>
      dplyr::filter(substr(`...7`,1,2) %in% c("nc", "rc")) |>
      dplyr::select(`...7`) |>
      dplyr::distinct()
    
    thisMonthDsToWorkWith <- thisMonthAllChecksExcel |>
      dplyr::filter(substr(`...7`,1,2) %in% c("nc", "rc")) |>
      dplyr::select(`...7`) |>
      dplyr::distinct()
    
    
    lastMonthFullDs = list()
    thisMonthFullDs = list()
    finalDs = list()
    # Loop through check identifiers
    ### Extract check datasets
    ### Extract investigation items
    ### Create combined dataset with check data and investigation items
    for(check in lastMonthDsToWorkWith$`...7`){
      if(check %in% thisMonthDsToWorkWith$`...7`){
        
        print(check)
        thisMonthCheckLocMin <- min(which(thisMonthAllChecksExcel$`...7` == check))
        thisMonthCheckLocMax<- max(which(thisMonthAllChecksExcel$`...7` == check))
        thisMonthCheckLocHeader <- thisMonthCheckLocMin - 1
        
        thisMonthCheckDs <- thisMonthAllChecksExcel |>
          dplyr::slice(thisMonthCheckLocHeader:thisMonthCheckLocMax) |>
          dplyr::select(starts_with("...")) |>
          dplyr::select(-`...6`) |>
          janitor::row_to_names(row_number = 1) |>
          janitor::clean_names() |>
          dplyr::select(-dplyr::starts_with("na"))
        
        
        lastMonthCheckLocMin <- min(which(lastMonthAllChecksExcel$`...7` == check))
        lastMonthCheckLocMax<- max(which(lastMonthAllChecksExcel$`...7` == check))
        lastMonthCheckLocHeader <- lastMonthCheckLocMin - 1
        
        lastMonthInvestigatorDs <- lastMonthAllChecksExcel |>
          dplyr::slice((lastMonthCheckLocHeader+1):lastMonthCheckLocMax) |>
          dplyr::select("Investigator",	"Date Investigated",	"Resolution",	"Date Resolved",	"Notes") |>
          dplyr::mutate(
            `Investigator` = as.character(`Investigator`)
            ,`Date Investigated` = as.character(`Date Investigated`)
            ,`Resolution` = as.character(`Resolution`)
            ,`Date Resolved` = as.character(`Date Resolved`)
            ,`Notes` = as.character(`Notes`)
          )
        
        lastMonthCheckDs <- lastMonthAllChecksExcel |>
          dplyr::slice(lastMonthCheckLocHeader:lastMonthCheckLocMax) |>
          dplyr::select(starts_with("...")) |>
          dplyr::select(-`...6`) |>
          janitor::row_to_names(row_number = 1) |>
          janitor::clean_names() |>
          dplyr::select(-dplyr::starts_with("na"))
        
        joinVars <- intersect(names(thisMonthCheckDs), names(lastMonthCheckDs))
        
        lastMonthFullDs[[check]] <- dplyr::bind_cols(lastMonthCheckDs, lastMonthInvestigatorDs)
        
        thisMonthFullDs[[check]] <- dplyr::bind_cols(thisMonthCheckDs)
        
        if (length(joinVars) > 0) {
          finalDs[[check]] <- dplyr::left_join(
            thisMonthFullDs[[check]]
            ,lastMonthFullDs[[check]]
            ,by = joinVars
          )
          
          toPrint <- finalDs[[check]][c("Investigator", "Date Investigated", "Resolution", "Date Resolved", "Notes")]
          
          
          wb = openxlsx::loadWorkbook(glue::glue("{.thisMonthCheckExcelFileUrl}"))
          
          openxlsx::writeData(wb, sheet = "qualityChecks", x = toPrint, startCol = 1, startRow = thisMonthCheckLocMin + 1, colNames = FALSE)
          
          openxlsx::saveWorkbook(wb, glue::glue("{.thisMonthCheckExcelFileUrl}"), overwrite = TRUE)
        } else {
          print("No common variables to join on.")
        }

      }
    }
}

