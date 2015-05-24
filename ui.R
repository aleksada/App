# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#


shinyUI(
  navbarPage("Large Sample Property of Binomial Distribution",
             tabPanel("Simulation",
                      sidebarPanel(
                        sliderInput('ss', 
                                    'Sample Size:', 
                                    min = 10, 
                                    max = 10000, 
                                    value = 1000),
                        numericInput('p', 
                                     'Probability of Success', 
                                     .5, 
                                     min = .1, 
                                     max = .9, 
                                     step = 0.1),
                        numericInput('n', 
                                     'Number of Trials', 
                                     100, 
                                     min = 100, 
                                     max = 1000, 
                                     step = 100)
                      
                      ),
                      ### Main Panel
                      mainPanel(
                        tabsetPanel(
                          ###Plot the histogram of normal distribution and selected distribution
                          tabPanel("Central Limit Theorem",
                          plotOutput("histo")  
                        ),
                        tabPanel("Law of Large Number",
                        h3('Results of Mean and Variance'),
                        h4('True Mean and Variance'), 
                        verbatimTextOutput("real"),
                        h4('Sample Mean and Variance'), 
                        verbatimTextOutput("mvs")
                        )
                        )
                      )),
              tabPanel("Documents",
                        mainPanel(
                          includeMarkdown("documents.rmd")
                          )
                       )
  )
)