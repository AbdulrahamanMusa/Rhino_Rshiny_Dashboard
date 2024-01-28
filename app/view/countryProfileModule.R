
box::use(
  shiny[...],
  bslib[...],
  bsicons[...],
  readr[...],
  dplyr[...],
)

box::use(
  app/logic/readdatafile[df]
)

#' @export
countryProfileUI <- function(id) {
  ns <- NS(id)
  tagList(
    selectInput(ns("selected_Country"), "Select a country:", choices = df$Country),
    verbatimTextOutput(ns("countryProfile"))
  )
}

#' @export
countryProfileServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$countryProfile <- renderPrint({
      # Filter the data for the selected country
      countryData <- df %>% filter(Country == input$selected_Country)
      
      # Transpose the data frame to display all columns and their values
      countryData <- t(countryData)
      
      # Print the country profile
      print(countryData)
            })
        })
    }
