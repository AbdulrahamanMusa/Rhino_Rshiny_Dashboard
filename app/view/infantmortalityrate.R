box::use(
  shiny[...],
  bslib[...],
  bsicons[...],
  readr[...],
  dplyr[...],
  echarts4r[...]
)

box::use(
  app/logic/infantmortalityratebarplot[infant_mortality_chart]
)

# UI function
#' @export
infant_mortality_chart_UI <- function(id) {
  ns <- NS(id)
  page_fillable(
    card(echarts4r::echarts4rOutput(ns("chart2")))
  )
}
#' @export
infant_mortality_server <- function(id, df) {
  moduleServer(id, function(input, output, session) {
    output$chart2 <- echarts4r::renderEcharts4r({
      infant_mortality_chart(df)
    })
  })
}
