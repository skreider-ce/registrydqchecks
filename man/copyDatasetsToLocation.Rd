% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/14_copyDatasetsToLocation.R
\name{copyDatasetsToLocation}
\alias{copyDatasetsToLocation}
\title{copyDatasetsToLocation A function to copy the preliminary analytic datasets to a final output location with an option to remove the files from the original location}
\usage{
copyDatasetsToLocation(
  .datasetsToCopy,
  .prelimDataFolderUrl,
  .prelimDataPullDate,
  .folderToCopyTo,
  .isR,
  .remove = FALSE
)
}
\arguments{
\item{.datasetsToCopy}{A character list of the dataset prefixes to copy from the original location to the final location}

\item{.prelimDataFolderUrl}{A text URL to the location of the datasets to be copied over}

\item{.prelimDataPullDate}{The datapull date of the preliminary files to be copied - the date in the dataset name}

\item{.folderToCopyTo}{Url of the folder to copy the datasets to}

\item{.isR}{Boolean indicating if the dataset being copied is an R file (if TRUE then dataset is R, if FALSE then dataset is .dta)}

\item{.remove}{(default = FALSE) an indicator whether to remove the files in the original location}
}
\description{
copyDatasetsToLocation A function to copy the preliminary analytic datasets to a final output location with an option to remove the files from the original location
}
