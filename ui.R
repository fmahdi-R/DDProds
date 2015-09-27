library(shiny)
library(ggplot2)


# Initialize 
absmax_counts <- 5000
absmin_counts <- 100
absmax_rolls <- 12
absmin_rolls <- 1
x_mean<- NULL ; 
x_roll <- NULL ;

# Defaults
min_rolls <- 1
no_rolls <- 6
counts <- 1000


shinyUI(fluidPage(
    titlePanel("Central Limit Theorem"),
    a("Click me to go to Tutorial Page", href = "http://rpubs.com/fmahdi/111518",target="_blank"),
    plotOutput(outputId = "main_plot"),
    hr(),
        fluidRow(
            column(4,            
                   sliderInput("rep", 
                               label = "Number of Repetition:",
                               min = absmin_counts, max = absmax_counts, value = counts, step = 100),
                   helpText('Sets the number of repetitions for each our die rolls')
                   
            ),
            column(4, offset =1,

                sliderInput("range", 
                            label = "Dice to Roll:",
                            min = absmin_rolls, max = absmax_rolls, value = c(min_rolls, no_rolls)),
                helpText('Sets the number of dice to roll, use both sliders to select a range')
            ),
            column(2,
                actionButton("submit","Run Experiment")
            )
        )
        
#         mainPanel(
# #             qplot(x=1)
#             plotOutput(outputId = "main_plot", height = "300px")           )
    
))
