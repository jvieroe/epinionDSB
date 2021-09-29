#' Use an Epinion styled continuous color palette for your ggplot2 plots
#'
#' This function creates a DSB compliant color palette
#' @param ... x
#' @return ... z
#' @author Jeppe Vierø
#' @export

epi_pal <- function(palette = "epiblue",
                    reverse = FALSE,
                    ...) {

  pal <- dsb_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  colorRampPalette(pal, ...)

}
