#' UN OCHA Visual Unit Color Palettes
#' 
#'A collection of colour palettes used by UN OCHA Visual Unit. The list of available palettes is:
#' blue
#' gray
#' tan
#' red
#' 
#'@examples
#'
#' # Make an x-y plot using the Namatjira palette
#' library(tidyverse)
#' df <- data.frame(x = rnorm(100, 0, 20), 
#'           y = rnorm(100, 0, 20), 
#'           cl = sample(letters[1:8], 100, replace=TRUE))
#' ggplot(df, aes(x, y, colour=cl, shape=cl)) + 
#'   geom_point(size=4) + scale_colour_ocha() +
#'   theme_bw() + theme(aspect.ratio=1) 
#' 
#' # Make a histogram using the McCrea Collins Street palette
#' ggplot(df, aes(x, fill=cl)) + geom_histogram() +
#'   scale_fill_ocha(palette = "tan")
#'
#' @export
ocha_palettes <-
  list(blue =
         c(blue1 = "#003469",
           blue2 = "#026CB6",
           blue3 = "#659AD2",
           blue4 = "#95B6DF",
           blue5 = "#C7D6EE",
           blue6 = "#E1E8F6",
           blue7 = "#EEF3FA"),
       gray =
         c(gray1 = "#231F20",
           gray2 = "#595959",
           gray3 = "#999999",
           gray4 = "#CCCCCC",
           gray5 = "#E6E6E6",
           gray6 = "#F2F2F2",
           gray7 = "#F8F8F9"),
      red =
         c(red1 = "#8B010E",
           red2 = "#BA1222",
           red3 = "#D14E4F",
           red4 = "#EAA3A5",
           red5 = "#FDE8E6",
           red6 = "#FEF2F1",
           red7 = "#FEF9FB"),
       tan =
         c(tan1 = "#A0441E",
           tan2 = "#C95A23",
           tan3 =  "#F47932",
           tan4 = "#FED09E",
           tan5 = "#FFF1E2",
           tan6 = "#FFF8EF",
           tan7 = "#FFFEF9")
      )


#' ocha palette with ramped colours
#'
#' @param palette Choose from 'ocha_palettes' list
#'
#' @param alpha transparency
#'
#' @param reverse If TRUE, the direction of the colours is reversed.
#'
#' @examples
#' library(scales)
#' show_col(ocha_pal("blue")(7))
#'
#' filled.contour(volcano, color.palette = ocha_pal(), asp = 1)
#' 
#' @export
ocha_pal <- function(palette = "blue", alpha = 1, reverse = FALSE) {
  pal <- ocha_palettes[[palette]]
  if (reverse) {
    pal <- rev(pal)
  }
  colorRampPalette(pal, alpha)
}
