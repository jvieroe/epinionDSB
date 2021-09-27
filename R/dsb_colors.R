#' Use a DSB styled color palette for your ggplot2 graphics
#'
#' This function extract DSB compliant colors (in HEX codes) by their name
#' @param ... takes as input the name of the color(s) needed
#' @return the corresponding HEX code
#' @author Jeppe Vierø
#' @export

dsb_colvec <- function(...) {

  cols <- c(...)

  if (is.null(cols))

    return (dsb_cols)

  dsb_cols[cols]

}
