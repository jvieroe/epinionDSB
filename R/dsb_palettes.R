dsb_palettes <- list(

  `red`  = dsb_colvec("DSB_Red"),

  `main`  = dsb_colvec("DSB_Red", "DSB_Green", "DSB_Orange",
                       "DSB_Turqoise", "DSB_DarkGrey",
                       "DSB_Purple", "DSB_Teal", "DSB_DarkBlue"),

  `two`  = dsb_colvec("DSB_Red", "DSB_DarkBlue"),

  `three`   = dsb_colvec("DSB_Red", "DSB_DarkBlue", "DSB_Orange"),

  `four` = dsb_colvec("DSB_Red", "DSB_DarkBlue", "DSB_Orange", "DSB_LightGrey"),

  `full`  = dsb_colvec(),

  `reds`  = dsb_colvec("DSB_Orange", "DSB_Red"),

  `blues`  = dsb_colvec("DSB_LightBlue", "DSB_DarkBlue"),

  `greens`  = dsb_colvec("DSB_LightGreen", "DSB_Green", "DSB_DarkGreen"),

  `teals`  = dsb_colvec("DSB_Turqoise", "DSB_Teal")

)


# ----- Upload data to GitHub
usethis::use_data(dsb_palettes,
                  overwrite = TRUE)

#dsb_colvec()
