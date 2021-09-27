#' Extract HEX-codes and RGB-codes by color name
#'
#' This snippet defines a dataset of colors in the DSB Design Manual and provides their corresponding color codes in two formats:
#' RGB and HEX.
#' The code provided here is for transparency purposes only, the resulting data is provided in the data folder (dsb_colors.rda)
#' @author Jeppe Vierø
#' @export

# ----- Create a tibble based on the data in the DSB design manual
dsb_colors <- tibble::tibble(
  name = c(
    "DSB_Red",
    "DSB_DarkBlue",
    "DSB_LightBlue",
    "DSB_Orange",
    "DSB_LightGrey",
    "DSB_Purple",
    "DSB_Teal",
    "DSB_Turqoise",
    "DSB_DarkGrey",
    "DSB_LightGreen",
    "DSB_Green",
    "DSB_DarkGreen"),
  rgb = c(
    "180 23 48",
    "0 35 60",
    "83 130 182",
    "223 101 44",
    "165 165 165",
    "110 60 110",
    "40 118 126",
    "65 189 191",
    "116 116 116",
    "136 201 136",
    "28 166 69",
    "20 78 54"
  ))


# ----- Pull out RGB-codes
rgb_codes <- dsb_colors$rgb

# ----- Get HEX codes, add to tibble
dsb_colors$hex_codes <- sapply(strsplit(rgb_codes, " "), function(x)
  rgb(x[1], x[2], x[3], maxColorValue=255))


# ----- Upload data to GitHub
usethis::use_data(dsb_colors,
                  overwrite = TRUE)


# ----- Try out the colors
mtcars <- mtcars[1:nrow(dsb_colors),]
mtcars$hex_code = dsb_colors$hex_codes
mtcars$id <- as.factor(seq(1:nrow(mtcars)))

ggplot(mtcars, aes(x = wt,
                   y = mpg,
                   color = factor(am))) +
  geom_point(size = 3) +
  facet_wrap(~ vs) +
  dsb_style() +
  scale_color_manual(values = mtcars$hex_code)

ggplot(mtcars, aes(x = wt,
                   y = mpg,
                   color = factor(carb))) +
  geom_point(size = 5) +
  facet_wrap(~ vs)
  dsb_style() +
  scale_color_manual(values = mtcars$hex_code)
mtcars
