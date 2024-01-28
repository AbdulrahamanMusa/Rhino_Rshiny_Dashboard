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
fartility_rate_chart <- function(df) {    
  fertility_rate <- df %>% 
    arrange(desc(`Fertility Rate`)) %>% 
    .[1:10, ] %>% 
    select(Country, `Fertility Rate`) %>%
    mutate(`Fertility Rate` = as.numeric(`Fertility Rate`)) %>%
    echarts4r::e_charts(Country) %>%
    echarts4r::e_bar(`Fertility Rate`) %>%
    echarts4r::e_flip_coords() %>%
    echarts4r::e_tooltip(trigger = "axis") %>%
    echarts4r::e_y_axis(name = "Fertility Rate") %>%
    echarts4r::e_x_axis(name = "Country", axisLabel = list(interval = 0)) %>%
    echarts4r::e_title("Top 10 Countries with Highest Fertility Rate") %>%
    e_color("#04155ef1") %>%
    echarts4r::e_legend(FALSE) %>%
    echarts4r::e_grid(left = "15%", right = "4%", bottom = "4%", contain_label = TRUE) %>%
    echarts4r::e_visual_map(
      `Fertility Rate`,
      min = 0,
      max = 50,
      text = c("High", "Low"),
      calculable = TRUE,
      orient = "horizontal",
      left = "center",
      bottom = "15%"
    ) %>%   
    e_toolbox_feature(feature = "saveAsImage") %>%
    e_theme("yellow")
  
  return(fertility_rate)
}