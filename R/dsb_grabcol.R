#' Extract colors (HEX) from the DSB color palette by their name
#'
#' This function extracts colors (in HEX codes) from the DSB color palette by their official name
#' @param color a DSB color (see `names(epinionDSB::dsb_cols)`) with or without Epinion prefix
#' @return the corresponding HEX code
#' @author Jeppe Vierø
#' @export

dsb_grabcol <- function(color) {

  if(base::grepl("DSB ", color) == TRUE) {

    color <- color

  } else if (base::grepl("DSB ", color) == FALSE) {

    color <- paste0("DSB ", color)

  }

  check_color_grab(color = color)

  hex <- base::getElement(epinionDSB::dsb_colvec(), color)

  return(hex)

}
