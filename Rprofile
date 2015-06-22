### set locales
#tmp = Sys.setlocale("LC_MESSAGES", "en_GB.UTF-8")
#tmp = Sys.setlocale("LC_CTYPE", "en_GB.UTF-8")
#rm(tmp)

# Set proxy
#Sys.setenv(http_proxy="http://do2-dansguardian.isas.de:3128")

options(repos = c(CRAN = "http://ftp5.gwdg.de/pub/misc/cran"))
options(BioC_mirror = "http://bioconductor.statistik.tu-dortmund.de")
options(browserNLdisabled = TRUE)

sourceBioLite <- function () {
    source("http://bioconductor.org/biocLite.R")
}

lib = Sys.getenv("R_LIBS_USER")
if (lib != "") {
  if (!file.exists(lib)) {
    message("Creating empty user lib directory ", lib)
    dir.create(lib, recursive=TRUE, mode="755")
  } else {
    message("User lib: ", lib)
  }
} else {
  message("No user lib")
}
rm(lib)

if(interactive()) {
#    options(pager = "vim -c 'set ft=rdoc' -")
#    options(editor = "vim -c 'set ft=r'")
    options(menu.graphics = FALSE)

#    require("lhs")
#    require("mlr")
    require("plyr")
    require("reshape2")
    require("ggplot2")
#  require("vimcom")
#  require("setwidth")

  if(require("utils")) {
    message("R history enabled")
    try(loadhistory("~/.Rhistory"))
    .Last <- function() try(savehistory("~/.Rhistory"))
  } else {
    message("R history disabled")
  }
}
