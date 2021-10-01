#' Add a DSB style to your graph
#'
#' This function adds a DSB compliant theme to ggplot figures. It can be added at the end of your ggplot syntax.
#' @param legend a logical value indicating whether a legend is included. Defaults to TRUE.
#' @return A CVI compliant plot
#' @author Jeppe Vierø
#' @export

dsb_style <- function(legend = TRUE) {

  if (legend == FALSE) {

    ggplot2::theme_minimal() +
      ggplot2::theme(legend.position = "none",
                     axis.text.x = element_text(colour = getElement(dsb_colvec(), "DSB_DarkBlue"),
                                                face = "plain",
                                                size = 12),
                     axis.text.y = element_text(colour = getElement(dsb_colvec(), "DSB_DarkBlue"),
                                                face = "plain",
                                                size = 12),
                     axis.title.x = element_text(colour = getElement(dsb_colvec(), "DSB_DarkBlue"),
                                                 face = "bold",
                                                 size = 14,
                                                 #vjust = -2.5,
                                                 hjust = 1,
                                                 margin = ggplot2::margin(t = 20, r = 0, b = 0, l = 0)),
                     axis.title.y = element_text(colour = getElement(dsb_colvec(), "DSB_DarkBlue"),
                                                 face = "bold",
                                                 size = 14,
                                                 #vjust = 2.5,
                                                 hjust = 1,
                                                 margin = ggplot2::margin(t = 0, r = 20, b = 0, l = 0)),
                     strip.text = element_text(colour = getElement(dsb_colvec(), "DSB_DarkBlue"),
                                               face = "plain",
                                               size = 12),
                     strip.background = element_rect(color = getElement(dsb_colvec(), "DSB_LightGrey"),
                                                     fill = scales::alpha(getElement(dsb_colvec(), "DSB_LightGrey"), 0.4)),
                     plot.title = element_text(colour = getElement(dsb_colvec(), "DSB_DarkBlue"),
                                               face = "bold",
                                               size = 18),
                     plot.subtitle = element_text(colour = getElement(dsb_colvec(), "DSB_DarkBlue"),
                                                  face = "plain",
                                                  size = 16)
      )

  } else if (legend == TRUE) {

    ggplot2::theme_minimal() +
      ggplot2::theme(
        legend.position = "right",
        axis.text.x = element_text(colour = getElement(dsb_colvec(), "DSB_DarkBlue"),
                                   face = "plain",
                                   size = 12),
        axis.text.y = element_text(colour = getElement(dsb_colvec(), "DSB_DarkBlue"),
                                   face = "plain",
                                   size = 12),
        axis.title.x = element_text(colour = getElement(dsb_colvec(), "DSB_DarkBlue"),
                                    face = "bold",
                                    size = 14,
                                    #vjust = -2.5,
                                    hjust = 1,
                                    margin = ggplot2::margin(t = 20, r = 0, b = 0, l = 0)),
        axis.title.y = element_text(colour = getElement(dsb_colvec(), "DSB_DarkBlue"),
                                    face = "bold",
                                    size = 14,
                                    #vjust = 2.5,
                                    hjust = 1,
                                    margin = ggplot2::margin(t = 0, r = 20, b = 0, l = 0)),
        strip.text = element_text(colour = getElement(dsb_colvec(), "DSB_DarkBlue"),
                                  face = "plain",
                                  size = 12),
        strip.background = element_rect(color = getElement(dsb_colvec(), "DSB_LightGrey"),
                                        fill = scales::alpha(getElement(dsb_colvec(), "DSB_LightGrey"), 0.4)),
        plot.title = element_text(colour = getElement(dsb_colvec(), "DSB_DarkBlue"),
                                  face = "bold",
                                  size = 18),
        plot.subtitle = element_text(colour = getElement(dsb_colvec(), "DSB_DarkBlue"),
                                     face = "plain",
                                     size = 16)
      )

  }


}
