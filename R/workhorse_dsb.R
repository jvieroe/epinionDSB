
#' @import grDevices
#' @noRd
dsb_pal_c <- function(palette = "reds",
                      reverse = FALSE,
                      ...) {

  pal <- epinionDSB::dsbpal_c[[palette]]

  if (reverse) pal <- rev(pal)

  grDevices::colorRampPalette(pal, ...)

}


#' @noRd
check_theme <- function(legend,
                        gridlines,
                        textcolor) {

  if(!legend %in% c(TRUE, FALSE)) {
    stop("Invalid 'legend' argument provided. Must be logical")
  }

  if(!gridlines %in% c("both", "none", "x", "y")) {
    stop("Invalid 'gridlines' argument provided. Must be either 'both', 'none', 'x', or 'y'")
  }

  if(!textcolor %in% c(names(epinionDSB::dsb_cols), "black")) {
    stop("Invalid 'textcolor' argument provided. Must be either 'black' or one of names(epinionDSB::dsb_cols) (with or without DSB prefix)")
  }

}

#' @noRd
check_theme_map <- function(legend,
                            textcolor) {

  if(!legend %in% c(TRUE, FALSE)) {
    stop("Invalid 'legend' argument provided. Must be logical")
  }

  if(!textcolor %in% c(names(epinionDSB::dsb_cols), "black")) {
    stop("Invalid 'textcolor' argument provided. Must be either 'black' or one of names(epinionDSB::dsb_cols) (with or without DSB prefix)")
  }

}


check_theme_dust <- function(legend,
                             gridlines,
                             textcolor,
                             background) {

  if(!legend %in% c(TRUE, FALSE)) {
    stop("Invalid 'legend' argument provided. Must be logical")
  }

  if(!gridlines %in% c("both", "none", "x", "y")) {
    stop("Invalid 'gridlines' argument provided. Must be either 'both', 'none', 'x', or 'y'")
  }

  if(!textcolor %in% c(names(epinionDSB::dsb_cols), "black")) {
    stop("Invalid 'textcolor' argument provided. Must be either 'black' or one of names(epinionDSB::dsb_cols) (with or without DSB prefix)")
  }

  if(!background %in% c(TRUE, FALSE)) {
    stop("Invalid 'background' argument provided. Must be TRUE or FALSE")
  }

}


#' @noRd
check_col_d <- function(primary,
                        secondary,
                        reverse) {

  if(!reverse %in% c(TRUE, FALSE)) {
    stop("Invalid 'reverse' argument provided. Must be logical")
  }

  if(!is.null(primary) && !primary %in% names(epinionDSB::dsb_cols)) {
    stop("Provided 'primary' color is not in the DSB color palette. Must be one of names(epinionDSB::dsb_cols) (with or without DSB prefix)")
  }

  if(!is.null(secondary) && !secondary %in% names(epinionDSB::dsb_cols)) {
    stop("Provided 'secondary' color is not in the DSB color palette. Must be one of names(epinionDSB::dsb_cols) (with or without DSB prefix)")
  }

}

#' @noRd
dsb_pal_d <- function(palette = "main",
                      primary = NULL,
                      secondary = NULL,
                      reverse = FALSE) {

  if (!is.null(primary)) {

    if (base::grepl("DSB ", primary) == TRUE) {

      primary <- primary

    } else if (base::grepl("DSB ", primary) == FALSE) {

      primary <- base::paste0("DSB ", primary)

    }

  }

  if (!is.null(secondary)) {

    if (base::grepl("DSB ", secondary) == TRUE) {

      secondary <- secondary

    } else if (base::grepl("DSB ", secondary) == FALSE) {

      secondary <- base::paste0("DSB ", secondary)

    }

  }


  check_col_d(primary = primary,
              secondary = secondary,
              reverse = reverse)

  pal <- epinionDSB::dsbpal_d[[palette]]

  #stopifnot(primary %in% names(pal))

  #print(names(pal))

  function(n) {

    if (n > 12) warning("The discrete DSB color palette only has 12 colors.")

    if (n == 2 && !is.null(primary)) {

      # check_primary_secondary(primary = primary,
      #                         secondary = secondary)

      if (is.null(secondary)) {
        stop("No secondary color provided with no default")
      }

      if (secondary == primary) warning("Same color applied to both primary and secondary category")

      if (!primary %in% names(pal)) {
        stop("Provided primary color is not in the DSB color palette. Must be one of names(epinionDSB::dsb_cols) (with or without DSB prefix)")
      }

      if (!secondary %in% names(pal)) {
        stop("Provided secondary color is not in the DSB color palette. Must be one of names(epinionDSB::dsb_cols) (with or without DSB prefix)")
      }

      # primary <- paste0("DSB ", primary)
      # secondary <- paste0("DSB ", secondary)

      secondary <- if (!secondary %in% names(pal)) {

        secondary

      } else {

        pal[secondary]

      }

      color_list <- c(secondary, pal[primary])

    } else {


      if (n > 2 && !is.null(primary)) warning("Argument 'primary' does not apply with more than two levels and is ignored")

      if (n > 2 && !is.null(secondary)) warning("Argument 'secondary' does not apply with more than two levels and is ignored")

      if (is.null(primary) && !is.null(secondary)){
        stop("No primary color provided with no default")
      }

      color_list <- pal[1:n]

    }

    color_list <- unname(unlist(color_list))

    if (reverse == FALSE) color_list else rev(color_list)

  }

}


#' @noRd
check_color_grab <- function(color) {

  if(!color %in% names(epinionDSB::dsb_cols)) {
    stop("Invalid color provided. Must be one of names(epinionDSB::dsb_cols) (with or without DSB prefix)")
  }

}



#' @noRd
check_primary_secondary <- function(primary,
                                    secondary,
                                    pal = pal) {

  if (is.null(secondary)) {
    stop("No secondary color provided with no default when primary color is provided")
  }

  if (secondary == primary) warning("Same color applied to both primary and secondary category")

  if (!primary %in% names(pal)) {
    stop("Provided primary color is not in the DSB color palette. Must be one of names(epinionDSB::dsb_cols) (with or without DSB prefix)")
  }

  if (!secondary %in% names(pal)) {
    stop("Provided secondary color is not in the DSB color palette. Must be one of names(epinionDSB::dsb_cols) (with or without DSB prefix)")
  }

}



#' @noRd
check_col_c <- function(palette,
                        reverse) {

  if(!reverse %in% c(TRUE, FALSE)) {
    stop("Invalid 'reverse' argument provided. Must be logical")
  }

  if(!palette %in% names(epinionDSB::dsbpal_c)) {
    stop("Invalid 'palette' argument provided. Must be one of names(epinionDSB::dsbpal_c)")
  }

}



