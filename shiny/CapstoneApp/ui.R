
suppressWarnings(library(shiny))
suppressWarnings(library(markdown))
shinyUI(navbarPage("Final Project for Coursera Capstone",
                   tabPanel("Predict Next Word",
                            HTML("<strong>Author: Ben Straub </strong>"),
                            br(),
                            HTML("<strong>Date: 03/25/2018</strong>"),
                            br(),
                      
                            # Sidebar
                            sidebarLayout(
                              sidebarPanel(
                                helpText("Enter word or words to begin"),
                                textInput("inputString", "Enter word here",value = ""),
                                br(),
                                br(),
                                br(),
                                br()
                              ),
                              mainPanel(
                                h2("Your Next Word"),
                                verbatimTextOutput("prediction"),
                                strong("Input:"),
                                tags$style(type='text/css', '#text1 {background-color: rgba(455,255,0,0.50); color: blue;}'), 
                                textOutput('text1'),
                                br(),
                                strong("N-gram used:"),
                                tags$style(type='text/css', '#text2; color: green;}'),
                                textOutput('text2')
                              )
                            )
                            
                   ),
                   tabPanel("About Process and Model",                            mainPanel(
                             
                              includeMarkdown("about.md")
                            )
                   )
)
)