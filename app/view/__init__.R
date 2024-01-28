# View: Shiny modules and related code.
# https://go.appsilon.com/rhino-project-structure
#' @export
box::use(
  app/view/valuebox[valueBoxUI,valueBoxServer],
  app/view/birthrate[birth_rate_chart_UI, birth_rate_chart_server],# nolint
  app/view/fertilityrate[fartility_rate_chart_UI, fartility_rate_chart_server],
  app/view/infantmortalityrate[infant_mortality_chart_UI, infant_mortality_server],
  app/view/maternalmortalityratio[maternal_mortality_chart_UI, maternal_mortality_server],
  app/view/countryProfileModule[countryProfileUI,countryProfileServer],
  app/view/table[countrySelectionUI,countrySelection],
  app/view/tableb[countrySelectionUIb,countrySelectionb],
  app/view/Co2EmissionPlotmodule[co2_emission_plot_UI,co2_emission_plot_ServerModule]
 
)