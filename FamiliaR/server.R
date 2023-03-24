library(shiny)

# Define server logic required to draw a histogram
function(input, output) {
  output$plot <- renderPlot(plot(1:5),res=96)
}