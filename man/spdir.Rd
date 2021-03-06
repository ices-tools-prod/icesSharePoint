% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/files_and_folders.R
\name{spfolders}
\alias{spfolders}
\alias{spfiles}
\alias{spdir}
\title{Files and Folders}
\usage{
spfolders(directory = "", site, site_collection, full = FALSE)

spfiles(directory = "", site, site_collection, full = FALSE)

spdir(directory = "", site, site_collection, recursive = FALSE, full = FALSE)
}
\arguments{
\item{directory}{a directory name.}

\item{site}{a SharePoint site name, e.g. '/ExpertGroups/WGNSSK'.}

\item{site_collection}{a SharePoint site collection, will almost exclusively
be 'https://community.ices.dk', so these functions should work for other
SharePoint sites outside ICES.}

\item{full}{a logical value. If TRUE, the directory path is prepended
to the file names to give a relative file path. If FALSE,
the file names (rather than paths) are returned.}

\item{recursive}{logical. Should the listing recurse into directories?}
}
\value{
A character vector containing the names of the files in the specified directories,
or "" if there were no files. If a path does not exist or is not a directory or is
unreadable it is skipped, with a warning..
}
\description{
List the files and folders in a SharePoint directory.
}
\examples{
\dontrun{
spfolders()
spfiles()
spdir()

spdir(site = "/ExpertGroups/WGNSSK")
}

}
\seealso{
\code{\link{setspwd}, \link{getspwd}} set and get SharePoint working directory.

\code{\link{setspsite}, \link{getspsite}} set and get SharePoint default site.
}
