
library(shiny)

palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
          "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))

# Define UI for the application
shinyUI(fluidPage(

    headerPanel('Iris dataset ploting and k-means for the Scatterplot'),
    sidebarPanel(
        h4("Simple Documentation:"),
        p(paste("This app works with the Iris dataset and you can choose",
                "which kind of graph you want to visualize. Additionally you",
                "can choose which are the X and Y variable for the plot from the",
                "Iris dataset. Finally for the Scatterplot you can visualize K-means",
                "algorithm working selecting the number of clusters")),
        selectInput('xCol', 'Select X Variable:', names(iris[, 1:4])),
        selectInput('yCol', 'Select Y Variable:', names(iris[, 1:4]),
                    selected = names(iris)[[2]]),
        numericInput('numClusters', 'Select number of Clusters:', 3,
                     min = 1, max = 9),
        radioButtons("plotType", "Select Plot type:",
                     choices = list("Scatterplot with the clusters" = 1,
                                    "Simple Boxplot" = 2,
                                    "Histogram of the X variable" = 3),
                     selected = 1)
    ),
    mainPanel(
        plotOutput('plot1')
    )
))
