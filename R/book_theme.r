#' Theme for the Statistical Thinking Text
#'
#' Theme created specifically for the statistical thinking text.
#'
#' @inheritParams ggplot2::theme_grey()
#' @importFrom ggplot2 theme_bw theme_grey
#' @importFrom tibble deframe
#' @export
#' @examples
#' ggplot(mtcars, aes(x = wt, y = mpg, colour = factor(gear))) +
#'  geom_point() +
#'  facet_wrap(~am) +
#'  geom_smooth(method = "lm", se = FALSE) +
#'  theme_statthinking()
theme_statthinking <- function(base_size = 12, base_family = 'sans') {
  colors <- tibble::deframe(statthink::bokeh_colorblind)

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
#' @export
bokeh_colorblind_pal <- function() {
  colors <- tibble::deframe(statthink::bokeh_colorblind)
  hex_values <- unname(colors)
  max_colors <- length(hex_values)
  max_val_func <- scales::manual_pal(hex_values)
  attr(max_val_func, "max_n") <- max_colors
  max_val_func
}

#' Bokeh's Colorblind scales
#'
#' Color scales for ggplot2 using the colors from the Bokeh Colorblind Scale.
#'
#' @inheritParams ggplot2::scale_colour_hue
#' @importFrom ggplot2 scale_colour_hue discrete_scale
#' @references https://bokeh.pydata.org/en/latest/docs/reference/palettes.html
#' @rdname scale_bokehcolorblind
#' @export
scale_colour_bokehcolorblind <- function(...) {
  discrete_scale("colour", "bokehcolorblind", bokeh_colorblind_pal(), ...)
}

#' rdname scale_bokehcolorblind
#' @export
scale_color_bokehcolorblind <- scale_colour_bokehcolorblind()

#' rdname scale_bokehcolorblind
#' @export
scale_fill_bokehcolorblind <- function(...) {
  discrete_scale("fill", "bokehcolorblind", bokeh_colorblind_pal(), ...)
}
