shinyUI(pageWithSidebar(
        headerPanel("Data Product Assignment Yves Boelen"),
        sidebarPanel(
                h3('Prediction Miles per US Gallon'),
                
                h3('Weight', style = "color:blue"),
                sliderInput('iwt', label='Weight (1000 lbs)',
                            min = 0, max = 7, value = 3, step=0.5),
                
                h3('Acceleration', style = "color:blue"),
                sliderInput('iqsec', label = '1/4 mile time', 
                            min = 10, max = 30, value = 20, step = 0.5),
                
                h3('Transmission', style = "color:blue"),
                selectInput('iam', 'Transmission (0 = automatic, 1 = manual)', 
                            choices=c("Automatic" = 0,
                                      "Manual" = 1)),
                submitButton("Predict MPG")
                
        ),
        mainPanel(
                h3('Outputs, after submitting'),
                hr(),
                h4('You entered weight'),
                verbatimTextOutput("owt"),
                h4('You entered acceleration'),
                verbatimTextOutput("oqsec"),
                h4('You entered transmission'),
                verbatimTextOutput("oam"),
                br(),
                br(),
                h4('The predicted mpg is:'),
                verbatimTextOutput("ompg"),
                br(),
                h3('Documentation:', style = "color:red"),
                p('This application uses the mtcars dataset from the datasets library and attempts 
                   to predict the miles per gallon (mpg) from three variables: weight, acceleration 
                   and transmission.  
                   The predictors are shown at the left-hand side. The user of this application can choose 
                   its values. The linear model is made by means of the step() function which uses a stepwise 
                   algorithm to choose the predictors.')
        )
))
