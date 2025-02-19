% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/browse_dict.R
\name{browse_dict}
\alias{browse_dict}
\title{Browse dictionary
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#experimental}{\figure{lifecycle-experimental.svg}{options: alt='[Experimental]'}}}{\strong{[Experimental]}}}
\usage{
browse_dict(dict, ...)
}
\arguments{
\item{dict}{database dictionary}

\item{...}{for testing purposes}
}
\value{
a web interface with the data contained in the supplied dictionary
}
\description{
Allows you to browse the dictionary of the surveys in a web interface where
you can check the name and label of the variables, as well as the data labels.
}
\examples{
\dontrun{
dict <- list(
  SEX = list(
    lab = "Sex of the person",
    labs = c("Man" = 1, "Woman" = 2)
  ),
  MARITAL_STATUS = list(
    lab = "Marital status of the person",
    labs = c("Single" = 1, "Married" = 2, "Widower" = 3)
  ),
  HEIGHT = list(
    lab = "Person height",
    labs = c("Short" = 1, "Normal" = 2, "High" = 3)
  )
)
browse_dict(dict)
}
}
