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
countrySelectionUI <- function(id) {
  ns <- NS(id)
  tagList(
    selectInput(ns("select_country"), "Select Country", choices = unique(df$Country), multiple = TRUE, selectize = TRUE),
    gt::gt_output(ns("country_table"))
  )
}

#' @export
countrySelection <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$country_table <- gt::render_gt({
      req(input$select_country)
      df_selected <- df %>%
        filter(Country %in% input$select_country) %>%
        select(Country, `Agricultural Land( %)`, `Land Area(Km2)`, `Armed Forces size`,  CPI, `CPI Change (%)`, `Forested Area (%)`, `Gasoline Price`, GDP, `Gross primary education enrollment (%)`, `Gross tertiary education enrollment (%)`) %>%
        slice_head(n = 10) # Select top 10 countries

      # Create gt table
df_selected %>%
  gt() %>%
  data_color(
    columns = c(`Agricultural Land( %)`, `Land Area(Km2)`, `Armed Forces size`, CPI, `CPI Change (%)`, `Forested Area (%)`, `Gasoline Price`, GDP, `Gross primary education enrollment (%)`, `Gross tertiary education enrollment (%)`),
  )
    })
  })
}