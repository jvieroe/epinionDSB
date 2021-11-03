#' Extract colors from the Epinion CVI color palette by their name
#'
#' This function extracts colors (in HEX codes) from the DSB color palette by their name
#' @param ... takes as input the name of the color(s) needed
#' @return the corresponding HEX code
#' @author Jeppe Vierø
#' @export

dsb_colvec <- function(...) {

  cols <- c(...)

  if (is.null(cols))

    return (epinionDSB::dsb_cols)

  epinionDSB::dsb_cols[cols]

}
