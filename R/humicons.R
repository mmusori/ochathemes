#' Import Humanitarian icons v2 for use in charts
#'
#' Humanitarian icons v2 are made by OCHA visual unit
#'
#' There is an option `ochathemes.loadfonts` which -- if set to `TRUE` -- will
#' call `extrafont::loadfonts()` to register non-core fonts with R PDF & PostScript
#' devices. If you are running under Windows, the package calls the same function
#' to register non-core fonts with the Windows graphics device.
#'
#' @md
#' @note This will take care of ensuring PDF/PostScript usage. The location of the
#'   font directory is displayed after the base import is complete. It is highly
#'   recommended that you install them on your system the same way you would any
#'   other font you wish to use in other programs.
#' @export
import_humanitarian_icons <- function() {

  hum_font_dir <- system.file("fonts", "humanitarian-icons", package = "ochathemes")

  suppressWarnings(suppressMessages(extrafont::font_import(hum_font_dir, prompt=FALSE)))

  message(
    sprintf(
      "You will likely need to install these fonts on your system as well.\n\nYou can find them in [%s]",
      hum_font_dir)
  )

}

#' @rdname HumantarianIcons
#' @md
#' @title Humanitarian Icons font name R variable aliases
#' @description `font_hum` == "`Humanitarian Icons`"
#' @format length 1 character vector
#' @export
font_hum <- "Humanitarian-Icons-v02"


## library(showtext)
## library(ggplot2)
## load("/home/ahmadou/Devel/R/ochathemes/data/humicons_data.RData")
## to_unicode <- function(name) {
##     df <- humicons_data
##     icon_list <- df$name
##     if(!(all(name %in% icon_list))) {
##         stop(paste0("Icon '", name, "' not found in OCHA Humaniarian Icons v02. Did you mean '", icon_list[which.min(adist(name, icon_list))], "'?"))
##     }
##     intToUtf8(strtoi(df$code[df$name %in% name], 16L))
## }


## ## #' @importFrom showtext fond_add
## ## font_add(family = "Humanitarian-Icons-v02",
## ##          regular = icon_system_file("fonts/humanitarian-icons/Humanitarian-Icons-v02.ttf"))
## font_add(family = "Humanitarian-Icons-v02",
##          regular = "/home/ahmadou/Devel/R/ochathemes/inst/fonts/humanitarian-icons/Humanitarian-Icons-v02.ttf")

## showtext_auto()

## code2int <- function(x) intToUtf8(strtoi(x, 16L))

## set.seed(123)
## ## Manually open a graphics device if you run this code in RStudio
## ## x11()
## hist(rnorm(1000), breaks = 30, col = "steelblue", border = "white",
##      main = "Histogram of Normal Random Numbers", xlab = "", ylab = "Frequency")
## text(2, 70, to_unicode(c("Urban", "Car")), family = "Humanitarian-Icons-v02", cex = 2.5, col = "steelblue")




## set.seed(123)
## ## Manually open a graphics device if you run this code in RStudio
## ## x11()
## hist(rnorm(1000), breaks = 30, col = "steelblue", border = "white",
##      main = "Histogram of Normal Random Numbers", xlab = "", ylab = "Frequency")
## text(2, 70, "\uEA10 \uE940", family = "Humanitarian-Icons-v02", cex = 2.5, col = "steelblue")

## humicon::hi("Food-Security")
## int <- strtoi("EA10", 16L)



## library(ggplot2)
## car <- code2int(humicons_data$code[humicons_data$name == "Car"])
## car

## View(humicons_data)

## ggplot(mtcars, aes(mpg, wt)) +
##     geom_text(family = "Humanitarian-Icons-v02", label = car, size = 5)

