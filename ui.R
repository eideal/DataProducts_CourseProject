#Developing Data Products Course Project - August 2015
# This script provides the user interface definintion for the Shiny web application

shinyUI(
        navbarPage('US State Crime Levels',
                   tabPanel('Maps',
                            sidebarPanel(
                                    checkboxGroupInput('crimes', label = h4('Crime Types'), 
                                                       choices = names(USArrests)[-3])
                            ),
                            
                            mainPanel(
                                    tabsetPanel(
                                            
                                            # State Crime
                                            tabPanel(p(icon('map-marker'),'State Crime'),
                                                        h4('Crime Levels by State'),
                                                        htmlOutput('crimeLevelByState')
                                                     ),
                                            # State Urban Population
                                            tabPanel(p(icon('map-marker'), 'State Urban Population'),
                                                        h4('Percent of Population in Urban Areas'),
                                                        htmlOutput('urbanPopByState')
                                                     ),
                                            # USarr data
                                            tabPanel(p(icon('table'), 'Data'),
                                                     dataTableOutput(outputId='data'))
                                    )
                            )  
                    ),
                   tabPanel('About',
                            mainPanel(
                                    includeMarkdown('projDesc.md')
                            )
                   )
        )
)

