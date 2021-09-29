# This snippet defines a dataset of colors in the DSB Design Manual and provides their corresponding color codes in two formats
# RGB and HEX

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

# # ----- Upload data to GitHub
# usethis::use_data(dsb_colors,
#                   overwrite = TRUE)


# ----- Create named palette of HEX codes
# dsb_cols <- dsb_colors %>%
#   select(
#     c(name,
#       hex_codes)
#   ) %>%
#   tibble::deframe()
dsb_cols <- dsb_colors
rm(dsb_colors)
dsb_cols <- dsb_cols[, c(1,3)]
dsb_cols <- tibble::deframe(dsb_cols)



epinion_colors <- tibble::tibble(
  name = c(
    "Epi_White",
    "Epi_Red",
    "Epi_DarkBlue",
    "Epi_WarmSand",
    "Epi_DarkPurple",
    "Epi_ClearBlue",
    "Epi_LightDeepBlue",
    "Epi_LightPurple",
    "Epi_LightBlue",
    "Epi_Green",
    "Epi_LightGreen",
    "Epi_Gold",
    "Epi_LightGold"),
  hex_codes = c(
    "#FFFFFF",
    "#E13C32",
    "#0F283C",
    "#E8E1D5",
    "#641E3C",
    "#233CA0",
    "#68838B",
    "#BA7384",
    "#A7C7D7",
    "#004337",
    "#73A89A",
    "#C18022",
    "#EBC882"
  ))


epinion_cols <- tibble::deframe(epinion_colors)

# ----- Upload data to GitHub
getwd()
save(dsb_cols,
     file = "data/dsb_cols.rda")
save(epinion_cols,
     file = "data/epinion_cols.rda")
# usethis::use_data(dsb_cols,
#                   overwrite = TRUE)


# https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2
