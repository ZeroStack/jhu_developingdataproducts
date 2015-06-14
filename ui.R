

library(shiny)
library(ggplot2)


# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(
        
        # Application title
        headerPanel("Forbes Billionaires Age Distribution: 2015 & 2014"),
        
        # Sidebar with a slider input for number of observations
        sidebarPanel(
                radioButtons("year", 
                            "Year:", 
                            list("2015": "2015",
                                 "2014": "2014"))
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
                plotOutput("distPlot")
        )
))
