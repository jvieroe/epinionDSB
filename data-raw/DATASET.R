## code to prepare `DATASET` dataset goes here


# ---------- Create a tibble of colors ----------
dsb_colors <- tibble::tibble(
  name = c(
    "DSB Red",
    "DSB DarkBlue",
    "DSB LightBlue",
    "DSB Orange",
    "DSB LightGrey",
    "DSB Purple",
    "DSB Teal",
    "DSB Turqoise",
    "DSB DarkGrey",
    "DSB LightGreen",
    "DSB Green",
    "DSB DarkGreen"),
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


# Pull out RGB-codes
rgb_codes <- dsb_colors$rgb

# Get HEX codes, add to tibble
dsb_colors$hex_codes <- sapply(strsplit(rgb_codes, " "), function(x)
  rgb(x[1], x[2], x[3], maxColorValue=255))

dsb_cols <- dsb_colors
rm(dsb_colors, rgb_codes)
dsb_cols <- dsb_cols[, c(1,3)]
dsb_cols <- tibble::deframe(dsb_cols)

# Upload data to GitHub
usethis::use_data(dsb_cols,
                  overwrite = TRUE)




# ---------- Create list with continuous color palettes ----------
# dsb_palettes
dsbpal_c <- list(

  `reds` = dsb_colvec("DSB Orange", "DSB Red"),

  `blues` = dsb_colvec("DSB LightBlue", "DSB DarkBlue"),

  `greens` = dsb_colvec("DSB LightGreen", "DSB Green", "DSB DarkGreen"),

  `teals` = dsb_colvec("DSB Turqoise", "DSB Teal")

)

# Upload data to GitHub
usethis::use_data(dsbpal_c,
                  overwrite = TRUE)


# ---------- Create list of lists with discrete color palettes ----------
# dsb_palettes_d
dsbpal_d <- list()

dsbpal_d$main <- list(

  "DSB Red" = "#B41730",
  "DSB DarkBlue" = "#00233C",
  "DSB Orange" = "#DF652C",
  "DSB DarkGreen" = "#144E36",
  "DSB Purple" = "#6E3C6E",
  "DSB Teal" = "#28767E",
  "DSB DarkGrey" = "#747474",
  "DSB LightBlue" = "#5382B6",
  "DSB LightGreen" = "#88C988",
  "DSB Turqoise" = "#41BDBF",
  "DSB Green" = "#1CA645",
  "DSB LightGrey" = "#A5A5A5"

)

# Upload data to GitHub
usethis::use_data(dsbpal_d,
                  overwrite = TRUE)

document()
