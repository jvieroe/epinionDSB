#' Use an Epinion styled color palette for your ggplot2 graphics
#'
#' This function extract Epinion compliant colors (in HEX codes) by their name
#' @param ... takes as input the name of the color(s) needed
#' @return the corresponding HEX code
#' @author Jeppe Vierø
#' @export

epi_colvec <- function(...) {

  cols <- c(...)

  if (is.null(cols))

    return (epi_cols)

  epi_cols[cols]

}
