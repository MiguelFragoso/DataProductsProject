library(shiny)

# Define server logic required for my app
shinyServer(function(input, output) {

    selectedData <- reactive({
        iris[, c(input$xCol, input$yCol)]
    })

    numClusters <- reactive({
        kmeans(selectedData(), input$numClusters)
    })

    output$plot1 <- renderPlot({
        #par(mar = c(5.1, 4.1, 1.2, 1))
        if (input$plotType == 1) {
            plot(selectedData(), col = numClusters()$cluster,
                 main="Scatterplot of the X and Y variable selected and the clusters",
                 pch = 20, cex = 3)
            points(numClusters()$centers, pch = 4, cex = 4, lwd = 4)
        } else if (input$plotType == 2) {
            boxplot(selectedData(), col = numClusters()$cluster,
                    main="Boxplot of the X and Y variable selected", pch = 20, cex = 3)
        } else {
            hist( iris[, c(input$xCol)], col = "red", xlab = input$xCol,
                  main="Histogram of the X variable selected" )
        }
    })
})
