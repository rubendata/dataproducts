library(shiny)
shinyServer(function(input, output) {
      model1 <- lm(hp ~ cyl, data = mtcars)
      model2 <- lm(hp ~ I(cyl^3), data = mtcars)
      
      model1pred <- reactive({
            cylInput <- input$slidercyl
            predict(model1, newdata = data.frame(cyl = cylInput))
      })
      
      model2pred <- reactive({
            cylInput <- input$slidercyl
            predict(model2, newdata = data.frame(cyl = cylInput))
      })
      output$plot1 <- renderPlot({
            cylInput <- input$slidercyl

            plot(mtcars$cyl, mtcars$hp, xlab = "Cyl", 
                 ylab = "Horsepower", bty = "n", pch = 16,
                 xlim = c(1,8), ylim = c(0, 350))
            if(input$showModel1){
                  abline(model1, col = "red", lwd = 2)
            }
            if(input$showModel2){
                  model2lines <- predict(model2, newdata = data.frame(
                        cyl = 1:8)
                  )
                  lines(1:8, model2lines, col = "blue", lwd = 2)
            }
            legend(25, 250, c("Model 1 Prediction", "Model 2 Prediction"), pch = 16, 
                   col = c("red", "blue"), bty = "n", cex = 1.2)
            points(cylInput, model1pred(), col = "red", pch = 16, cex = 2)
            points(cylInput, model2pred(), col = "blue", pch = 16, cex = 2)
      })
      
      output$pred1 <- renderText({
            model1pred()
      })
      
      output$pred2 <- renderText({
            model2pred()
      })
})