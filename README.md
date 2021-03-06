
<!-- README.md is generated from README.Rmd. Please edit that file -->

# deepmaps-api

<!-- badges: start -->

[![Render and Deploy pkgdown
Website](https://github.com/Wang-Cankun/iris3api/actions/workflows/pkgdown.yaml/badge.svg)](https://github.com/Wang-Cankun/iris3api/actions/workflows/pkgdown.yaml)
[![R-CMD-check](https://github.com/Wang-Cankun/iris3api/workflows/R-CMD-check/badge.svg)](https://github.com/Wang-Cankun/iris3api/actions)
[![Project Status: WIP - Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
<!-- badges: end -->

The package is the R API server for DeepMAPS website.

## Installation

### R package

``` r
library(devtools)
install_github("Wang-Cankun/iris3api@master")
```

### Docker build

We split the package to 2 containers, as it can speed up the build and
deployment time (40 min -\> 5 min).

To build the docker image, enter project root directory first.

#### Base image

This base image contains all necessary for the package. Including
plumber, Seurat, Signac, tidyverse, BioConductor suite (GenomicRanges,
SingleCellExperiment, etc.)

``` bash
# Build
docker build -f base.Dockerfile -t wangcankun100/deepmaps-api-base .

# Test what packages are installed
docker run wangcankun100/deepmaps-api-base
```

#### Client image

This client image builds upon the deepmaps-api-base image. It will only
install the R package itself.

```{bash, eval=FALSE}
# Build
docker build --no-cache -f R-client.Dockerfile -t wangcankun100/deepmaps-r-client .
docker push wangcankun100/deepmaps-r-client

# Deploy
docker pull wangcankun100/deepmaps-r-client
docker run -d -v /var/www/nodejs/data/:/data --name deepmaps-r-client -p 8000:8000 wangcankun100/deepmaps-r-client
docker logs deepmaps-r-client
docker restart deepmaps-r-client

# Run
docker run --rm -p 8000:8000 wangcankun100/deepmaps-r-client
docker run -v /var/www/nodejs/data/:/data -p 8000:8000 wangcankun100/deepmaps-r-client

```
