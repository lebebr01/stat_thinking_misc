#' Theme for the Statistical Thinking Text
#'
#' Theme created specifically for the statistical thinking text.
#'
#' @inheritParams ggplot2::theme_grey()
#' @importFrom ggplot2 theme_minimal
#' @export
#' @examples
#' ggplot(mtcars, aes(x = wt, y = mpg, colour = factor(gear))) +
#'  geom_point() +
#'  facet_wrap(~am) +
#'  geom_smooth(method = "lm", se = FALSE) +
#'  theme_statthinking()
theme_statthinking <- function(base_size = 12, base_family = 'sans') {

  (ggplot2::theme_minimal(base_size = base_size, base_family = base_family) +
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
       panel.border = element_blank(),
       strip.background = element_rect(linetype = 0,
                                       fill = 'gray88')
     ))
}
