box::use(
  shiny[...],
  bslib[...],
  bsicons[...],
  dplyr[...],
  gt[...],
)

box::use(
  app/logic/readdatafile[df]
)

#' @export
countrySelectionUIb <- function(id) {
  ns <- NS(id)
  tagList(
    selectInput(ns("select_country"), "Select Country", choices = unique(df$Country), multiple = TRUE, selectize = TRUE),
    gt::gt_output(ns("country_table"))
  )
}

#' @export
countrySelectionb <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$country_table <- gt::render_gt({
      req(input$select_country)
      df_selected2 <- df %>%
        filter(Country %in% input$select_country) %>%
  select(Country, `Life expectancy`, `Minimum wage`, `Physicians per thousand`, Population, `Population: Labor force participation (%)`, `Tax revenue (%)`, `Total tax rate`, `Unemployment rate`, Urban_population) %>%
  slice_head(n = 10) # Select top 10 countries

# Create gt table
df_selected2 %>%
  gt() %>%
  data_color(
    columns = c(`Life expectancy`, `Minimum wage`, `Physicians per thousand`, Population, `Population: Labor force participation (%)`, `Tax revenue (%)`, `Total tax rate`, `Unemployment rate`, Urban_population),
  )
    })
  })
}