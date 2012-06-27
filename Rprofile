if(interactive()) {
  require(vimcom)
  require(utils)
  require(setwidth)
  require(colorout)
  setOutputColors256(stderr=0)
  try(loadhistory("~/.Rhistory"))
  options(pager = "vim -c 'set ft=rdoc' -")
  options(editor = 'vim -c "set ft=r"')
  options(repos = c(CRAN = "http://mirrors.softliste.de/cran/"))
  sourceBioc <- function() {
    source("http://bioconductor.org/biocLite.R")
    options("BioC_mirror" = "http://bioconductor.statistik.tu-dortmund.de")
  }
  .Last <- function() try(savehistory("~/.Rhistory"))
}
