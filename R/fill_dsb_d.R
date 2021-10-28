#' Apply a discrete color scale to your `ggplot2` graphics
#'
#' This function applies a discrete color scale using colors from the DSB color palette
#' @param palette a continuous color palette. Default is "main"
#' @param reverse a logical value indicating whether to reverse the color scale. Defaults to `FALSE`
#' @param primary a name of a valid DSB color (see \link[epinionDSB]{dsb_colvec}) to be applied to the primary category. Invalid with more than three levels
#' @param secondary a name of a valid DSB color (see \link[epinionDSB]{dsb_colvec}) to be applied to the primary category. Invalid with more than three levels
#' @examples
#' library(tidyverse)
#' ggplot(mtcars, aes(x = wt, y = mpg, fill = factor(am))) +
#' geom_point(shape = 21, color = "NA") +
#' fill_dsb_d()
#' @author Jeppe Vierø
#' @export

color_dsb_d <- function(palette = "main",
                        primary = NULL,
                        secondary = NULL,
                        reverse = FALSE,
                        ...) {

  ggplot2::discrete_scale(
    "fill", "branded",
    dsb_pal_d(palette, primary, secondary, reverse),
    ...

  )

}

