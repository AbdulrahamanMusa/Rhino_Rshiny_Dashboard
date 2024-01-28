box::use(
  shiny[...],
  bslib[...],
  bsicons[...],
  readr[...],
  dplyr[...],
)

#' @export
# UI function
aboutPageUI <- function(id) {
  ns <- NS(id)
  
  tabPanel("About",
accordion(
  accordion_panel("About the Project",
HTML(markdown::markdownToHTML(text ="
This Shiny app 'Global Health and Economic Indicators Dashboard', provides a comprehensive analysis of various global indicators, with a special focus on CO2 emissions and health indices. 
The dataset includes information about different countries, such as CO2 emissions, maternal mortality ratio, fertility rate, infant mortality, and birth rate. These indicators are crucial for understanding the impact of climate change and health conditions across the globe.
        CO2 emissions data can help us understand a country's contribution to global warming, a key factor in climate change. High levels of CO2 emissions are often associated with industrial activities and can have significant impacts on the environment and human health.
        Health indices such as the maternal mortality ratio, fertility rate, infant mortality, and birth rate provide insights into the health conditions and quality of healthcare in different countries. These indices can be influenced by various factors, including environmental conditions and climate change.
        The app allows users to explore these indicators in a user-friendly and interactive way. It is designed to help researchers, policymakers, students, and anyone interested in global trends to understand the data better and make informed decisions",fragment.only = TRUE, 
  )),
)),

   
accordion(
  accordion_panel("Dataset Description",
HTML(markdown::markdownToHTML(text ="Country: Name of the country.
Density (P/Km2): Population density measured in persons per square kilometer.
Abbreviation: Abbreviation or code representing the country.
Agricultural Land (%): Percentage of land area used for agricultural purposes.
Land Area (Km2): Total land area of the country in square kilometers.
Armed Forces Size: Size of the armed forces in the country.
Birth Rate: Number of births per 1,000 population per year.
Calling Code: International calling code for the country.
Capital/Major City: Name of the capital or major city.
CO2 Emissions: Carbon dioxide emissions in tons.
CPI: Consumer Price Index, a measure of inflation and purchasing power.
CPI Change (%): Percentage change in the Consumer Price Index compared to the previous year.
Currency_Code: Currency code used in the country.
Fertility Rate: Average number of children born to a woman during her lifetime.
Forested Area (%): Percentage of land area covered by forests.
Gasoline_Price: Price of gasoline per liter in local currency.
GDP: Gross Domestic Product, the total value of goods and services produced in the country.
Gross Primary Education Enrollment (%): Gross enrollment ratio for primary education.
Gross Tertiary Education Enrollment (%): Gross enrollment ratio for tertiary education.
Infant Mortality: Number of deaths per 1,000 live births before reaching one year of age.
Largest City: Name of the country's largest city.
Life Expectancy: Average number of years a newborn is expected to live.
Maternal Mortality Ratio: Number of maternal deaths per 100,000 live births.
Minimum Wage: Minimum wage level in local currency.
Official Language: Official language(s) spoken in the country.
Out of Pocket Health Expenditure (%): Percentage of total health expenditure paid out-of-pocket by individuals.
Physicians per Thousand: Number of physicians per thousand people.
Population: Total population of the country.
Population: Labor Force Participation (%): Percentage of the population that is part of the labor force.
Tax Revenue (%): Tax revenue as a percentage of GDP.
Total Tax Rate: Overall tax burden as a percentage of commercial profits.
Unemployment Rate: Percentage of the labor force that is unemployed.
Urban Population: Percentage of the population living in urban areas.
Latitude: Latitude coordinate of the country's location.
Longitude: Longitude coordinate of the country's location",fragment.only = TRUE, 
  )),p("The data set is the", a(href = "https://www.kaggle.com/datasets/nelgiriyewithana/countries-of-the-world-2023", target = "_blank", "Global Country Information Dataset 2023"), "..."),
)), 

    
accordion(
  accordion_panel("Author",
    HTML(markdown::markdownToHTML(text ="Hello everyone I am Abdulraham A Musa Passionate Data Scientist in the field of Artificial Intelligent (AI) Machine learning and predictive modelling in the Academic, Health and Humanitarian sectors   I have more than 6 years of experience collating primary and secondary data and analyzing and interpreting healthcare data for data-driven decision-making. I have a Proficient knowledge of statistics, research methods, monitoring and evaluation, and analytics. I am adept at receiving and monitoring data from multiple data streams, including Access, web survey platform ODK/Kobotool, DHI2, SQL, Business analytics and external data sources",fragment.only = TRUE, 
)),
    a(id = ns("github-link"), href = "https://github.com/AbdulrahamanMusa", target = "_blank", "GitHub"),
    a(id = ns("author-website-link"), href = "https://am-datasolution.com/", target = "_blank", "Website")
  )),
  )
}

# Server function
#' @export
aboutPageServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    # Server-side logic goes here
  })
}