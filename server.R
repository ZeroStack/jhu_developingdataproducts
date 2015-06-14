library("shiny")

# Plotting
library("ggplot2")


# Data Processing
library("data.table")
library("dplyr")
library("stringr")

# Sets working directory to source of file
setwd("/Users/Sahil/Courses/Coursera/Developing Data Products/Course Project/app")

# Load data
forbes_data <- fread("data/ObservationData_mthyecc.csv")

adjustData <- function(data) {
        # Names of data
        data.names <- names(data)
        # Set names of data
        setnames(data, data.names, tolower(str_replace_all(data.names, "([ |$|,])", ".")))
        data$age <- as.numeric(data$age)
        data$net.worth...b <- as.numeric(data$net.worth...b)
        data$v8 <- NULL
        data$age[data$age == 0] <- NA
        data <- arrange(data, desc(net.worth...b)) 
        # Return data
        return(data)
        
}

forbes.data <- adjustData(forbes_data)

# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output, session) {
        
        
        output$distPlot <- renderPlot({
                forbes.data <- filter(forbes.data, time == input$year)
                plot <- ggplot(forbes.data, aes(x = age, y = net.worth...b)) + geom_bar(stat = "identity") + xlab("Age in Years") + ylab("Bn Net Worth (US$)")
                plot
#         
        })
})

