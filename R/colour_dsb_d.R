#' Use a DSB styled color palette for your ggplot2 plots
#'
#' This function creates a DSB compliant color palette for discrete variables
#' @param ... x
#' @return ... z
#' @author Jeppe Vierø
#' @export

# colour_dsb_d <- function(palette = "main",
#                          reverse = FALSE,
#                          ...) {
#
#   pal <- dsb_palettes[[palette]]
#
#   if (reverse) pal <- rev(pal)
#
#   scale_color_manual(values = pal)
#
# }


colour_dsb_d <- function(...,
                         values,
                         aesthetics = "colour",
                         breaks = waiver(),
                         na.value = "grey50") {

  manual_scale(aesthetics, values, breaks, ..., na.value = na.value)

  }


