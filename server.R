
library(shiny)
library(datasets)

data(mtcars)

# lmfit <- lm(mpg~.,data=mtcars)
# slmfit <- step(lmfit)
lmfit <- lm(mpg~am+qsec+wt,data=mtcars)

predict_mpg <- function(iwt,iqsec,iam) {
        lmfit$coef[1] + (lmfit$coef[2] * as.numeric(iam)) + (lmfit$coef[3] * iqsec) + (lmfit$coef[4] * iwt)
}

shinyServer(
        function(input, output) {
                output$owt <- renderPrint({input$iwt})
                output$oqsec <- renderPrint({input$iqsec})
                output$oam <- renderPrint({input$iam})
                output$ompg <- renderPrint({
                        predict_mpg(input$iwt,input$iqsec,input$iam)
                        })
        }
)
