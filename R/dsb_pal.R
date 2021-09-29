#' Use a DSB styled continuous color palette for your ggplot2 plots
#'
#' This function creates a DSB compliant color palette
#' @param ... x
#' @return ... z
#' @author Jeppe Vierø
#' @export

dsb_pal <- function(palette = "reds",
                    reverse = FALSE,
                    ...) {

  pal <- dsb_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  colorRampPalette(pal, ...)

}
