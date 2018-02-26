#' Setup colour palette for ggplot2
#' 
#' @rdname scale_color_ocha
#'
#' @param palette Choose from 'ocha_palettes' list
#' 
#' @param reverse logical, Reverse the order of the colours?
#' 
#' @param alpha transparency
#' 
#' @param discrete whether to use a discrete colour palette
#' 
#' @param ... additional arguments to pass to scale_color_gradientn
#'  
#' @inheritParams viridis::scale_color_viridis
#'
#' @importFrom ggplot2 scale_colour_manual
#'
#' @examples 
#' library(ggplot2)
#' ggplot(mtcars, aes(mpg, wt)) + 
#'   geom_point(aes(colour = factor(cyl))) +     
#'   scale_colour_ocha(palette = "red")
#' ggplot(mtcars, aes(mpg, wt)) + 
#'   geom_point(aes(colour = hp)) +     
#'   scale_colour_ocha(palette = "blue", discrete = FALSE)
#' ggplot(data = mpg) + 
#'   geom_point(mapping = aes(x = displ, y = hwy, color = class)) +
#'   scale_colour_ocha(palette = "gray")
#' ggplot(diamonds) + geom_bar(aes(x = cut, fill = clarity)) +
#'   scale_fill_ocha()
#' @export
#' 
#' @importFrom ggplot2 discrete_scale scale_color_gradientn
scale_color_ocha <- function(..., palette = "blue",
                              discrete = TRUE, alpha = 1, reverse = FALSE) {
   if (discrete) {
       discrete_scale("colour", "ocha", palette=ocha_pal(palette, alpha = alpha, reverse = reverse))
   } else {
       scale_color_gradientn(colours = ocha_pal(palette, alpha = alpha, reverse = reverse, ...)(256))
   }
}

#' @export
#' @rdname scale_color_ocha
scale_colour_ocha <- scale_color_ocha


#' #' Setup fill palette for ggplot2
#'
#' @param palette Choose from 'ocha_palettes' list
#' 
#' @inheritParams viridis::scale_fill_viridis
#' @inheritParams ocha_pal
#' 
#' @param discrete whether to use a discrete colour palette
#' 
#' @param ... additional arguments to pass to scale_color_gradientn
#'
#' @importFrom ggplot2 scale_fill_manual discrete_scale scale_fill_gradientn
#'
#' @export
scale_fill_ocha <- function(..., palette = "blue", 
                              discrete = TRUE, alpha = 1, reverse = TRUE) {
    if (discrete) {
        discrete_scale("fill", "ocha", palette = ocha_pal(palette, alpha = alpha, reverse = reverse))
    }
    else {
        scale_fill_gradientn(colours = ocha_pal(palette, alpha = alpha, reverse = reverse, ...)(256))
    }
}
