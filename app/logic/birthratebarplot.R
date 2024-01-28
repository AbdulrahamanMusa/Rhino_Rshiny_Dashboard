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
create_birth_rate_chart <- function(df) {    
  birth_rate <- df %>% 
    arrange(desc(`Birth Rate`)) %>% 
    .[1:10, ] %>% 
    select(Country, `Birth Rate`) %>%
    mutate(`Birth Rate` = as.numeric(`Birth Rate`)) %>%
    echarts4r::e_charts(Country) %>%
    echarts4r::e_bar(`Birth Rate`) %>%
    echarts4r::e_flip_coords() %>%
    echarts4r::e_tooltip(trigger = "axis") %>%
    echarts4r::e_y_axis(name = "Birth Rate") %>%
    echarts4r::e_x_axis(name = "Country", axisLabel = list(interval = 0)) %>%
    echarts4r::e_title("Top 10 Countries with Highest Birth Rate") %>%
    e_color("#04155ef1") %>%
    echarts4r::e_legend(FALSE) %>%
    echarts4r::e_grid(left = "15%", right = "4%", bottom = "4%", contain_label = TRUE) %>%
    echarts4r::e_visual_map(
      `Birth Rate`,
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
  
  return(birth_rate)
}
