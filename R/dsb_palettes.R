# ----- Create list with continuous color palettes
dsb_palettes <- list(

  `reds` = dsb_colvec("DSB_Orange", "DSB_Red"),

  `blues` = dsb_colvec("DSB_LightBlue", "DSB_DarkBlue"),

  `greens` = dsb_colvec("DSB_LightGreen", "DSB_Green", "DSB_DarkGreen"),

  `teals` = dsb_colvec("DSB_Turqoise", "DSB_Teal")

)

epi_palettes <- list(

  `epiblue` = epi_colvec("Epi_WarmSand", "Epi_ClearBlue", "Epi_DarkBlue"),

  `epipurple` = epi_colvec("Epi_WarmSand", "Epi_LightPurple", "Epi_DarkPurple"),

  `epigreen` = epi_colvec("Epi_WarmSand", "Epi_LightGreen", "Epi_Green"),

  `epigold` = epi_colvec("Epi_WarmSand", "Epi_LightGold", "Epi_Gold")

)

# ----- Create list of lists with discrete color palettes
dsb_palettes_d <- list()

dsb_palettes_d$main <- list(

  "DSB_Red" = "#B41730",
  "DSB_DarkBlue" = "#00233C",
  "DSB_Orange" = "#DF652C",
  "DSB_DarkGreen" = "#144E36",
  "DSB_Purple" = "#6E3C6E",
  "DSB_Teal" = "#28767E",
  "DSB_DarkGrey" = "#747474",
  "DSB_LightBlue" = "#5382B6",
  "DSB_LightGreen" = "#88C988",
  "DSB_Turqoise" = "#41BDBF",
  "DSB_Green" = "#1CA645",
  "DSB_LightGrey" = "#A5A5A5"

)


dsb_palettes_d$epinion <- list(

  "Epi_DarkBlue" = "#0F283C",
  "Epi_WarmSand" = "#E8E1D5",
  "Epi_DarkPurple" = "#641E3C",
  "Epi_ClearBlue" = "#233CA0",
  "Epi_LightDeepBlue" = "#68838B",
  "Epi_LightPurple" = "#BA7384",
  "Epi_LightBlue" = "#A7C7D7",
  "Epi_Green" = "#004337",
  "Epi_LightGreen" = "#73A89A",
  "Epi_Gold" = "#C18022",
  "Epi_LightGold" = "#EBC882",
  "Epi_Red" = "#E13C32"

)




# ----- Upload data to GitHub
getwd()
save(dsb_palettes,
     file = "data/dsb_palettes.rda")
save(epi_palettes,
     file = "data/epi_palettes.rda")
save(dsb_palettes_d,
     file = "data/dsb_palettes_d.rda")

# usethis::use_data(dsb_palettes,
#                   overwrite = TRUE)

#dsb_colvec()
