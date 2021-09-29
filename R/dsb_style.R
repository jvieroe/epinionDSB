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
                     axis.text.x = element_text(colour = "#0F283C",
                                                face = "plain",
                                                size = 12),
                     axis.text.y = element_text(colour = "#0F283C",
                                                face = "plain",
                                                size = 12),
                     axis.title.x = element_text(colour = "#0F283C",
                                                 face = "bold",
                                                 size = 14,
                                                 vjust = -2.5,
                                                 hjust = 1),
                     axis.title.y = element_text(colour = "#0F283C",
                                                 face = "bold",
                                                 size = 14,
                                                 vjust = -2.5,
                                                 hjust = 1),
                     strip.text = element_text(colour = "#0F283C",
                                               face = "bold",
                                               size = 12),
                     strip.background = element_rect(color = "#A5A5A5",
                                                     fill = "#A5A5A5"),
                     plot.title = element_text(colour = "#0F283C",
                                               face = "bold",
                                               size = 18),
                     plot.subtitle = element_text(colour = "#0F283C",
                                                  face = "plain",
                                                  size = 16)
                     )

  } else if (legend == TRUE) {

    ggplot2::theme_minimal() +
      ggplot2::theme(
        legend.position = "right",
        axis.text = element_text(colour = "#0F283C",
                                 face = "bold"),
        axis.title.x = element_text(colour = "#0F283C",
                                    face = "bold",
                                    vjust = -1.5),
        strip.text = element_text(colour = "#0F283C",
                                  face = "bold"),
        strip.background = element_rect(color = "#0F283C",
                                        fill = "#E8E1D5"),
        title = element_text(colour = "#0F283C",
                             face = "bold")
        )

  }

}
