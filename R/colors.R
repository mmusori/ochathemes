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
         c(blue1 = "#0B2641",
           blue2 = "#144372",
           blue3 = "#1F69B3",
           un_blue = "#418FDE",
           blue5 = "#82B5E9",
           blue6 = "#D4E5F7",
           blue7 = "#E9F2FB"),
       gray =
         c(gray1 = "#262626",
           gray2 = "#4D4D4D",
           gray3 = "#737373",
           neutral_color = "#999999",
           gray5 = "#BFBFBF",
           gray6 = "#E6E6E6",
           gray7 = "#F2F2F2"),
       red =
         c(red1 = "#42130A",
           red2 = "#8B2715",
           red3 = "#CD3A1F",
           secondary_color = "#E56A54",
           red5 = "#EFA497",
           red6 = "#F8D8D3",
           red7 = "#FCECE9"),
       brown =
         c(brown1 = "#452707",
           brown2 = "#965410",
           brown3 = "#DB7B18",
           brown4 = "#ECA154",
           brown5 = "#F4C799",
           brown6 = "#FAE6D1",
           brown7 = "#FCF2E8"),
       yellow_green =
         c(yellow_green1 = "#40420A",
           yellow_green2 = "#989F18",
           yellow_green3 = "#D5DE26",
           yellow_green4 = "#E2E868",
           yellow_green5 = "#EFF2AA",
           yellow_green6 = "#F7F8D3",
           yellow_green7 = "#FBFCE9"),
       green =
         c(green1 = "#2A3D10",
           green2 = "#557C1F",
           green3 = "#7FB92F",
           green4 = "#A4D65E",
           green5 = "#C6E69B",
           green6 = "#E8F5D6",
           green7 = "#F4FAEB"),
       cyan =
         c(cyan1 = "#0F3D3A",
           cyan2 = "#248F88",
           cyan3 = "#34CCC1",
           cyan4 = "#71DBD4",
           cyan5 = "#AEEAE6",
           cyan6 = "#D6F5F3",
           cyan7 = "#EBFAF9"),      
       violet =
         c(violet1 = "#23133A",
           violet2 = "#462472",
           violet3 = "#6937AC",
           violet4 = "#9063CD",
           violet5 = "#B99DE0",
           violet6 = "#E4D8F3",
           violet7 = "#F1ECF9"),
       tan =
         c(tan1 = "#372C15",
           tan2 = "#907337",
           tan3 = "#BE9C56",
           tan4 = "#D3BC8D",
           tan5 = "#E8DCC4",
           tan6 = "#F1E9DA",
           tan7 = "#F8F4EC")
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
