#' Theme for the Statistical Thinking Text
#'
#' Theme created specifically for the statistical thinking text.
#'
#' @param base_size The base size of the text passed to ggplot2 theme.
#' @param base_family The base font family to use, passed as a character string.
#' @importFrom ggplot2 theme_bw theme_grey theme element_line element_blank element_rect
#' @importFrom tibble deframe
#' @export
#' @examples
#' library(ggplot2)
#' ggplot(mtcars, aes(x = wt, y = mpg, colour = factor(gear))) +
#'  geom_point() +
#'  facet_wrap(~am) +
#'  geom_smooth(method = "lm", se = FALSE) +
#'  theme_statthinking()
theme_statthinking <- function(base_size = 12, base_family = 'sans') {

  (ggplot2::theme_bw(base_size = base_size, base_family = base_family) +
     theme(
       axis.line.x = element_line(
         colour = "black",
         size = 0.5,
         linetype = "solid"
       ),
       axis.line.y = element_line(
         colour = "black",
         size = 0.5,
         linetype = "solid"
       ),
       panel.grid.minor = element_blank(),
       panel.grid.major.y = element_line(colour = "gray85", linetype = "solid"),
       panel.grid.major.x = element_line(colour = "gray85", linetype = "solid"),
       panel.background = element_blank(),
       #panel.border = element_blank(),
       strip.background = element_rect(linetype = 0,
                                       fill = 'gray88')
     ))
}

#' Bokeh Colorblind scale
#'
#' This is the Bokeh colorblind scale used for the main colors in the text.
#'
#' @references https://bokeh.pydata.org/en/latest/docs/reference/palettes.html
#'
#' @family colour bokeh
#' @importFrom scales manual_pal
#' @importFrom readr read_csv
#' @export
bokeh_colorblind_pal <- function() {
  colors <- tibble::deframe(
    readr::read_csv(system.file('bokeh', 'Bokeh-colorblind.csv',
                                package = 'statthink'))
  )
  hex_values <- unname(colors)
  max_colors <- length(hex_values)
  max_val_func <- scales::manual_pal(hex_values)
  attr(max_val_func, "max_n") <- max_colors
  max_val_func
}

#' Bokeh's Color scales
#'
#' Color scales for ggplot2 using the colors from the Bokeh Colorblind Scale.
#'
#' @inheritParams ggplot2::scale_colour_hue
#' @importFrom ggplot2 scale_colour_hue discrete_scale
#' @references https://bokeh.pydata.org/en/latest/docs/reference/palettes.html
#' @rdname scale_bokeh
#' @export
scale_colour_bokeh <- function(...) {
    ggplot2::discrete_scale("colour", "bokeh", bokeh_colorblind_pal(), ...)
}

#' @rdname scale_bokeh
#' @export
scale_color_bokeh <- scale_colour_bokeh()

#' @rdname scale_bokeh
#' @export
scale_fill_bokeh <- function(...) {
    ggplot2::discrete_scale("fill", "bokeh", bokeh_colorblind_pal(), ...)
}
