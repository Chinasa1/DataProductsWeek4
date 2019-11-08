library(shiny)
library(plotly)

fluidPage(
    #title Panel
    titlePanel("World population evolution"),

    #FluidRow to create a fixed page web site [ 3  |    9     ]
    fluidRow(
      #=======================================
      #       LEFT SIDEBAR
      #=======================================
      #column of 3 rows for the left sidebard
      column(3,
            wellPanel(
              h4("Filter"),

              sliderInput("year", "Year", 1951, 2019, value = c(1970, 2019),
                          sep = "")
              )#wellPanel
        ),#column


      #=======================================
      #       MAIN PAGE
      #=======================================
      #column of 9 rows for the main page
      column(9,
             #the plot
             plotlyOutput("plot"),
             verbatimTextOutput("hover"),
             verbatimTextOutput("brush"),
             #result panel
             wellPanel(
               h4("Yearly diffirence"),

               htmlOutput("text")

            ),#wellPanel
            wellPanel(
              h4("World population historical data"),
              dataTableOutput('table')
            )

      )#Column
    )

)


