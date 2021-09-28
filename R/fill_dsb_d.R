#' Use a DSB styled color palette for your ggplot2 plots
#'
#' This function creates a DSB compliant color palette for discrete variables
#' @param ... x
#' @return ... z
#' @author Jeppe Vierø
#' @export

fill_dsb_d <- function(palette = "three",
                       reverse = FALSE,
                       ...) {

  pal <- dsb_pal(palette = palette, reverse = reverse)

  discrete_scale("fill", paste0("dsb_", palette), palette = pal, ...)

}
