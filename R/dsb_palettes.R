dsb_palettes <- list(

  `one`  = dsb_colvec("DSB_Red"),

  `two`  = dsb_colvec("DSB_Red", "DSB_DarkBlue"),

  `three`   = dsb_colvec("DSB_Red", "DSB_DarkBlue", "DSB_Orange"),

  `main`  = dsb_colvec("DSB_Red", "DSB_Green", "DSB_Orange", "DSB_Turqoise", "DSB_DarkGrey", "DSB_Purple", "DSB_Teal", "DSB_DarkBlue"),

  #`four` = dsb_colvec("DSB_Red", "DSB_DarkBlue", "DSB_Orange", "DSB_LightGrey"),

  #`full`  = dsb_colvec(),

  `reds`  = dsb_colvec("DSB_Orange", "DSB_Red"),

  `blues`  = dsb_colvec("DSB_LightBlue", "DSB_DarkBlue"),

  `greens`  = dsb_colvec("DSB_LightGreen", "DSB_Green", "DSB_DarkGreen"),

  `teals`  = dsb_colvec("DSB_Turqoise", "DSB_Teal")

)


# ----- Upload data to GitHub
getwd()
save(dsb_palettes,
     file = "data/dsb_palettes.rda")
# usethis::use_data(dsb_palettes,
#                   overwrite = TRUE)

#dsb_colvec()
