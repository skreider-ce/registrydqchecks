#' runReasonableMissingnessCheck Run a check to look at reasonable amount of missingness for all variables
#'
#' @param .dsToCheck The dataset to run the checks on
#' @param .codebookVariables The codebook variables needed to run this specific check
#'
#' @return Results of the check
runReasonableMissingnessCheck <- function(.dsToCheck, .codebookVariables){
  
  .nonEssentialVariables <- .codebookVariables |>
    dplyr::filter(is.na(essential) | essential != 1) |>
    dplyr::filter() |>
    dplyr::select(varName, acceptableMissingness, missingnessThresholdMultiplier, skipLogic)
    
    # Initialize the dataframe that will be returned
    .listOfVarMissingness <- data.frame(
      "varName" = character()
      ,"nRows" = integer()
      ,"nMissing" = integer()
      ,"propMissing" = numeric()
      ,"acceptableMissingness" = numeric()
      ,"missingnessThresholdMultiplier" = numeric()
      ,"skipLogic" = character()
    )
    
    # Loop through the given variables and add a row to the dataframe
    for(.var in .nonEssentialVariables$varName){
      
      .currNonessentialVariable <- .nonEssentialVariables |>
        dplyr::filter(varName == .var)
      
      tryCatch({
        if(is.na(.currNonessentialVariable$skipLogic)){
          .nRows <- nrow(.dsToCheck)
          .nMissing <-
            sum(is.na(.dsToCheck[[.var]]))
        } else {
          .subsetDsToCheck <- .dsToCheck |>
            dplyr::filter(eval(parse(text = .currNonessentialVariable$skipLogic)))
          .nRows <- nrow(.subsetDsToCheck)
          .nMissing <-
            sum(is.na(.subsetDsToCheck[[.var]]))
        }
        
        .propMissing = .nMissing / .nRows
        
      }, error = function(e){
        .nRows <- NA
        .nMissing <- NA
        .propMissing <- NA
        
        print(.var)
        print(paste0("Error occurred while evaluating expression: ", .currNonessentialVariable$skipLogic))
      })
      
      # Build the row to add to the dataframe
      .varMissingRow <- data.frame(
        "varName" = .var
        ,"nRows" = .nRows
        ,"nMissing" = .nMissing
        ,"propMissing" = .propMissing
        ,"acceptableMissingness" = .currNonessentialVariable$acceptableMissingness
        ,"missingnessThresholdMultiplier" = .currNonessentialVariable$missingnessThresholdMultiplier
        ,"skipLogic" = .currNonessentialVariable$skipLogic
      )
      
      .listOfVarMissingness <- dplyr::bind_rows(.listOfVarMissingness,.varMissingRow)
    }
    
    # Reorder the listing output to be sorted in descending order by amount of missingness
    .listOfVarMissingness <- .listOfVarMissingness |>
      dplyr::arrange(dplyr::desc(propMissing)) |>
      dplyr::mutate(
        passMissing = ifelse(propMissing <= acceptableMissingness, TRUE, FALSE)
      ) |>
      dplyr::filter(passMissing == FALSE)
    
  .checkOutput <- list(
    "checkId" = "nc2-3"
    ,"checkTitle" = "Item nonresponse for nonessential variables is not extreme"
    ,"checkDescription" = "Confirm that item nonresponse for nonessential variables is below a specified threshold."
    ,"checkShortDescription" = "nonessential item missingness"
    ,"pass" = ifelse(nrow(.listOfVarMissingness) > 0, FALSE, TRUE)
    ,"values" = list(
      "n" = nrow(.listOfVarMissingness)
      ,"N" = 0
      ,"pct" = 0
    )
    ,"listing" = .listOfVarMissingness
  )
  
  return(.checkOutput)
}
