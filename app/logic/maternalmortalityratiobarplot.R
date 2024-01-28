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
#   want to create barplot that will display top ten countries with highest maternal mortality ratio
create_maternal_mortality_ratio_chart <- function(df) {    
  maternal_mortality_ratio <- df %>% 
    arrange(desc(`Maternal mortality ratio`)) %>% 
    .[1:10, ] %>% 
    select(Country, `Maternal mortality ratio`) %>%
    mutate(`Maternal mortality ratio` = as.numeric(`Maternal mortality ratio`)) %>%
    echarts4r::e_charts(Country) %>%
    echarts4r::e_bar(`Maternal mortality ratio`) %>%
    echarts4r::e_flip_coords() %>%
    echarts4r::e_tooltip(trigger = "axis") %>%
    echarts4r::e_y_axis(name = "Maternal mortality ratio") %>%
    echarts4r::e_x_axis(name = "Country", axisLabel = list(interval = 0)) %>%
    echarts4r::e_title("Top 10 Countries with Highest Maternal mortality ratio") %>%
    e_color("white") %>%
    echarts4r::e_legend(FALSE) %>%
    echarts4r::e_grid(left = "15%", right = "4%", bottom = "4%", contain_label = TRUE) %>%
    echarts4r::e_visual_map(
      `Maternal mortality ratio`,
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
  
  return(maternal_mortality_ratio)
}
