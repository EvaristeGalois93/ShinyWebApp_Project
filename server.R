#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({

        # set seed
        set.seed(2021-08-31)
        # generate bins based on input$bins from ui.R
        # simulate 40 exponential with 1000 obs each, and stack them in matrix sim_exp
        #n_obs = 1000
        n_sim = 40
        lambda = .5
        sim_exp = NULL
        for (i in 1:input$Observations) sim_exp = c(sim_exp, mean(rexp(n_sim, lambda)))

        # draw the histogram with the specified number of bins
        hist(sim_exp, breaks = n_sim, col = 'darkgray', border = 'white')

    })

})
