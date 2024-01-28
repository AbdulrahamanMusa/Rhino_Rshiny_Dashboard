box::use(
  shiny[...],
  bslib[...],
  bsicons[...],
 echarts4r[...],
  readr[...],
  dplyr[...]
)



# UI function
#' @export
co2_emission_plot_UI <- function(id) {
  ns <- NS(id)
  echarts4r::echarts4rOutput(ns("co2_plot"))
}

# Server function
co2_emission_plot <- function(input, output, session, df) {
  output$co2_plot <- echarts4r::renderEcharts4r({
    # Select Abbreviation and Co2-Emissions columns
    df_selected <- df %>%
      select(Abbreviation, `Co2-Emissions`)

    # Select top 10 countries with highest Co2-Emissions
    top_countries <- df_selected %>%
      arrange(desc(`Co2-Emissions`)) %>%
      slice_head(n = 10) %>%
      pull(Abbreviation)

    # Filter original data to include only top 10 countries
    df_top_countries <- df_selected %>%
      filter(Abbreviation %in% top_countries)

    # Plot data using echarts4r
    plot <- df_top_countries %>%
      e_charts(Abbreviation) %>%
      e_line(`Co2-Emissions`) %>%
      e_title("Top 10 Countries with highest Co2-Emissions in the world") %>%
      e_x_axis(name = "Country") %>%
      e_x_axis(rotate = 45)
    
    return(plot)
  })
}

#' @export
co2_emission_plot_ServerModule <- function(id, df) {
  moduleServer(id, function(input, output, session) {
    co2_emission_plot(input, output, session, df)
  })
}