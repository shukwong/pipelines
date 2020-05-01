#!/usr/bin/env Rscript

req_packages <- c("R.utils", "Rcpp", "RcppParallel", "RcppArmadillo", "data.table", "RcppEigen", "Matrix", "methods", "BH", "optparse", "SPAtest", "MetaSKAT", "roxygen2", "rversions","devtools")
for (pack in req_packages) {
    if(!require(pack, character.only = TRUE)) {
        install.packages(pack, repos = "https://cloud.r-project.org")
    }
}
