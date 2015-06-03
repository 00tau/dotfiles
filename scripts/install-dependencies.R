#!/usr/bin/Rscript

# Installs common R-package to the system.

install.packages(  c(  "MASS"
                     , "lhs"
                     , "mlr"
                     , "plyr"
                     , "reshape2"
                     , "ggplot2"
                     , "ParamHelpers"
                     , "BBmisc"
                     , "BatchJobs"
                     , "BatchExperiments"
#                     , "metafor"
#                     , "metaLik"
#                     , "vimcom"
#                     , "utils"
#                     , "setwidth"
                     , "colorout")
                 , repos = "http://ftp5.gwdg.de/pub/misc/cran/")
