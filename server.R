library(shiny)
data(mtcars)

# Helper function to do return predicted Y-variable's value
prediction <-function(y,x,xcap) {
  regr<-lm(mtcars[[y]]~mtcars[[x]])
  regr$coefficients[[1]]+as.numeric(xcap)*regr$coefficients[[2]]  # alpha + x*beta
}

shinyServer(
  function(input, output) {
    output$xField <- renderText({input$xField})
    output$yField <- renderText({input$yField})
    output$newHist <- renderPlot({
      # Build the scatterplot and regression line
      plot(mtcars[[input$xField]], mtcars[[input$yField]],
           xlab=input$xField,ylab=input$yField,
           main = "MTCars Scatter plot",pch=19, col="blue")
      abline(lm(mtcars[[input$yField]]~mtcars[[input$xField]]))
    })
    
    # Predict the Y-value using prediction function defined above
    output$yValue<-renderText({prediction(input$yField,input$xField,input$xValue)})
    
  }
)