### set locales
tmp = Sys.setlocale("LC_MESSAGES", "en_GB.UTF-8")
tmp = Sys.setlocale("LC_CTYPE", "en_GB.UTF-8")
rm(tmp)

#options(repos = c(CRAN = "http://cran.r-mirror.de"))
#options(BioC_mirror = "http://bioconductor.statistik.tu-dortmund.de")
options(browserNLdisabled = TRUE)

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
  options(pager = "vim -c 'set ft=rdoc' -")
  options(editor = 'vim -c "set ft=r"')
  options(menu.graphics = FALSE)

  require("vimcom")
  require("setwidth")
#  require("BBmisc")

  if(require("utils")) {
    message("R history enabled")
    try(loadhistory("~/.Rhistory"))
    .Last <- function() try(savehistory("~/.Rhistory"))
  } else {
    message("R history disabled")
  }
}
