library(shiny)
library(plotly)
library(dplyr)



#read the csv data
fileUrl <- dataUrl <- "https://raw.githubusercontent.com/Chinasa1/DataProductsWeek4/master/historical_pop.csv"
fileName <- "historical_pop.csv"

#download the data if it does not exists
if(! file.exists(fileName)){
  download.file(dataUrl, destfile = fileName, method = "curl")
}
#Load the data
popData <- read.csv(fileName)


#=============================================
# SERVER
#=============================================
shinyServer( function(input, output, session){

  output$table <- renderDataTable(popData)
  #Render the plot
  output$plot <- renderPlotly({
    #get the range f years
    iMinYear <- input$year[1]
    iMaxYear <- input$year[2]

    #Filter the table to get the range data
    tempData <- popData %>% filter(Year >=iMinYear & Year <= iMaxYear)

    #Get the population of the minimum and maximum years
    maxPop <- popData[popData$Year == iMaxYear, 2]
    minPop <- popData[popData$Year == iMinYear, 2]

    #format the yearly difference of the population
    diff <- format(maxPop-minPop, decimal.mark=",",  big.mark=", ",small.mark=".", small.interval=3)
    message <- paste("From <b>", iMinYear, "</b> to <b>", iMaxYear, "</b>, there were<b>",diff,"</b> population more in the world.
                     without counting the dead people" )
    #render the message
    output$text <- renderUI({
      HTML(message)
    })


    #Plot the bar chart of the evolution
    key <- row.names(tempData)
    plot_ly(tempData, x=~Year,
            y=~World_Population,
            type = 'bar',
            key=key,
            name = "World population evolution"
            )%>%
      layout(dragmode = "select")

  })

  output$hover <- renderPrint({
    d <- event_data("plotly_hover")
    if(is.null(d)){
      "Hover on a point"
    }else{
      d
    }
  })

  #Output data of the selected aera
  output$brush <- renderPrint({
    d <- event_data("plotly_selected")
    if (is.null(d)) "Click and drag (i.e., select/lasso) appear here (double-click to clear)" else d
  })

})
