#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
    titlePanel("Glacier Lakes"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            shiny::textInput("glacier_id", "Glacier ID", value = "GL083527E28886N"),
            shiny::textInput("timepoint", "Timepoint", value = "20150501")
        ),

        # Show a plot of the generated distribution
        mainPanel(plotOutput("glacier_plot"))
    )
))
