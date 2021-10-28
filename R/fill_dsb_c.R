#' Apply a continuous color scale to your `ggplot2` graphics
#'
#' This function applies a continuous color scale using colors from the DSB color palette
#' @param palette a continuous color palette. Default is "reds"
#' @param reverse A logical value indicating whether to reverse the color scale. Defaults to `FALSE`
#' @examples
#' library(tidyverse)
#' ggplot(mtcars, aes(x = wt, y = mpg, fill = disp)) +
#' geom_point(shape = 21, color = "NA") +
#' fill_dsb_c()
#' @author Jeppe Vierø
#' @export

fill_dsb_c <- function(palette = "reds",
                       reverse = FALSE,
                       ...) {

  check_col_c(palette = palette,
              reverse = reverse)

  pal <- dsb_pal_c(palette = palette, reverse = reverse)

  scale_fill_gradientn(colours = pal(256), ...)


}
