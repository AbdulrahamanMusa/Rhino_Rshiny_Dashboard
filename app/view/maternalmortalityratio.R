box::use(
  shiny[...],
  bslib[...],
  bsicons[...],
  readr[...],
  dplyr[...],
  echarts4r[...]
)

box::use(
  app/logic/maternalmortalityratiobarplot[create_maternal_mortality_ratio_chart]
)

# UI function
#' @export
maternal_mortality_chart_UI <- function(id) {
  ns <- NS(id)
  page_fillable(
    card(echarts4r::echarts4rOutput(ns("chart3")))
  )
}
#' @export
maternal_mortality_server <- function(id, df) {
  moduleServer(id, function(input, output, session) {
    output$chart3 <- echarts4r::renderEcharts4r({
      create_maternal_mortality_ratio_chart(df)
    })
  })
}
