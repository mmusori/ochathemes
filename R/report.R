#' OCHA digital report R markdown template
#'
#' Template for creating an R markdown based OCHA digital report with an emphasis on typography
#'
#' @inheritParams rmarkdown::html_document
#' @param extra_dependencies,... Additional function arguments to pass to the
#'        base R Markdown HTML output formatter
#' @export
report <- function(number_sections = FALSE,
                   fig_width = 7,
                   fig_height = 5,
                   fig_retina = if (!fig_caption) 2,
                   fig_caption = FALSE,
                   dev = 'png',
                   smart = TRUE,
                   self_contained = TRUE,
                   highlight = "pygment",
                   mathjax = "default",
                   extra_dependencies = NULL,
                   css = NULL,
                   includes = NULL,
                   keep_md = FALSE,
                   lib_dir = NULL,
                   md_extensions = NULL,
                   pandoc_args = rmarkdown::pandoc_variable_arg("logo", system.file("rmarkdown", "templates", "report", "resources", "img", "logo-unocha.svg", package = "ochathemes")),
                   ...) {

    theme <- NULL
    template <- "default"
    code_folding <- "none"
    
    dep <- htmltools::htmlDependency(
                          name = "report",
                          version = "0.1.0",
                          system.file("rmarkdown", "templates", "report", "resources", package = "ochathemes"),
                          stylesheet = "report.css"
                      )

    extra_dependencies <- append(extra_dependencies, list(dep))
    
    args <- c("--standalone")
    args <- c(args, "--section-divs")
    args <- c(
        args, "--template",
        rmarkdown::pandoc_path_arg(
                       system.file("rmarkdown", "templates", "report", "base.html", package = "ochathemes")
                   )
    )

    if (number_sections) args <- c(args, "--number-sections")

    for (css_file in css) args <- c(args, "--css", rmarkdown::pandoc_path_arg(css_file))
    
    pre_processor <- function(metadata, input_file, runtime,
                              knit_meta, files_dir, output_dir) {

        if (is.null(lib_dir)) lib_dir <- files_dir

        args <- c()
        args <- c(
            args,
            rmarkdown:::pandoc_html_highlight_args(template, highlight)
        )
        args <- c(
            args,
            rmarkdown::includes_to_pandoc_args(
                           includes = includes, filter = if (identical(runtime, "shiny")) normalize_path else identity
                       )
        )
        args
    }
    
    rmarkdown::output_format(
                   knitr = rmarkdown::knitr_options_html(
                                          fig_width, fig_height, fig_retina, keep_md, dev
                                      ),
                   pandoc = rmarkdown::pandoc_options(
                                           to = "html",
                                           from = rmarkdown::from_rmarkdown(fig_caption, md_extensions),
                                           args = args
                                       ),
                   keep_md = keep_md,
                   clean_supporting = self_contained,
                   pre_processor = pre_processor,
                   base_format = rmarkdown::html_document_base(
                                                smart = smart,
                                                theme = theme,
                                                self_contained = self_contained,
                                                lib_dir = lib_dir,
                                                mathjax = mathjax,
                                                template = template,
                                                pandoc_args = pandoc_args,
                                                extra_dependencies = extra_dependencies,
                                                bootstrap_compatible = TRUE,
                                                ...
                                            )
               )
}
