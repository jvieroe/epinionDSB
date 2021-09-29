#' Use an Epinion styled discrete color palette for your ggplot2 plots
#'
#' This function creates a DSB compliant color palette for discrete variables
#' @param ... x
#' @return ... z
#' @author Jeppe Vierø
#' @export

colour_epi_d <- function(palette = "epinion",
                         primary = "Epi_DarkBlue",
                         other = "Epi_WarmSand",
                         reverse = FALSE,
                         ...) {

  ggplot2::discrete_scale(
    "colour", "branded",
    epi_pal_d(palette, primary, other, reverse),
    ...

  )

}
