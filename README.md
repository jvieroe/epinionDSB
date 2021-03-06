
<!-- README.md is generated from README.Rmd. Please edit that file -->

# epinionDSB <img src='man/figures/logo.svg' align="right" height="189" />

<!-- badges: start -->

[![CodeFactor](https://www.codefactor.io/repository/github/jvieroe/epiniondsb/badge)](https://www.codefactor.io/repository/github/jvieroe/epiniondsb)
[![codecov](https://codecov.io/gh/jvieroe/epinionDSB/branch/main/graph/badge.svg?token=T9PXFX8SKB)](https://codecov.io/gh/jvieroe/epinionDSB)
<!-- [![Github All Releases](https://img.shields.io/github/downloads/jvieroe/epinionDSB/total.svg)]() -->
[![](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![License: GPL (>=
3)](https://img.shields.io/badge/license-GPL%20(%3E=%203)-blue.svg)](https://cran.r-project.org/web/licenses/GPL%20(%3E=%203))
[![](https://img.shields.io/github/last-commit/jvieroe/epinionDSB.svg)](https://github.com/jvieroe/epinionDSB/commits/main)
<!-- [![Travis build status](https://travis-ci.org/jvieroe/epinionDSB.svg?branch=main)](https://travis-ci.org/jvieroe/epinionDSB) -->

Master branch status:
[![R-CMD-check](https://github.com/jvieroe/epinionDSB/workflows/R-CMD-check/badge.svg)](https://github.com/jvieroe/epinionDSB/actions)
[![](https://img.shields.io/badge/devel%20version-0.1.1-dodgerblue.svg)](https://github.com/https://github.com/jvieroe/epinionDSB)
<!-- badges: end -->

# Introduction

The goal of `epinionDSB` is to provide easy-to-use templates for data
visualizations using the `ggplot2` package and in line with the
Corporate Visual Identity (CVI) of DSB.

For this purpose, `epinionDSB` functionality includes:

1.  a set of tailor-made `ggplot2` themes
2.  custom-made color palettes for both discrete and continuous mapping
    variables

## Quick example

``` r
library(tidyverse)
library(epinionDSB)

ggplot(mtcars, aes(x = wt,
                   y = mpg)) +
  geom_point(aes(color = factor(cyl)),
             alpha = .85,
             size = 4) +
  facet_wrap(~ vs) +
  dsb_theme_classic(gridlines = "both") +
  color_dsb_d(reverse = T)
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="75%" style="display: block; margin: auto;" />

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
if(!require("devtools")) install.packages("devtools")
library(devtools)
devtools::install_github("jvieroe/epinionDSB")
```

## Readymade `ggplot2` themes

`epinionDSB::dsb_theme_*()` adds a tailormade theme to your `ggplot2`
objects. This makes them compliant with the DSB CVI and serves as a
time-saver when producing several plots.

Choose between three themes:

-   `dsb_theme_classic()`, designed for most visualization purposes
    -   arguments: `legend`, `gridlines`, `textcolor`
-   `dsb_theme_map()`, a very minimalist theme designed with geospatial
    maps in mind
    -   arguments: `legend`, `textcolor`
-   `dsb_theme_dust()`, to a large degree similar to
    `dsb_theme_classic()` but with a warmer, dusty feel
    -   arguments: `legend`, `gridlines`, `textcolor`, `background`

Note that all `ggplot2::theme()` settings inherent in `dsb_theme*()` can
be overwritten by adding `theme(...)` elements afterwards.

``` r
ggplot(mtcars, aes(x = wt,
                   y = mpg,
                   color = factor(am))) +
  geom_point(size = 4) +
  dsb_theme_classic(gridlines = "none") +
  theme(legend.position = "right")
```

<img src="man/figures/README-cars2-1.png" width="75%" style="display: block; margin: auto;" />

The `dsb_theme_*()` functions do not impact the aesthetics of your plot
(e.g.??color scales), only the `ggplot2::theme()` elements.

<!-- You'll still need to render `README.Rmd` regularly, to keep `README.md` up-to-date. `devtools::build_readme()` is handy for this. You could also use GitHub Actions to re-render `README.Rmd` every time you push. An example workflow can be found here: <https://github.com/r-lib/actions/tree/master/examples>. -->
<!-- In that case, don't forget to commit and push the resulting figure files, so they display on GitHub and CRAN. -->

## DSB color palettes

You can apply DSB themed colors with `epinionDSB`. Choose between the
following approaches:

### Extract HEX codes using `dsb_colvec()` or `dsb_grabcol()`

The `epinionDSB` package provides access to the color palette in the DSB
design manual. Specifically, the `dsb_colvec()` function extracts HEX
codes by the color names.

``` r
# ... all DSB colors
dsb_colvec()
#>        DSB Red   DSB DarkBlue  DSB LightBlue     DSB Orange  DSB LightGrey 
#>      "#B41730"      "#00233C"      "#5382B6"      "#DF652C"      "#A5A5A5" 
#>     DSB Purple       DSB Teal   DSB Turqoise   DSB DarkGrey DSB LightGreen 
#>      "#6E3C6E"      "#28767E"      "#41BDBF"      "#747474"      "#88C988" 
#>      DSB Green  DSB DarkGreen 
#>      "#1CA645"      "#144E36"

# a selection of colors
dsb_colvec("DSB Red", "DSB DarkBlue")
#>      DSB Red DSB DarkBlue 
#>    "#B41730"    "#00233C"
```

We can use these to manually change our colors by either (1) using the
HEX codes provided by `epinion::dsb_colvec()` directly or (2) by pasting
the names into the `epinionDSB::dsb_grabcol()` function. Both functions
only accept colors in the Epinion color palette as inputs but the latter
is not sensitive to the inclusion of the Epinion prefix:

``` r
ggplot(mtcars, aes(x = wt,
                   y = mpg,
                   color = factor(am))) +
  geom_point(size = 4) +
  dsb_theme_dust(legend = FALSE) +
  scale_colour_manual(values = c(dsb_grabcol("DSB Red"), 
                                 dsb_grabcol("DarkBlue")))
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="75%" style="display: block; margin: auto;" />

### Apply ready-made color palettes

To provide a more verbose alternative, `epinionDSB` contains
out-of-the-box functions to provide our `ggplot2` figures with the DSB
color palette. These functions apply to both discrete and continuous
variable mapping and for both `aes(color = )` and `aes(fill = )`:

**Discrete variables**

-   `color_dsb_d`: to use with the `aes(color = x)`, where x is a
    `factor` or `character` variable
-   `fill_dsb_d`: to use with the `aes(fill = x)`, where x is a `factor`
    or `character` variable

**Continuous variables**

-   `color_dsb_c`: to use with the `aes(color = x)`, where x is a
    `numeric` or `integer` variable
-   `fill_dsb_c`: to use with the `aes(fill = x)`, where x is a
    `numeric` or `integer` variable

The main argument taken by all four functions is `reverse` which allows
you to reverse the order of the color scale (default is `FALSE`).

#### Additional arguments: `*_dsb_d()`

-   When mapping `color_dsb_d()` or `fill_dsb_d()` to a variable with
    **only two levels**, you can manually choose colors with the
    `primary` and `secondary` arguments. As with
    `epinionDSB::dsb_grabcol()` colors can be specified with or without
    the DSB prefix

``` r
p1 <-
  ggplot(mtcars, aes(x = wt,
                     y = mpg,
                     color = factor(am))) +
  geom_point(size = 4) +
  dsb_theme_classic(legend = FALSE) +
  color_dsb_d(primary = "DSB Red",
              secondary = "DSB Orange")

p2 <-
  ggplot(mtcars, aes(x = wt,
                     y = mpg,
                     color = factor(am))) +
  geom_point(size = 4) +
  dsb_theme_classic(legend = FALSE) +
  color_dsb_d(primary = "Red",
              secondary = "Orange")


library(patchwork)
p1 / p2
```

<img src="man/figures/README-unnamed-chunk-5-1.png" width="75%" style="display: block; margin: auto;" />

#### Additional arguments: `*_epi_c()`

-   `epinionDSB` contains four different continuous color palettes:
    `reds`, `greens`, `blues`, and `teals`.
-   You choose between these with the `palette` option in
    `color_dsb_c()` and `fill_dsb_c()`

``` r
# continuous variable in aes()
p1 <- 
  ggplot(mtcars, aes(x = wt,
                         y = mpg,
                         color = disp)) +
  geom_point(size = 4) +
  dsb_theme_dust(background = TRUE,
                 legend = FALSE) +
  color_dsb_c(palette = "greens")

p2 <- 
  ggplot(mtcars, aes(x = wt,
                         y = mpg,
                         color = disp)) +
  geom_point(size = 4) +
  dsb_theme_dust(background = TRUE,
                 legend = FALSE) +
  color_dsb_c(palette = "greens",
              reverse = TRUE)

p3 <- 
  ggplot(mtcars, aes(x = wt,
                         y = mpg,
                         color = disp)) +
  geom_point(size = 4) +
  dsb_theme_dust(background = TRUE,
                 legend = FALSE) +
  color_dsb_c(palette = "reds")

p4 <- 
  ggplot(mtcars, aes(x = wt,
                         y = mpg,
                         color = disp)) +
  geom_point(size = 4) +
  dsb_theme_dust(background = TRUE,
                 legend = FALSE) +
  color_dsb_c(palette = "reds",
              reverse = TRUE)


library(patchwork)
library(repinion)

(p1 + p2) /
  (p3 + p4) + 
  plot_annotation(theme = 
                    theme(plot.background = 
                            element_rect(color = NA,
                                         fill = repinion::grabcol("Epinion WarmSand"),
                                         )
                          )
                  )
```

<img src="man/figures/README-unnamed-chunk-6-1.png" width="75%" style="display: block; margin: auto;" />

#### Additional arguments: `*_dsb_d()`

-   When mapping `color_dsb_d()` or `fill_dsb_d()` to a variable with
    **only two levels**, you can manually choose colors with the
    `primary` and `secondary` arguments

#### Additional arguments

Notice that `*_dsb_c()` and `*_dsb_d()` inherently calls
`ggplot2::scale_*_gradientn()` and `ggplot2::discrete_scale()`,
respectively. For that reason, additional arguments, such as `guide`,
also apply. See
[`ggplot2::scale_colour_gradientn()`](https://tidyverse.github.io/ggplot2-docs/reference/scale_gradient.html "Gradient colour scales")
and
[`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html "Discrete scale constructor")
for details on additional arguments.

# Acknowledgements

-   The R Core Team for developing and maintaining the language
-   Hadley Wickham ([hadley](https://github.com/hadley)) and the rest of
    the team working on the amazing `ggplot2` package (and, frankly, the
    entire `tidyverse` ecosystem)
-   Garrick Aden-Buie ([gadenbuie](https://github.com/gadenbuie)) and Dr
    Simon Jackson ([drsimonj](https://github.com/drsimonj)) for
    inspiration
-   Steffen Bank ([steffenbank](https://github.com/steffenbank)) for
    convincing me to finally try to write my own `R` package
