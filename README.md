
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
if(!require("devtools")) install.packages("devtools")
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

Above, I get the standard colors in `ggplot2` because `aes(color =
factor(am))` was not followed by a color specification. We could
manually add colors as specified by *[the DSB Design
Manual](https://github.com/jvieroe/epinionDSB/blob/main/data/DSB_graf-farver.pdf)*
(DSBDM).

### Extract HEX codes using `dsb_colvec()`

The `epinionDSB` package provides access to the color palette in the
DSBDM and for readily used color palettes. Specifically, the
`dsb_colvec` function extracts HEX codes by the color names.

``` r
# ... all DSB colors
dsb_colvec()
#>        DSB_Red   DSB_DarkBlue  DSB_LightBlue     DSB_Orange  DSB_LightGrey 
#>      "#B41730"      "#00233C"      "#5382B6"      "#DF652C"      "#A5A5A5" 
#>     DSB_Purple       DSB_Teal   DSB_Turqoise   DSB_DarkGrey DSB_LightGreen 
#>      "#6E3C6E"      "#28767E"      "#41BDBF"      "#747474"      "#88C988" 
#>      DSB_Green  DSB_DarkGreen 
#>      "#1CA645"      "#144E36"
# a selection of colors
dsb_colvec("DSB_Red", "DSB_DarkBlue")
#>      DSB_Red DSB_DarkBlue 
#>    "#B41730"    "#00233C"
```

We can use these in our `ggplot2` syntax:

``` r
# ... a selection of colors
ggplot(mtcars, aes(x = wt,
                   y = mpg,
                   color = factor(am))) +
  geom_point(size = 3) +
  facet_wrap(~ vs) +
  dsb_style() +
  scale_colour_manual(values = c("#B41730", "#00233C"))
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="75%" style="display: block; margin: auto;" />

Great\! This is **much** more in line with DSB’s visual identity. This
is a tedious process, however, and any changes to the CVI would involve
a lot of manual changes in our accumulated `ggplot2` syntax.

### Apply ready-made color palettes

To provide a more verbose alternative, the `epinionDSB` contains
out-of-the-box syntax to provide our `ggplot2` figures with a color
palette consisting of the colors in the DSBDM:

  - `color_dsb_d`: to use with the `aes(color = x)`, where x is a
    `factor` or `character` variable
  - `color_dsb_c`: to use with the `aes(color = x)`, where x is a
    `numeric` or `integer` variable
  - `fill_dsb_d`: to use with the `aes(fill = x)`, where x is a `factor`
    or `character` variable
  - `fill_dsb_c`: to use with the `aes(fill = x)`, where x is a
    `numeric` or `integer` variable

Note that, similarly to `ggplot2::scale_color_*()`, `color_dsb_*` is
**not** sensitive to American/English spelling and `colour_dsb_*` works
identically.

Let’s check it out

``` r
library(gridExtra)

# discrete variable in aes()
p1 <-
  ggplot(mtcars, aes(x = wt,
                     y = mpg,
                     color = factor(am))) +
  geom_point(size = 3) +
  facet_wrap(~ vs) +
  dsb_style() +
  color_dsb_d()

# continuous variable in aes()
p2 <-
  ggplot(mtcars, aes(x = wt,
                     y = mpg,
                     color = disp)) +
  geom_point(size = 3) +
  facet_wrap(~ vs) +
  dsb_style() +
  color_dsb_c()

grid.arrange(
  p1, p2,
  ncol = 1
  )
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="75%" style="display: block; margin: auto;" />

`color_dsb_*()` primarily takes two arguments as inputs:

  - `palette`, which allows you to choose your color palette. Call
    `epinionDSB::dsb_palettes` for a complete overview
  - `reverse`, a logical value indicating the scale is reversed (default
    is `FALSE`)

Notice however that `color_dsb_c()` and `color_dsb_d()` inherently calls
`ggplot2::scale_colour_gradientn()` and `ggplot2::discrete_scale()`,
respectively. For that reason, additional arguments such as `guide` also
apply See
[`ggplot2::scale_colour_gradientn()`](https://tidyverse.github.io/ggplot2-docs/reference/scale_gradient.html "xxx")
and
[`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html "xxx")
for details on additional arguments.

### 

``` r
# ... all DSB colors
dsb_palettes
#> $red
#>   DSB_Red 
#> "#B41730" 
#> 
#> $two
#>      DSB_Red DSB_DarkBlue 
#>    "#B41730"    "#00233C" 
#> 
#> $three
#>      DSB_Red DSB_DarkBlue   DSB_Orange 
#>    "#B41730"    "#00233C"    "#DF652C" 
#> 
#> $four
#>       DSB_Red  DSB_DarkBlue    DSB_Orange DSB_LightGrey 
#>     "#B41730"     "#00233C"     "#DF652C"     "#A5A5A5" 
#> 
#> $full
#>        DSB_Red   DSB_DarkBlue  DSB_LightBlue     DSB_Orange  DSB_LightGrey 
#>      "#B41730"      "#00233C"      "#5382B6"      "#DF652C"      "#A5A5A5" 
#>     DSB_Purple       DSB_Teal   DSB_Turqoise   DSB_DarkGrey DSB_LightGreen 
#>      "#6E3C6E"      "#28767E"      "#41BDBF"      "#747474"      "#88C988" 
#>      DSB_Green  DSB_DarkGreen 
#>      "#1CA645"      "#144E36" 
#> 
#> $continuous
#> DSB_Orange    DSB_Red 
#>  "#DF652C"  "#B41730"
```
