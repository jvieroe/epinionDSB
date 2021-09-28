#' Use a DSB styled color palette for your ggplot2 plots
#'
#' This function creates a DSB compliant color palette for continuous variables
#' @param ... x
#' @return ... z
#' @author Jeppe Vierø
#' @export

color_dsb_c <- function(palette = "reds",
                        reverse = FALSE,
                        ...) {

  pal <- dsb_pal(palette = palette, reverse = reverse)

  scale_color_gradientn(colours = pal(25), ...)

}
