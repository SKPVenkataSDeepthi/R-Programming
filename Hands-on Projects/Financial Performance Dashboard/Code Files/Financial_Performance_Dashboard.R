library(shiny)
library(shinydashboard)
library(plotly)
library(dplyr)

finance <- data.frame(
  quarter = rep(paste0("Q",1:4," 2025"), each=3),
  department = rep(c("Sales","R&D","Marketing"), 4),
  revenue = round(runif(12, 1e5, 3e5),0),
  expense = round(runif(12, 5e4, 2e5),0)
)

ui <- dashboardPage(
  dashboardHeader(title="Corporate Financial Dashboard"),
  dashboardSidebar(selectInput("dept","Department",choices=unique(finance$department))),
  dashboardBody(
    fluidRow(
      box(width=6,plotlyOutput("revPlot")),
      box(width=6,plotlyOutput("expPlot"))
    )
  )
)

server <- function(input, output, session){
  df <- reactive(finance %>% filter(department==input$dept))
  
  output$revPlot <- renderPlotly({
    plot_ly(df(),x=~quarter,y=~revenue,type="bar",name="Revenue",color=I("#2b8cbe")) %>%
      layout(title="Quarterly Revenue")
  })
  
  output$expPlot <- renderPlotly({
    plot_ly(df(),x=~quarter,y=~expense,type="scatter",mode="lines+markers",color=I("#de2d26")) %>%
      layout(title="Quarterly Expenses")
  })
}
shinyApp(ui, server)
