### set locales
tmp = Sys.setlocale("LC_MESSAGES", "en_GB.UTF-8")
tmp = Sys.setlocale("LC_CTYPE", "en_GB.UTF-8")
rm(tmp)

### set proxy
#Sys.setenv(http_proxy="http://something.domain.de:3128")

### set repositries
options(repos = c(CRAN = "http://ftp5.gwdg.de/pub/misc/cran"))
options(BioC_mirror = "http://bioconductor.statistik.tu-dortmund.de")
options(browserNLdisabled = TRUE)

sourceBioLite <- function () {
    source("http://bioconductor.org/biocLite.R")
}

### set lib
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

options(papersize="a4")
options(editor="vim")
options(pager="less")

### set some defaults when running interactive
if(interactive()) {
    options(menu.graphics = FALSE)

    require("vimcom")
    require("plyr")
    require("reshape2")
    require("ggplot2")

    if(require("utils")) {
        message("R history enabled")
        try(loadhistory("~/.Rhistory"))
        .Last <- function() try(savehistory("~/.Rhistory"))
    } else {
        message("R history disabled")
    }
}
