# M. Yeung
# Shiny Server for Predicting Billions spent on eating out

library(shiny)
library(gdata) 
# From United States Department of Agriculture
# https://www.ers.usda.gov/data-products/food-expenditures.aspx
food <- read.csv("EatingOut.csv", na.strings=c("NA","#DIV/0!",""))

shinyServer(function(input, output) {

  model1 <- lm(Eating ~ Year, data = food)
  model2 <- lm(Eating ~ poly(Year,3), data = food)

  model1pred <- reactive({
    yearInput <- input$sliderYear
    predict(model1, newdata = data.frame(Year = yearInput))
  })
  
  model2pred <- reactive({
    yearInput <- input$sliderYear
    predict(model2, newdata = data.frame(Year = yearInput))
  })  
  
  
  output$plot1 <- renderPlot({
    yearInput <- input$sliderYear

    plot( food$Year, food$Eating, xlab = "Years", 
         ylab = "Eating Out (Billions Dollars)", bty = "n", pch = 16,
         xlim = c(1920, 2020), ylim = c(0,700))

    # Draw linear regression line
    if(input$showModel1){
      abline(model1, col = "red", lwd = 2)
      points(yearInput, model1pred(), col = "red", pch = 16, cex = 2)
    }
    # Draw polynomial regression line
    if(input$showModel2){
      model2lines <- predict(model2, newdata = data.frame(
        Year = 1935:2014, Yearsp = ifelse(1935:2014 - 2000 > 0, 1935:2014 - 2000, 0)
      ))
      lines(1935:2014, model2lines, col = "green", lwd = 4)
      points(yearInput, model2pred(), col = "green", pch = 16, cex = 2)
    }
    
    legend(x= "topleft", y=0.92, c("Linear Regression (Exp=1)", "Polynomial Regression (Exp=3)"), pch = 16, 
           col = c("red", "green"), bty = "n", cex = 1.2)
  },height = 400, width = 600)
  
  output$pred1 <- renderText({
    model1pred()
  })
  
  output$pred2 <- renderText({
    model2pred()
  })
  
  output$actual <- renderText({
    yearInput <- input$sliderYear
    food$Eating[yearInput-1934]
  })
})