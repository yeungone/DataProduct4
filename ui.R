# M. Yeung
# Shiny UI for Eating Out

library(shiny)

shinyUI(fluidPage(
  titlePanel("Predicting Billions of dollar spent on eating out by year (USA)"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderYear", "What year do you want to predict?", 1935, 2014, value = 2000),
      checkboxInput("showModel1", "Show/Hide Linear Regression (Exp=1)", value = TRUE),
      checkboxInput("showModel2", "Show/Hide Polynomial Regression (Exp=3)", value = TRUE)
    ),
    mainPanel(
      plotOutput("plot1"),
      h3("Actual (Billions $):"),
      textOutput("actual"),
      h3("Prediction (Billions $):Linear regression (Exp n=1):"),
      textOutput("pred1"),
      h3("Prediction (Billions $):Polynomial regression (Exp n=3):"),
      textOutput("pred2")
    )
  )
))