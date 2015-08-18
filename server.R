#Developing Data Products Course Project - August 2015

library(shiny)
library(googleVis)
library(datasets)
library(markdown)
library(dplyr)

# Load the data
USarr <- data.frame(USArrests)
USarr$state <- state.name
crimes <- c('Assault', 'Murder', 'Rape')

# Aggregating crime values
state_totals <- function(df, crimes){
        states <- data.frame(state = state.name)
        
        agg <- df %>% subset(select = colnames(df) %in% crimes) %>%
                group_by(state = states$state)
        
        # Crime sums, removing the state column from computation
        agg <- rowSums(agg[, -ncol(agg)])
}

shinyServer(
        function(input, output, session){
                
                # Render Maps
                        
                # Crime Level by State
                output$crimeLevelByState <- renderGvis({
                        
                        if(is.null(input$crimes)){
                                gvisGeoChart(USarr, options=list(region='US',displayMode='regions',
                                                                resolution='provinces', width=600, height=400))  
                        }
                        else{
                        df <- data.frame(state = state.name, Total=state_totals(USarr, input$crimes))
                        gvisGeoChart(df, 'state', 'Total', colorvar='Total', options=list(region='US',
                                        displayMode='regions', resolution='provinces', width=600, 
                                        height=400, forceIFrame='TRUE', colorAxis="{colors:['#FFFFFF', '#0000FF']}"))
                        }
                })
                
                # Urban Population by State
                output$urbanPopByState <- renderGvis({
                        gvisGeoChart(USarr, 'state', 'UrbanPop', options=list(region='US',
                                displayMode='regions', resolution='provinces', width=600, 
                                height=400, forceIFrame='TRUE', colorAxis="{colors:['#FFFFFF', '#0000FF']}"))  
                }) 
                
                # Data
                output$data <- renderDataTable({
                        USarr})
        }
)