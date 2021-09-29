#' Use a DSB styled discrete color palette for your ggplot2 plots
#'
#' This function creates a DSB compliant color palette for discrete variables
#' @param ... x
#' @return ... z
#' @author Jeppe Vierø
#' @export

color_dsb_d <- function(palette = "main",
                        primary = "DSB_Red",
                        other = "DSB_DarkBlue",
                        reverse = FALSE,
                        ...) {

  ggplot2::discrete_scale(
    "colour", "branded",
    dsb_pal_d(palette, primary, other, reverse, ...),
    ...

  )

}
