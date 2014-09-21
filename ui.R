## I have created an App where you can get the scatterplot between some of the
## variables in the mtcars dataset. You can also give an input value for the
## x variable and the server.R will predict the y-value using linear
## regression between the Y and X variables.

library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Prediction using MTCars Dataset"),
  sidebarPanel(
    h6('Select the Y and the X variable and the app will generate a scatterplot'),
    
    ## Radio button to select the Y-variable, default is Miles/gallon
    
    radioButtons("yField", "Select the Y variable:",
                 c("Miles/gallon (mpg)" = "mpg",
                   "Displacement cu.in. (disp)" = "disp",
                   "Gross horsepower (hp)" = "hp",
                   "Weight lb/1000 (wt)" = "wt"),
                 selected = "mpg"),
    
    ## Radio button to select the X-variable, default is Weight
    
    radioButtons("xField", "Select the X variable:",
                 c("Miles/gallon (mpg)" = "mpg",
                   "Displacement cu.in. (disp)" = "disp",
                   "Gross horsepower (hp)" = "hp",
                   "Weight lb/1000 (wt)" = "wt"),
                 selected = "wt"),
    
    ## Text box to get the x-variable's value. Default value is 0
    textInput('xValue', 'Enter a x-value in the textbox on the bottom left and a Y value will be calculated (optional)',
              value=0),
    
    ## Hit Submit button to generate plot and predicted value
    h6('You must click the Submit button every time to generate scatterplot or Y value'),
    submitButton('Submit')
  ),
  mainPanel(
     plotOutput('newHist'),
     h5("Your Y variable is "),textOutput('yField'),
     h5("Your X variable is "),textOutput('xField'),
     h5('The predicted Y value is'),textOutput('yValue')     
  )
))
