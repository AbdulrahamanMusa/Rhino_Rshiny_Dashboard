
box::use(
  shiny[...],
  bslib[...],
  bsicons[...],
  readr[...],
  dplyr[...],
)

#' @export
modal <- function() {   
 showModal(modalDialog(
      title = "About this project",
      "This Shiny app,'Global Health and Economic Indicators Dashboard', provides a comprehensive analysis of various global indicators, with a special focus on CO2 emissions and health indices. 

        The dataset includes information about different countries, such as CO2 emissions, maternal mortality ratio, fertility rate, infant mortality, and birth rate. These indicators are crucial for understanding the impact of climate change and health conditions across the globe.
        
        CO2 emissions data can help us understand a country's contribution to global warming, a key factor in climate change. High levels of CO2 emissions are often associated with industrial activities and can have significant impacts on the environment and human health.
        
        This App was designed to help researchers, policymakers, students, and anyone interested in global trends to understand the data better and make informed decisions. 

        Please navigate through the app to explore more",
        h4(class = "github-link", "github-link"),
        a(id = "github-link",
            href = "https://github.com/AbdulrahamanMusa",
            target = "_blank",
            img(class = "author-img",
                src = "https://avatars.githubusercontent.com/u/105715152?v=4")),

      easyClose = TRUE,
      footer = modalButton("Close")
    ))
}