box::use(
  shiny[...],
  bslib[...],
  bsicons[...],
  readr[...],
  dplyr[...],
  echarts4r[...]
)

box::use(
  app/logic/birthratebarplot[create_birth_rate_chart]
)

# UI function
#' @export
birth_rate_chart_UI <- function(id) {
  ns <- NS(id)
  
  bslib::card(
    echarts4r::echarts4rOutput(ns("birth_rate_chart"))
  )
}

# Server function
#' @export
birth_rate_chart_server <- function(id, df) {
  moduleServer(id, function(input, output, session) {
    output$birth_rate_chart <- echarts4r::renderEcharts4r({
      create_birth_rate_chart(df)
    })
  })
}