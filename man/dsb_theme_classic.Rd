% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dsb_theme_classic.R
\name{dsb_theme_classic}
\alias{dsb_theme_classic}
\title{Apply a DSB styled theme to your \code{ggplot2} graphics}
\usage{
dsb_theme_classic(legend = TRUE, gridlines = "both", textcolor = "DarkBlue")
}
\arguments{
\item{legend}{a logical value indicating whether a legend is included. Defaults to \code{TRUE} (with \code{legend.position} defaulting to \code{"bottom"})}

\item{gridlines}{Include gridlines? Options are \code{"both"}, \code{"none"}, \code{"x"} (for vertical), and \code{"y"} (for horizontal). Default is \code{"both"}}

\item{textcolor}{Color for text elements in \code{theme()} options. Must be either "black" or a named color from the DSB color palette (see \link[epinionDSB]{dsb_colvec}), with or without the \code{"DSB"} prefix. Default is "DarkBlue"}
}
\value{
a CVI compliant plot
}
\description{
This function applies a theme consistent with the DSB Corporate Visual Identity (CVI) to your \code{ggplot2} graphics. Add it to your \code{ggplot2} syntax for conistent visual outputs.
}
\examples{
library(tidyverse)
ggplot(mtcars, aes(x = wt, y = mpg)) +
geom_point() +
dsb_theme_classic()
}
\author{
Jeppe Vierø
}
