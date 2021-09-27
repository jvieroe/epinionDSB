
<!-- README.md is generated from README.Rmd. Please edit that file -->

# epinionDSB

<!-- badges: start -->

<!-- badges: end -->

The goal of `epinionDSB` is to provide easy-to-use templates for
visualizations using the `ggplot2` package

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
library(devtools)
devtools::install_github("jvieroe/epinionDSB")
```

## Readymade `ggplot2` style

The `epinionDSB::dsb_style()` function adds a tailormade theme to your
`ggplot2` graphics. This allows for a coherent Corporate Visual Identity
(CVI) for Epinion consultants working with DSB. Importantly, the
`dsb_style()` function both

  - serves as a time-saver when producing many visualizations, as
    compared to specifying `ggplot2::theme()` in each plot
  - allows you to efficiently align visual styles and apply these across
    the board by altering the content of the `dsb_style()` function
    itself

### Example

``` r
library(tidyverse)
library(epinionDSB)
```

The `dsb_style()` function does not impact the `aes()` of your
`geom_*()`, only the `ggplot2::theme()`. The only argument taken by
`dsb_style` (at the time of writing) is the `legend` option specifying
whether a legend is included and defaulting to `TRUE` (with
`legend.position` defaulting to `"right"`)

``` r
ggplot(mtcars, aes(x = wt,
                   y = mpg,
                   color = factor(am))) +
  geom_point(size = 3) +
  facet_wrap(~ vs) +
  dsb_style()
```

<img src="man/figures/README-cars-1.png" width="75%" style="display: block; margin: auto;" />

Note that all `ggplot2::theme()` settings inherent in `dsb_style()` can
be overwritten by adding `theme()` elements after `dsb_style()`:

``` r
ggplot(mtcars, aes(x = wt,
                   y = mpg,
                   color = factor(am))) +
  geom_point(size = 3) +
  facet_wrap(~ vs) +
  dsb_style() +
  theme(legend.position = "bottom")
```

<img src="man/figures/README-cars2-1.png" width="75%" style="display: block; margin: auto;" />

<!-- You'll still need to render `README.Rmd` regularly, to keep `README.md` up-to-date. `devtools::build_readme()` is handy for this. You could also use GitHub Actions to re-render `README.Rmd` every time you push. An example workflow can be found here: <https://github.com/r-lib/actions/tree/master/examples>. -->

<!-- In that case, don't forget to commit and push the resulting figure files, so they display on GitHub and CRAN. -->

## Color palettes

Below, we get the HEX codes for…

``` r
# ... the classic DSB red
dsb_colvec("DSB_Red")
#>   DSB_Red 
#> "#B41730"
```

``` r
# ... a selection of colors
dsb_colvec("DSB_Red", "DSB_DarkGrey", "DSB_DarkGreen")
#>       DSB_Red  DSB_DarkGrey DSB_DarkGreen 
#>     "#B41730"     "#747474"     "#144E36"
```

``` r
# ... all DSB colors
dsb_colvec()
#>        DSB_Red   DSB_DarkBlue  DSB_LightBlue     DSB_Orange  DSB_LightGrey 
#>      "#B41730"      "#00233C"      "#5382B6"      "#DF652C"      "#A5A5A5" 
#>     DSB_Purple       DSB_Teal   DSB_Turqoise   DSB_DarkGrey DSB_LightGreen 
#>      "#6E3C6E"      "#28767E"      "#41BDBF"      "#747474"      "#88C988" 
#>      DSB_Green  DSB_DarkGreen 
#>      "#1CA645"      "#144E36"
```
