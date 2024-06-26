#' updatePackages Update rdc packages to the most recent version
#'
#' @param snapshot Boolean (default = TRUE) to automatically run renv::snapshot
#'
#' @export
updatePackages <- function(snapshot = TRUE){
  remotes::install_github("skreider-ce/registrydqchecksreportdown", dependencies = TRUE) # Most up to date static package release
  remotes::install_github("skreider-ce/registrydqchecks", dependencies = TRUE) # Most up to date static package release
  
  if(snapshot){
    renv::snapshot()
  }
}