library(shiny)
library(ggplot2)
absmin_toss = 2
shinyServer(
    
    function(input, output, session) {              
        output$main_plot <- renderPlot({ 
            if (input$submit >=1  ) {
            isolate({
                    counts = input$rep 
                    min_rolls= input$range[1]
                    no_rolls= input$range[2]
                    mynull <- min_rolls
                    main_df <- data.frame("roll_col"= mynull,"x_mean"= mynull)                
                    # We want to roll "min_rolls" , then min_rolls + 1 up until no_rolls so lets say 2 dice, 3 dice to 6  
                    for (rolls in seq(min_rolls,no_rolls)) {
                        # Initialize local vars
                        x_mean<- NULL ; 
                        x_roll <- NULL ;
                        roll_col <- rep(rolls,counts)
                        x_df <- data.frame(roll_col)
                        for (i in 1:counts) {
                            die_roll <- sample(1:6,rolls,replace=T)
                            roll_mean <- mean(die_roll)       
                            # Now we have a vector of size 
                            #         x_roll <- c(die_roll,x_roll)
                            x_mean <- c(roll_mean,x_mean)
                        } 
                        
                        x_df <- cbind(x_df,x_mean)
                        main_df <- rbind(main_df,x_df)
                    }
                    g <- ggplot(data= main_df,aes(x = x_mean)) + geom_bar(aes(fill = roll_col),color=I("black")) + 
                        facet_grid(. ~ roll_col) +xlab ("Dice Rolled")
                    print(g)  

            }                 
            )
        }
        })
    }
    
        
        
)