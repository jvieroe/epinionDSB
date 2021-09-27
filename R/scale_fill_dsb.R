#' Use a DSB styled color palette for your ggplot2 plots
#'
#' This function creates a DSB compliant color palette
#' @param ... x
#' @return ... z
#' @author Jeppe Vierø
#' @export

scale_fill_dsb <- function(palette = "main",
                           discrete = TRUE,
                           reverse = FALSE,
                           ...) {

  pal <- dsb_pal(palette = palette, reverse = reverse)

  if (discrete) {

    discrete_scale("fill", paste0("dsb_", palette), palette = pal, ...)

    } else {

      scale_fill_gradientn(colours = pal(256), ...)

    }

}
