library(shiny)
shinyUI(fluidPage(
      titlePanel("Predict Horsepower from cyl"),
      sidebarLayout(
            sidebarPanel(
                  sliderInput("slidercyl", "What is the cyl of the car?", 1, 8, value = 3),
                  checkboxInput("showModel1", "Show/Hide Model 1", value = TRUE),
                  checkboxInput("showModel2", "Show/Hide Model 2", value = TRUE)
            ),
            # ...
            # ...
            mainPanel(
                  plotOutput("plot1"),
                  h3("Predicted Horsepower from Model 1:"),
                  textOutput("pred1"),
                  h3("Predicted Horsepower from Model 2:"),
                  textOutput("pred2")
            )
      )
))
