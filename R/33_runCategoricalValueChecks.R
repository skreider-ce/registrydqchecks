#' runCategoricalValueChecks Run a check to ensure categorical variables have the appropriate values
#'
#' @return Results of the check
runCategoricalValueChecks <- function(.dsName
                                      ,.dsToCheck
                                      ,.codebookVariables
                                      ,.uniqueKeys){

  .varsToCheck <- .codebookVariables |>
    dplyr::filter(!is.na(catValues)) |>
    dplyr::select(varName, catValues) |>
    dplyr::mutate(split = strsplit(catValues, ",")) |>
    dplyr::mutate(cleanCol = purrr::map(split, removeQuotes)) |>
    dplyr::mutate(
      numValues = purrr::map(cleanCol, extractValueNumbers)
      ,catValues = purrr::map(cleanCol, extractValueLabels)
    )

  
  .categoricalValueChecks <- data.frame()
  
  for(.varName1 in .varsToCheck$varName){
    .currentCheckVar <- .varsToCheck |>
      dplyr::filter(varName == {{.varName1}})
    
    .dsToCheckLevels <- as.numeric(names(table(.dsToCheck[[.varName1]])))
    .expectedLevels <- unlist(.varsToCheck[.varsToCheck$varName == glue::glue("{.varName1}"),]$numValues)
    .expectedLabels <- unlist(.varsToCheck[.varsToCheck$varName == glue::glue("{.varName1}"),]$cleanCol)
    
    notIn <- .dsToCheckLevels[!.dsToCheckLevels %in% .expectedLevels]

    .outOfRange <- .dsToCheck |>
      dplyr::select(all_of(.uniqueKeys), !!.varName1) |>
      dplyr::filter(!is.na(get(.varName1))) |>
      dplyr::filter(get(.varName1) %in% notIn) |>
      dplyr::mutate(
        dataset = .dsName
        ,numVal = as.character(get(.varName1))
        ,variableName = glue::glue("{.varName1}")
        ,expectedValue = list(.expectedLevels)
        ,expectedLabels = list(.expectedLabels)
      ) |>
      dplyr::rename(
        catValue = numVal
      )
    
    .categoricalValueChecks <- dplyr::bind_rows(.categoricalValueChecks, .outOfRange)
  }

  return(.categoricalValueChecks)
}



#' removeQuotes A function to remove quotes from each element in a character string
#'
#' @param vec A vector to remove quotes from
removeQuotes <- function(vec){
  stringr::str_replace_all(vec, '"', '')
}

#' extractValueNumbers Extract the numbers before the equal sign in each element in a vector
#'
#' @param vec A vector to extract numbers from
#'
#' @return A vector of numbers of the levels of the variable
extractValueNumbers <- function(vec){
  numVector <- stringr::str_extract(vec, "\\b\\d+\\b") |> as.double()

  return(unlist(numVector))
}



#' extractValueLabels Extract the values after the equal sign in each element in a vector
#'
#' @param vec A vector to extract labels from
#'
#' @return A vector of the labels of the levels of the variable
extractValueLabels <- function(vec){
  charVector <- stringr::str_extract(vec, "(?<=\\=\\s{0,1000}).*$")
  
  return(unlist(charVector))
}


