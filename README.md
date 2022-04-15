
<!-- README.md is generated from README.Rmd. Please edit that file -->

# labeler <img src='man/figures/logo.png' align="right" height="138" />

<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![R build
status](https://github.com/adatar-do/labeler/workflows/R-CMD-check/badge.svg)](https://github.com/adatar-do/labeler/actions)
[![Codecov test
coverage](https://codecov.io/gh/adatar-do/labeler/branch/main/graph/badge.svg)](https://codecov.io/gh/adatar-do/labeler?branch=main)
[![CRAN
status](https://www.r-pkg.org/badges/version/labeler)](https://CRAN.R-project.org/package=labeler)
<!-- badges: end -->

This package contains functions to assign and use data labels in an easy
and efficient way. With an easy to share structure.

## Installation

<!-- You can install the released version of labeler from [CRAN](https://CRAN.R-project.org) with: -->
<!-- ``` r -->
<!-- install.packages("labeler") -->
<!-- ``` -->

`labeler` is not available in CRAN.

But you can install the development version from
[GitHub](https://github.com/) with:

``` r
tryCatch(
  library(remotes),
  error = function(e){
    install.packages('remotes')
  }
)
remotes::install_github("adatar-do/labeler")
```

## Contributing

Have a feedback or want to contribute?

Please take a look at the [contributing
guidelines](https://adatar-do.github.io/labeler/CONTRIBUTING.html)
before filing an issue or pull request.

Please note that the `labeler` project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.

<hr/>

<a href="./articles/labeler.html">
  <svg width="50%" height="30" xmlns="http://www.w3.org/2000/svg" style="display: block; margin: auto;">
  <linearGradient id="a" x2="0" y2="100%">
    <stop offset="0" stop-color="#bbb" stop-opacity="0.2"/>
  <stop offset="1" stop-opacity="0.1"/>
    </linearGradient>
    <rect rx="4" x="0" width="50%" height="30" fill="#555"/>
    <rect rx="4" x="0" width="50%" height="30" fill="#00a65a"/>
    <rect rx="4" width="50%" height="30" fill="url(#a)"/>
    <g fill="#fff" text-anchor="middle" font-size="18">
    <text x="25%" y="21">Get started!</text>
    </g>
    </svg>
    </a>
