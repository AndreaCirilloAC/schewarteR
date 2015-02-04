
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(qcc)

data(pistonrings)

demo <- qcc.groups(pistonrings$diameter, pistonrings$sample)

shinyServer(function(input, output) {

  data                   <- reactive({
   if (is.null(input$records$name)){
     demo }else{
                              read.csv(input$records$datapath,header=TRUE,sep=";")}
  })
  schew_plot            <- renderPlot({
   qcc <- qcc(data(), type="xbar")
    plot(qcc)
  })
table <- renderTable({frame <- data.frame("A"=c(1,2),"B"=c("x","Y"))
                      frame})
})
