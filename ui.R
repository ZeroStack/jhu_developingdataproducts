

library(shiny)
library(ggplot2)


# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(
        
        # Application title
        headerPanel("Forbes Billionaires Age Distribution: 2015 & 2014"),
        
        # Sidebar with a slider input for number of observations
        sidebarPanel(
                sliderInput("obs", "Number of Individuals from Highest",
                            min = 0, max = 3471, value = 3471),
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
