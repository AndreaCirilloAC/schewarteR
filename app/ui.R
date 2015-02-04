
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(qcc)
shinyUI(fluidPage(

  tags$head(
    tags$style(HTML("
                    @import url('//fonts.googleapis.com/css?family=Lobster|Cabin:400,700');
                    "))
    ),
  # Application logo and title
  br(),
  fluidRow(
    column(1,img(src = "logo.png", height = 70, width = 70)),
    column(11,h1("SchewarteR", style = "font-family: 'Helvetica Neue', cursive;
                 font-weight: 500; line-height: 1.1; 
                 color: #55ACEE;"))),
  br(),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(width=3,
                 h3("instructions"),
                 
                 p ("SchewarteR is a lean shiny app that let's you obtaain a schewart control chart from a custom
                    population you can load using the 'load file' control below."),
         
                 br(),
                 h6("find out more on the Schewart Control Chart and this app on"),
                 
                 HTML("<a href='https://andreacirilloblog.wordpress.com/' style='color:    #55ACEE'
                      target='_blank'>[andreacirillo's blog]</a>"),                
                 br(),
                 #file input widget to let user load his own data set
                 
                 fileInput("records", h4("load file"),
                           multiple = FALSE)
                 ),
    
    mainPanel(
      h3("does it work?"),
      tableOutput("table")
    )
                 )
))
