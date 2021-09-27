#' Use a DSB styled color palette for your ggplot2 graphics
#'
#' This function adds a DSB compliant theme to ggplot figures. It can be added at the end of your ggplot syntax.
#' @param legend a logical value indicating whether a legend is included. Defaults to TRUE.
#' @return A CVI compliant plot
#' @author Jeppe Vierø
#' @export

drsimonj_cols <- function(...) {

  cols <- c(...)

  if (is.null(cols))

    return (drsimonj_colors)

  drsimonj_colors[cols]

}



