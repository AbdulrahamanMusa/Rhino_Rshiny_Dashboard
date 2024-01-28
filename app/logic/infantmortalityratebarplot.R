box::use(
  shiny[...],
  bslib[...],
  bsicons[...],
  readr[...],
  dplyr[...],
  echarts4r[...]
)
box::use(
  app/logic/readdatafile[df]
)




#' @export
infant_mortality_chart <- function(df) {    
  fertility_rate <- df %>% 
    arrange(desc(`Infant mortality`)) %>% 
    .[1:10, ] %>% 
    select(Country, `Infant mortality`) %>%
    mutate(`Infant mortality` = as.numeric(`Infant mortality`)) %>%
    echarts4r::e_charts(Country) %>%
    echarts4r::e_bar(`Infant mortality`) %>%
    echarts4r::e_flip_coords() %>%
    echarts4r::e_tooltip(trigger = "axis") %>%
    echarts4r::e_y_axis(name = "Infant mortality") %>%
    echarts4r::e_x_axis(name = "Country", axisLabel = list(interval = 0)) %>%
    echarts4r::e_title("Top 10 Countries with Highest Infant mortality") %>%
    e_color("white") %>%
    echarts4r::e_legend(FALSE) %>%
    echarts4r::e_grid(left = "15%", right = "4%", bottom = "4%", contain_label = TRUE) %>%
    echarts4r::e_visual_map(
      `Infant mortality`,
      min = 0,
      max = 50,
      text = c("High", "Low"),
      calculable = TRUE,
      orient = "horizontal",
      left = "center",
      bottom = "15%"
    ) %>%   
    e_toolbox_feature(feature = "saveAsImage") %>%
    e_theme("white")
  
  return(fertility_rate)
}