#' Use a DSB styled discrete color palette for your ggplot2 plots
#'
#' This function creates a DSB compliant color palette
#' @param ... x
#' @return ... z
#' @author Jeppe Vierø
#' @export

dsb_pal_d <- function(palette = "main",
                      primary = "DSB_Red",
                      other = "DSB_DarkBlue",
                      reverse = FALSE) {

  pal <- dsb_palettes_d[[palette]]

  stopifnot(primary %in% names(pal))

  #print(names(pal))

  function(n) {

    if (n > 12) warning("The discrete color palette only has 12 colors.")

    if (n == 2) {

      other <- if (!other %in% names(pal)) {

        other

      } else {

        pal[other]

      }

      color_list <- c(other, pal[primary])

    } else {

      color_list <- pal[1:n]

    }

    color_list <- unname(unlist(color_list))

    if (reverse == FALSE) color_list else rev(color_list)

  }

}
