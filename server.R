library("shiny")

# Plotting
library("ggplot2")


# Data Processing
library("data.table")
library("dplyr")
library("stringr")

# Sets working directory to source of file
#setwd("/Users/Sahil/Courses/Coursera/Developing Data Products/Course Project/appdp")

# Load data
forbes_data <- fread("data/ObservationData_mthyecc.csv")

adjustData <- function(data) {
        # Names of data
        data.names <- names(data)
        
        # Set names of data
        setnames(data, data.names, tolower(str_replace_all(data.names, "([ |$|,])", "")))
        
        #select relevant data
        data <- select(data, age, networthb, time)
        
        data$age <- as.numeric(data$age)
        data$networthb <- as.numeric(data$networthb)

        data$age[data$age == 0] <- NA
        data <- arrange(data, desc(networthb))
        data <- na.omit(data)
        # Return data
        return(data)
        
}

forbes.data <- adjustData(forbes_data)

# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output, session) {
        
        
        output$distPlot <- renderPlot({
                
                forbes.data <- filter(forbes.data, time == input$year)[1:input$obs]
                plot <- ggplot(forbes.data, aes(x = age, y = networthb)) + geom_bar(stat = "identity") + xlab("Age in Years") + ylab("Bn Net Worth (US$)")
                plot
#         
        })
})

