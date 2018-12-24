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

