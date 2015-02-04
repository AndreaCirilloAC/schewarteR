
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(qcc)



shinyServer(function(input, output) {
  data(pistonrings)
  diameter <- qcc.groups(pistonrings$diameter, pistonrings$sample)
  print(diameter)
  data                   <- reactive({
    if (is.null(input$records$name)){
      diameter }else{
        diameter
      #  read.csv(input$records$datapath,header=TRUE,sep=";")
      }
  })
  schew_plot            <- renderPlot({
    qcc <- qcc(diameter[1:25,], type="xbar",plot=FALSE)
    print("mah")
    plot(qcc)
  })
  
  output$distPlot <- renderPlot({

    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')

  })

})
