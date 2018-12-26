#'R Markdown Format for Dashboards based on Flexdashboard
#'
#'Format for converting an R Markdown document to a grid oriented dashboard
#'layout. The dashboard flexibly adapts the size of it's plots and htmlwidgets
#'to its containing web page.
#'
#'@inheritParams rmarkdown::html_document
#'
#'@param fig_retina Scaling to perform for retina displays (defaults to 2).
#'  Note that for flexdashboard enabling retina scaling provides for both
#'  crisper graphics on retina screens but also much higher quality
#'  auto-scaling of R graphics within flexdashboard containers.
#'
#'@param fig_mobile Create an additional rendering of each R graphics figure
#'  optimized for rendering on mobile devices oriented in portrait mode.
#'  If \code{TRUE}, creates a figure which is 3.75 x 4.80 inches wide;
#'  if \code{FALSE}, create no additional figure for mobile devices;
#'  if a numeric vector of length 2, creates a mobile figure with the
#'  specified width and height.
#'
#'@param favicon Path to graphic to be used as a favicon for the dashboard.
#' Pass \code{NULL} to use no favicon.
#'
#'@param social Specify a character vector of social sharing services to
#'  automatically add sharing links for them on the \code{navbar}. Valid values
#'  are "twitter", "facebook", "google-plus", "linkedin", and "pinterest" (more
#'  than one service can be specified).
#'
#'@param source_code URL for source code of dashboard (used primarily for
#'  publishing flexdashboard examples). Automatically creates a \code{navbar}
#'  item which links to the source code.
#'
#'@param orientation Determines whether level 2 headings are treated as
#'  dashboard rows or dashboard columns.
#'
#'@param vertical_layout Vertical layout behavior: "fill" to vertically resize
#'  charts so they completely fill the page; "scroll" to layout charts at their
#'  natural height, scrolling the page if necessary.
#'
#'@param storyboard \code{TRUE} to use a storyboard layout scheme that places
#'  each dashboard component in a navigable storyboard frame. When a
#'  storyboard layout is used the \code{orientation} and \code{vertical_layout}
#'  arguments are ignored. When creating a dashbaord with multiple pages you
#'  should apply the `{.storyboard}` attribute to individual pages rather
#'  than using the global \code{storyboard} option.
#'
#'@param highlight Syntax highlighting style. Supported styles include
#'  "default", "tango", "pygments", "kate", "monochrome", "espresso", "zenburn",
#'  and "haddock". Pass NULL to prevent syntax highlighting.
#'
#'@param devel Enable development mode (used for development of the format
#'  itself, not useful for users of the format).
#'
#'@param ... Unused
#'
#'@details See the flexdashboard website for additional documentation:
#'  \href{http://rmarkdown.rstudio.com/flexdashboard/}{http://rmarkdown.rstudio.com/flexdashboard/}
#'
#' @examples
#' \dontrun{
#'
#' library(rmarkdown)
#' library(flexdashboard)
#' library(ochathemes)
#'
#' # simple invocation
#' render("dashboard.Rmd", dashboard())
#'
#' }
#'
#'
#'@export
dashboard <- function(fig_width = 6.0,
                      fig_height = 4.8,
                      fig_retina = 2,
                      fig_mobile = TRUE,
                      dev = "png",
                      smart = TRUE,
                      self_contained = TRUE,
                      favicon = NULL,
                      social = NULL,
                      sources = NULL,
                      feedback_email = NULL,
                      source_code = NULL,
                      orientation = c("columns", "rows"),
                      vertical_layout = c("fill", "scroll"),
                      storyboard = FALSE,
                      highlight = "default",
                      mathjax = "default",
                      extra_dependencies = NULL,
                      css = NULL,
                      includes = NULL,
                      lib_dir = NULL,
                      md_extensions = NULL,
                      pandoc_args = NULL,
                      devel = FALSE,
                      ...) {

    favicon <- system.file("rmarkdown", "templates", "dashboard", "resources", "img", "favicon.ico", package = "ochathemes")
    logo <- system.file("rmarkdown", "templates", "dashboard", "resources", "img", "logo-unocha.png", package = "ochathemes")
    template <- system.file("rmarkdown", "templates", "dashboard", "default.html", package = "ochathemes")
    extra_css <- system.file("rmarkdown", "templates", "dashboard", "resources", "dashboard.css", package = "ochathemes")   
    extra_pandoc_args <- c("--variable", paste0("feedback-email=", feedback_email), "--variable", paste0("sources=", sources))
    css <- c(css, extra_css)
    
    r <- flexdashboard::flex_dashboard(
                            fig_width = fig_width,
                            fig_height = fig_height,
                            fig_retina = fig_retina,
                            fig_mobile = fig_mobile,
                            dev = dev,
                            smart = smart,
                            self_contained = self_contained,
                            favicon = favicon,
                            logo = logo,
                            source_code = source_code,
                            orientation = orientation,
                            vertical_layout = vertical_layout,
                            storyboard = storyboard,
                            highlight = highlight,
                            mathjax = mathjax,
                            extra_dependencies = extra_dependencies,
                            css = css,
                            includes = includes,
                            lib_dir = lib_dir,
                            md_extensions = md_extensions,
                            pandoc_args = pandoc_args,
                            devel = devel,
                          ...)

    id <- grep("^--template", r$pandoc$args)
    r$pandoc$args[id + 1] <- template
    r$pandoc$args <- c(pandoc_args, extra_pandoc_args, r$pandoc$args)
    r
}

