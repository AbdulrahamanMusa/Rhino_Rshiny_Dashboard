box::use(
  shiny[...],
  bslib[...],
  bsicons[...],
  readr[...],
  dplyr[...]
)


box::use(
  app/logic/readdatafile[df]
)

#' @export
valueBoxUI <- function(id) {
  ns <- NS(id)
  page_fillable(

    selectInput(ns("selectedCountry"), "Select a country:", choices = c("Global", df$Country)),
              uiOutput(ns("valueBoxes"))
  )
}

#' @export
valueBoxServer <- function(id, selectedCountry) {
  moduleServer(id, function(input, output, session) {
    output$valueBoxes <- renderUI({
      if (input$selectedCountry == "Global") {
        # If "Global" is selected, show global values
        countryData <- summarise(df, 
                                 `Birth Rate` = sum(`Birth Rate`, na.rm = TRUE),
                                 `Fertility Rate` = sum(`Fertility Rate`, na.rm = TRUE),
                                 `Infant mortality` = sum(`Infant mortality`, na.rm = TRUE),
                                 `Maternal mortality ratio` = sum(`Maternal mortality ratio`, na.rm = TRUE))
      } else {
        # If a country is selected, show values for that country
        countryData <- df %>% filter(Country == input$selectedCountry)
      }

      tags$div(
        class = "row",
        layout_columns(
          tags$div(
            card(
              class = "col",
              #style = "background-color:#68F7D8;",
              h6(bs_icon("globe"), " Birth Rate"),
              p(countryData$`Birth Rate`)
            )
          ),
          tags$div(
            card(
              class = "col",
              #style = "background-color:#D7BDE2;",
              h5(bs_icon("people"), " Fertility Rate"),
              p(countryData$`Fertility Rate`)
            )
          ),
          tags$div(
            card(
              class = "col",
              #style = "background-color: #EBEFEF;", 
              h6(bs_icon("people-fill"), " Infant Mortality"),
              p(countryData$`Infant mortality`)
            )
          ),
          tags$div(
            card(
              class = "col",
              #style = "background-color: #EBEFEF;", 
              h6(bs_icon("gender-female"), " Maternal-Mortality-Ratio"),
              p(countryData$`Maternal mortality ratio`)
            )
          )
        )
      )
    })
  })
}