ochathemes
==========

<!-- README.md is generated from README.Rmd. Please edit that file -->

[![GitLab CI Build
Status](https://gitlab.com/dickoa/ochathemes/badges/master/build.svg)](https://gitlab.com/dickoa/ochathemes/pipelines)
[![Codecov Code
Coverage](https://codecov.io/gl/dickoa/ochathemes/branch/master/graph/badge.svg)](https://codecov.io/gl/dickoa/ochathemes)
[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

`ochathemes` is package providing `ggplot2` themes and theme components
inspired by OCHA graphics stylebook.

Installation
------------

This package is not on yet on CRAN and to install it, you will need the
[`remotes`](https://github.com/r-lib/remotes) package.

    ## install.packages("remotes") 
    remotes::install_gitlab("dickoa/ochathemes")

Using icons from the `humicons` package
---------------------------------------

    library(ochathemes)
    library(humicons)
    library(ggplot2)

    ggplot(mtcars, aes(mpg, wt)) +
        geom_text(family = font_hum, label = humicons("un-vehicle"), size = 7, color = "#418FDE") +
        labs(title = "Using the UN-Vehicle icon in ggplot2", x = "", y = "") +
        theme_ocha(grid = "XY")

![](https://gitlab.com/dickoa/ochathemes/raw/master/inst/extdata/fig-1.png)

Meta
----

-   Please [report any issues or
    bugs](https://gitlab.dickoa/ochathemes/issues).
-   License: MIT
-   Please note that this project is released with a [Contributor Code
    of Conduct](CONDUCT.md). By participating in this project you agree
    to abide by its terms.
