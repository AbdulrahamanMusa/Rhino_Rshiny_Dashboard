box::use(
  shiny[...],
  bslib[...],
  bsicons[...],
  readr[...],
  dplyr[...],
)

box::use(
app/logic/readdatafile[df],
app/logic/model[modal],
app/logic/aboutPage[aboutPageUI,aboutPageServer],
  app/view[valueBoxUI,valueBoxServer,birth_rate_chart_UI, birth_rate_chart_server,fartility_rate_chart_UI, fartility_rate_chart_server,infant_mortality_chart_UI, infant_mortality_server,maternal_mortality_chart_UI, maternal_mortality_server,countryProfileUI,countryProfileServer,countrySelectionUI,countrySelection,countrySelectionUIb,countrySelectionb,co2_emission_plot_UI,co2_emission_plot_ServerModule]
)

#' @export
ui <- function(id) {
  ns <- NS(id)

  # Load the data
  df <- read_csv("world-data-2023.csv")

  page_navbar(
    theme = bs_theme(preset = "cerulean"),
    nav_spacer(),
    title = "Global Health and Economic Indicators Dashboard",
     fillable_mobile = TRUE,
    sidebar = accordion(
      conditionalPanel(
        condition = "true",
        titlePanel("A-musa-DataSolution"),
        HTML(markdown::markdownToHTML(text =
                                        "Hello Visitor Welcome to A-musa Data Solution", # nolint
                                      fragment.only = TRUE))
      ),
      accordion_panel(
        "Info",
        class = "bslib-page-dashboard",
           actionButton("modal", "info"),

      ),
    ),
    nav_panel(actionButton('health','Health-Indicies'), # nolint: quotes_linter.
              valueBoxUI("valueBox1"), 
              accordion(
                accordion_panel(
                  "Global-Health Indices",
                  navset_card_underline(
                    title = "Indicators at a glance",
                    nav_panel("Visual",
                    layout_columns(
                      birth_rate_chart_UI("chart1"),
                      fartility_rate_chart_UI("chart2"),
                    ),
                    hr(),
                    layout_columns(
                      infant_mortality_chart_UI("chart3"),
                      maternal_mortality_chart_UI("chart4")
                     ),
                    ),
                  )
                ),
                accordion_panel(
                  "Country profile",
                  navset_card_underline(
                    title = "Select Country from the Filter Option to display country profile",
                    nav_panel("Description",
                    countryProfileUI("countryProfile")
                    ),
                    
                  )
                ),

            )
    ),

    nav_panel(actionButton('economic','Socio-Economic-Indicies'),
      
       navset_card_underline(
                    title = "Socio-Economic at a glance",
                           nav_panel("CO2_emission",
                     card(full_screen = TRUE,
                      co2_emission_plot_UI("co2_emission_plot"),
        HTML(markdown::markdownToHTML(text ="CN =China, ED=Germany, IN=India, ID=Indonesia, IR=Iran, JP=Japan, RU=Russia, SA=Saudi Arabia, KR=South Korea, US=United States",fragment.only = TRUE)),

                      )
                  ),
                    nav_panel("Country-Statistics-A",
                    card(full_screen = TRUE,
                    countrySelectionUI("countrySelection1")
                  )),
                     nav_panel("Country-Statistics-B",
                     card(full_screen = TRUE,
                     countrySelectionUIb("countrySelectionb")
                  )),
                  
       )
    ),
    nav_panel(actionButton('about','About'),
          aboutPageUI("aboutPage")
    ),
    nav_item(
      input_dark_mode(id = "dark_mode", mode = "light"),
    ),

  )
}
#' @export
server <- function(input, output, session) {
  valueBoxServer("valueBox1", selectedCountry = reactive({input$selectedCountry}))
  birth_rate_chart_server("chart1", df)
  fartility_rate_chart_server("chart2", df)
  infant_mortality_server("chart3", df)
  maternal_mortality_server("chart4", df)
  countryProfileServer("countryProfile")
  countrySelection("countrySelection1")
  countrySelectionb("countrySelectionb")
  co2_emission_plot_ServerModule("co2_emission_plot", df)
  modal()
  aboutPageServer("aboutPage")



}