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
#'
#' @examples \dontrun{
#' import_humanitarian_icons()
#' 
#' library(ggplot2)
#' library(humicons)
#' 
#' ggplot(mtcars, aes(mpg, wt)) +
#'     geom_text(family = font_hum, label = get_humicon("car"), size = 5)
#' }
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
