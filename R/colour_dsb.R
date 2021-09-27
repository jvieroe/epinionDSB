#' Use a DSB styled color palette for your ggplot2 plots
#'
#' This function creates a DSB compliant color palette
#' @param ... x
#' @return ... z
#' @author Jeppe Vierø
#' @export

colour_dsb <- function(palette = "two",
                       discrete = TRUE,
                       reverse = FALSE,
                       ...) {

  if (discrete) {

    pal <- dsb_pal(palette = palette, reverse = reverse)

    discrete_scale("colour", paste0("dsb_", palette), palette = pal, ...)

  } else {

    scale_color_gradientn(colours = pal(256), ...)

  }

}
