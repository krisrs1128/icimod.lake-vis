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
    base_url <- "https://glaciersblob.blob.core.windows.net/lakes/le7-2015/splits/train/images"
    output$glacier_plot <- renderPlot({
        path <- sprintf("%s/%s-%s.tif.tar.gz", base_url, input$glacier_id, input$timepoint)
        unlink("tmp", recursive = TRUE)
        dir.create("tmp")
        system(sprintf("curl %s > tmp/tmp.tar.gz", path))
        system("cd tmp; tar -zxvf tmp.tar.gz")
        f <- list.files("tmp", "*tif", full = TRUE)
        print(f)
        ggRGB(brick(f[1]))
    })
})
