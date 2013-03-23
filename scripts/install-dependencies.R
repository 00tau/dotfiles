#!/usr/bin/Rscript

# Installs common R-package to the system.

install.packages(  c(  "MASS"
                     , "plyr"
                     , "lhs"
                     , "ParamHelpers"
                     , "BBmisc"
                     , "BatchExperiments"
                     , "ggplot2"
                     , "reshape"
                     , "metafor"
                     , "metaLik"
                     , "vimcom"
                     , "utils"
                     , "setwidth"
                     , "colorout")
                 , repos = "http://ftp5.gwdg.de/pub/misc/cran/")
