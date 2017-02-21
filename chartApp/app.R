#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(finalchart)

#jsCode <- "shinyjs.pageCol = function(params){$rendervalue;}"

# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(

   # Application title
   titlePanel("Migration Chart App"),
   # Sidebar with a slider input for number of bins
   sidebarLayout(
      sidebarPanel(
        sliderInput("years",
                    "Number of years:",
                    min = 1990,
                    max = 2010,
                    step = 5,
                    value = 1995)
      ),

      # Show a plot of the generated distribution
      mainPanel(
        finalchartOutput('finalchart', height = '600px' )
      )
   )
)

)

# Define server logic required to draw a histogram
server <- function(input, output) {

   output$finalchart <- renderFinalchart(
                finalchart(json0, year = input$years)
                      )
}


# Run the application
shinyApp(ui = ui, server = server)

