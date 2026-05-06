library(shiny)
library(shinydashboard)
library(plotly)
library(leaflet)
library(dplyr)

# Example dataset
set.seed(10)
health <- data.frame(
  region = rep(c("Africa","Asia","Europe","Americas"), each=12),
  month = rep(month.abb, 4),
  cases = round(runif(48, 200, 1000)),
  vaccinations = round(runif(48, 50, 400)),
  lat = c(-1.2, 34.5, 48.8, -15),
  lon = c(36.8, 104.2, 2.3, -47)
)

ui <- dashboardPage(
  dashboardHeader(title="Global Health Surveillance"),
  dashboardSidebar(selectInput("region","Select Region",choices=unique(health$region))),
  dashboardBody(
    fluidRow(
      box(plotlyOutput("trendPlot"), width=6),
      box(leafletOutput("map"), width=6)
    )
  )
)

server <- function(input, output, session){
  data_filt <- reactive(health %>% filter(region==input$region))
  
  output$trendPlot <- renderPlotly({
    plot_ly(data_filt(), x=~month, y=~cases, type="bar", name="Cases") %>%
      add_trace(y=~vaccinations, name="Vaccinations", type="scatter", mode="lines+markers") %>%
      layout(title="Cases vs Vaccinations", barmode="group")
  })
  
  output$map <- renderLeaflet({
    leaflet(data_filt()) %>%
      addProviderTiles(providers$CartoDB.Positron) %>%
      addMarkers(~lon, ~lat, popup=~paste("Region:", region))
  })
}
shinyApp(ui, server)
