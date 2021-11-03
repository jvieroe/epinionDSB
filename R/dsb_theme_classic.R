#' Apply an Epinion styled theme to your `ggplot2` graphics
#'
#' This function applies a theme consistent with the DSB Corporate Visual Identity (CVI) to your `ggplot2` graphics. Add it to your `ggplot2` syntax for conistent visual outputs.
#' @param legend a logical value indicating whether a legend is included. Defaults to `TRUE` (with `legend.position` defaulting to `"bottom"`)
#' @param gridlines Include gridlines? Options are `"both"`, `"none"`, `"x"` (for vertical), and `"y"` (for horizontal). Default is `"both"`
#' @param textcolor Color for text elements in `theme()` options. Must be either "black" or a named color from the DSB color palette (see \link[epinionDSB]{dsb_colvec}), include only the color name, not the `"Epinion"` prefix. Default is "black"
#' @return a CVI compliant plot
#' @examples
#' library(tidyverse)
#' ggplot(mtcars, aes(x = wt, y = mpg)) +
#' geom_point() +
#' dsbtheme_classic()
#' @author Jeppe Vierø
#' @import ggplot2 scales
#' @export

dsb_theme_classic <- function(legend = TRUE,
                              gridlines = "none",
                              textcolor = "DarkBlue") {

  check_theme(legend = legend,
              gridlines = gridlines,
              textcolor = textcolor)

  if (textcolor == "black") {

    theme_textcolor <- "black"

  } else if (textcolor != "black") {

    theme_textcolor <- getElement(epinionDSB::dsb_colvec(), paste0("DSB ",
                                                                   textcolor))

  }

  p <-
    ggplot2::theme_classic() +
    ggplot2::theme(axis.text.x = element_text(colour = theme_textcolor,
                                              face = "plain",
                                              size = 12),
                   axis.text.y = element_text(colour = theme_textcolor,
                                              face = "plain",
                                              size = 12),
                   axis.title.x = element_text(colour = theme_textcolor,
                                               face = "bold",
                                               size = 12,
                                               #vjust = -2.5,
                                               hjust = 1,
                                               margin = ggplot2::margin(t = 20, r = 0, b = 0, l = 0)),
                   axis.title.y = element_text(colour = theme_textcolor,
                                               face = "bold",
                                               size = 12,
                                               #vjust = 2.5,
                                               hjust = 1,
                                               margin = ggplot2::margin(t = 0, r = 20, b = 0, l = 0)),
                   strip.text = element_text(colour = theme_textcolor,
                                             face = "plain",
                                             size = 12),
                   strip.background = element_rect(color = getElement(epinionDSB::dsb_colvec(), "DSB LightGrey"),
                                                   fill = scales::alpha(getElement(epinionDSB::dsb_colvec(), "DSB LightGrey"), 0.4)),
                   plot.title = element_text(colour = theme_textcolor,
                                             face = "bold",
                                             size = 18),
                   plot.subtitle = element_text(colour = theme_textcolor,
                                                face = "plain",
                                                size = 16)
    )


  if (legend == TRUE) {

    pp <- p +
      ggplot2::theme(legend.position = "bottom")

  } else if (legend == FALSE) {

    pp <- p +
      ggplot2::theme(legend.position = "none")

  }


  if (gridlines == "both") {

    ppp <- pp +
      ggplot2::theme(panel.grid.major.x = element_line(),
                     panel.grid.minor.x = element_line(),
                     panel.grid.major.y = element_line(),
                     panel.grid.minor.y = element_line())

  } else if (gridlines == "x") {

    ppp <- pp +
      ggplot2::theme(panel.grid.major.x = element_line(),
                     panel.grid.minor.x = element_line(),
                     panel.grid.major.y = element_blank(),
                     panel.grid.minor.y = element_blank())

  } else if (gridlines == "y") {

    ppp <- pp +
      ggplot2::theme(panel.grid.major.x = element_blank(),
                     panel.grid.minor.x = element_blank(),
                     panel.grid.major.y = element_line(),
                     panel.grid.minor.y = element_line())

  } else if (gridlines == "none") {

    ppp <- pp +
      ggplot2::theme(panel.grid.major.x = element_blank(),
                     panel.grid.minor.x = element_blank(),
                     panel.grid.major.y = element_blank(),
                     panel.grid.minor.y = element_blank())

  }

  return(ppp)

}
