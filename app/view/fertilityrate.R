box::use(
  shiny[...],
  bslib[...],
  bsicons[...],
  readr[...],
  dplyr[...],
  echarts4r[...]
)

box::use(
  app/logic/fertilityratebarplot[fartility_rate_chart]
)

# UI function
#' @export
fartility_rate_chart_UI <- function(id) {
  ns <- NS(id)
  page_fillable(
    card(echarts4r::echarts4rOutput(ns("chart1")))
  )
}
#' @export
fartility_rate_chart_server <- function(id, df) {
  moduleServer(id, function(input, output, session) {
    output$chart1 <- echarts4r::renderEcharts4r({
      fartility_rate_chart(df)
    })
  })
}

