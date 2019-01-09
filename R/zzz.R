.onAttach <- function(libname, pkgname) {

  if (.Platform$OS.type == "windows")  {
    if (interactive()) packageStartupMessage("Registering Windows fonts with R")
    extrafont::loadfonts("win", quiet = TRUE)
  }

  if (getOption("ochathemes.loadfonts", default = FALSE)) {
    if (interactive()) packageStartupMessage("Registering PDF & PostScript fonts with R")
    extrafont::loadfonts("pdf", quiet = TRUE)
    extrafont::loadfonts("postscript", quiet = TRUE)
  }

  fnt <- extrafont::fonttable()
  if (!any(grepl("Crimson|Humanitarian|Roboto[ ]Condensed|Roboto[ ]Slab", fnt$FamilyName))) {
    packageStartupMessage("NOTE: Either Crimson Text, Roboto Condensed, Roboto Slab or Humanitarian-Icons-v02 fonts are required to use these themes.")
    packageStartupMessage("      Please use ochathemes::import_[font_name] to install the missing fonts")
  } 
    
}
