library(shiny)
models <- c("Solow", "Ramsey", "Shone", "Goodwin")
# Define UI for application that draws a histogram
navbarPage(collapsible=TRUE,"FamilaR with economic dynamics",
    tabPanel("Home","Welcome in FamiliaR with economic dynamics, a project born to help with the study of economic dynamics models"),
    tabPanel("Models", 
             sidebarLayout(
               sidebarPanel(width=2,"Select your model and the value of each parameters.",
                   selectInput("model", "Model:", models),
                   conditionalPanel(condition="input.model=='Solow'",
                                    sliderInput("k", label = "Chart length (k):", min = 1, max = 100, value = 20, step = 1),
                                    sliderInput("s", label = "Saving rate:", min = 0, max = 1, value =0.2, step = 0.01),
                                    sliderInput("a", label = "Elasticty:", min = 0, max = 1, value =0.3, step = 0.01),
                                    sliderInput("d", label = "Depreciation:", min = 0, max = 1, value =0.02, step = 0.01),
                                    sliderInput("n", label = "Population growth rate:", min = 0, max = 1, value =0.5, step = 0.01),
                                    sliderInput("t", label = "Time", min = 0, max = 100, value =20, step = 5)
                                    ),
                   conditionalPanel("input.model == 'Ramsey'",
                                    sliderInput("tr", label = "Time", min = 0, max = 200, value = 50, step = 5),
                                    sliderInput("cr", label = "Consumption, dc/dt",min = 0, max = 5, value = 3, step = 0.05),
                                    sliderInput("kr", label = "Capital, dk/dt", min = 0, max = 50, value = 30, step = 0.5),
                                    sliderInput("thetar", label = "Elasticity, tendendy of consumers to smooth their consumption over time:", min = 0, max = 1, value = 0.03, step = 0.01),
                                    sliderInput("rhor", label = "Rate at which consumers discount their future consumption", min = 0, max = 1, value = 0.2, step = 0.01),
                                    sliderInput("deltar", label = "Depreciation rate of capital", min = 0, max = 1, value = 0.1, step = 0.01),
                                    sliderInput("alphar", label = "Elasticity parameter (measuring the responsiveness of the output production to changes in the input capital):", min = 0, max = 1, value = 0.3, step = 0.01),
                                    
                   ),
                   conditionalPanel("input.model == 'Goodwin'",
                                    sliderInput("alphag", label = "Technical progress growth rate", min = 0, max = 1, value = 0.0196, step = 0.0001),
                                    sliderInput("betag", label = "Labour force growth rate",min = 0, max = 1, value = 0.016, step = 0.0001),
                                    sliderInput("gammag", label = "Real Phillips curve intercept", min = 0, max = 1, value = 0.13, step = 0.0001),
                                    sliderInput("rhog", label = "Real Phillips curve slope", min = 0, max = 1, value = 0.96, step = 0.0001),
                                    sliderInput("sigmag", label = "Capital-output ratio", min = 0, max = 5, value = 3, step = 0.0001),
                                    sliderInput("tg", label = "Time", min=1, max=1000, value=130, step=1)
                   ),
                   conditionalPanel("input.model == 'Shone'",
                                    sliderInput("c0s", label = "Initial level of cons.", min = 0, max = 50, value = 10, step = 1),
                                    sliderInput("i0s", label = "Initial level of invest.", min = 0, max = 50, value = 5, step = 1),
                                    sliderInput("Gs", label = "Government spendings", min = 0, max = 50, value = 5.5, step = 1),
                                    sliderInput("bs", label = "b par. in the IS",  min = 0, max = 1, value = 0.8, step = 0.05),
                                    sliderInput("ks", label = "k par. in the LM", min = 0, max = 1, value = 0.05, step = 0.01),
                                    sliderInput("ds", label = "d parameter in the LM", min = 0, max = 1, value = 0.05, step = 0.01),
                                    sliderInput("hs", label = "h par. in the i", min = 0, max = 1, value = 0.1, step = 0.01),
                                    sliderInput("taus", label = "Exogenous tax rate", min = 0, max = 1, value = 0.25, step = 0.01),
                                    sliderInput("alphas", label = "Weight par. Philips curve", min = 0, max = 1, value = 0.1, step = 0.01),
                                    sliderInput("betas", label = "Beta parameter", min = 0, max = 10, value = 1, step = 0.5),
                                    sliderInput("mdots", label = "Dynamics of the M. market", min = 0, max = 0.5, value = 0.01, step = 0.01),
                                    sliderInput("yns", "Long-term output", min = 0, max = 10, value = 1, step = 0.5)
                   )),
               mainPanel(
                       fixedRow(plotOutput("plot",width = "400px")
                       ),
                fluidRow(column(5,conditionalPanel("input.model == 'Solow'",
                                                   sliderInput("initial_values", label="initial values", min=1, max=5, value=1, step=1),
                                                   conditionalPanel("input.initial_values == 1",
                                                                    numericInput('aa1', 'a', 1 )),
                                                   conditionalPanel("input.initial_values == 2",
                                                                    fillRow(numericInput('aa2', 'a', 1),
                                                                            numericInput('bb2', 'b', 1))),
                                                   conditionalPanel("input.initial_values == 3",
                                                                    fillRow(numericInput('aa3', 'a', 1),
                                                                            numericInput('bb3', 'b', 1),
                                                                            numericInput('cc3', 'c', 1))),
                                                   conditionalPanel("input.initial_values == 4",
                                                                    fillRow(
                                                                      numericInput('aa4', 'a', 1),
                                                                      numericInput('bb4', 'b', 1),
                                                                      numericInput('cc4', 'c', 1),
                                                                      numericInput('dd4', 'd', 1))
                                                   ),
                                                   conditionalPanel("input.initial_values == 5",
                                                                    fillRow(
                                                                      numericInput('aa5', 'a', 1),
                                                                      numericInput('bb5', 'b', 1),
                                                                      numericInput('cc5', 'c', 1),
                                                                      numericInput('dd5', 'd', 1),
                                                                      numericInput('ee5', 'e', 1))
                                                   ),
                                                   actionButton("go_sol","(Re)start Numeric Simulation Solow", style="background-color: #ec7063 ;
                              border-radius: 10px !important; border: none; position:absolute; bottom: 5px;
                              margin: auto;"
                                                   )),
                                  ######################################################
                                  #Conditional panel for initial values for Goodwin model#
                                  #####################################################
                                  #y0 <- matrix(c(0.2, 1, 0.6, 1, 1.1, 1), ncol = 2, nrow = 3, byrow = TRUE)
                                  conditionalPanel("input.model == 'Goodwin'",
                                                   sliderInput("initial_values_g",
                                                                   label="initial values",
                                                                   min=1,
                                                                   max=3,
                                                                   value=1,
                                                                   step=1),
                                                   conditionalPanel("input.initial_values_g == 1",
                                                                        numericInput('gaa1', 'a', 0.2 ),
                                                                        numericInput('gbb1', 'b', 1)),
                                                   conditionalPanel("input.initial_values_g == 2",
                                                                        column(6,
                                                                               numericInput('gaa2', 'a1', 0.2),
                                                                               numericInput('gbb2', 'b1', 1)),
                                                                        column(6,
                                                                               numericInput('gcc2', 'a2',0.6),
                                                                               numericInput('gdd2', 'b2',1))),
                                                   conditionalPanel("input.initial_values_g == 3",
                                                                        column(4,
                                                                               numericInput('gaa3', 'a1', 0.2),
                                                                               numericInput('gbb3', 'b1', 1)),
                                                                        column(4,
                                                                               numericInput('gcc3', 'a2', 0.6),
                                                                               numericInput('gdd3', 'b2', 1)),
                                                                        column(4,
                                                                               numericInput('gee3', 'a3', 0.8),
                                                                               numericInput('gff3', 'b3', 1))),
                                                   actionButton("go_good",
                                                                "(Re)start Numeric Simulation",
                                                                style="background-color: #ec7063 ; border-radius: 10px !important; border: none; display:center-align; bottom: 5px; margin: auto;"), align = "center"
                                                   , style = "margin-bottom: 10px;"
                                                   , style = "margin-top: -10px;"),
                                  ######################################################
                                  #Conditional panel for initial values for Ramsey model#
                                  #####################################################
                                  conditionalPanel("input.model == 'Ramsey'",
                                                   fluidPage(
                                                     fluidRow(
                                                       sliderInput("initial_values_r",
                                                                   label="initial values",
                                                                   min=1,
                                                                   max=3,
                                                                   value=1,
                                                                   step=1)
                                                     ),
                                                     fluidRow(
                                                       conditionalPanel("input.initial_values_r == 1",
                                                                        numericInput('raa1', 'a', 0.2 ),
                                                                        numericInput('rbb1', 'b', 1)),
                                                       conditionalPanel("input.initial_values_r == 2",
                                                                        column(6,
                                                                               numericInput('raa2', 'a1', 0.2),
                                                                               numericInput('rbb2', 'b1', 1)),
                                                                        column(6,
                                                                               numericInput('rcc2', 'a2',0.6),
                                                                               numericInput('rdd2', 'b2',1))),
                                                       conditionalPanel("input.initial_values_r == 3",
                                                                        column(4,
                                                                               numericInput('raa3', 'a1', 0.2),
                                                                               numericInput('rbb3', 'b1', 1)),
                                                                        column(4,
                                                                               numericInput('rcc3', 'a2', 0.6),
                                                                               numericInput('rdd3', 'b2', 1)),
                                                                        column(4,
                                                                               numericInput('ree3', 'a3', 0.8),
                                                                               numericInput('rff3', 'b3', 1)))),
                                                     fluidRow(
                                                       actionButton("go_ram",
                                                                    "(Re)start Numeric Simulation for RCK model", 
                                                                    style="background-color: #ec7063 ; border-radius: 10px !important; border: none; position:absolute; bottom: 5px; margin: auto;")))),
                                  ######################################################
                                  #Conditional panel for initial values for Shone model#
                                  #####################################################
                                  conditionalPanel("input.model == 'Shone'",
                                                   fluidPage(
                                                     fluidRow(
                                                       sliderInput("initial_values_s",
                                                                   label="initial values",
                                                                   min=1,
                                                                   max=3,
                                                                   value=1,
                                                                   step=1)
                                                     ),
                                                     fluidRow(
                                                       conditionalPanel("input.initial_values_s == 1",
                                                                        numericInput('saa1', 'a', 0.05 ),
                                                                        numericInput('sbb1', 'b', 0.15)),
                                                       conditionalPanel("input.initial_values_s == 2",
                                                                        column(6,
                                                                               numericInput('saa2', 'a1', 0.05),
                                                                               numericInput('sbb2', 'b1', 0.15)),
                                                                        column(6,
                                                                               numericInput('scc2', 'a2',0.1),
                                                                               numericInput('sdd2', 'b2',0.2))),
                                                       conditionalPanel("input.initial_values_r == 3",
                                                                        column(4,
                                                                               numericInput('saa3', 'a1', 0.05),
                                                                               numericInput('sbb3', 'b1', 0.15)),
                                                                        column(4,
                                                                               numericInput('scc3', 'a2', 0.1),
                                                                               numericInput('sdd3', 'b2', 0.2)),
                                                                        column(4,
                                                                               numericInput('see3', 'a3', 0.8),
                                                                               numericInput('sff3', 'b3', 1)))),
                                                     fluidRow(
                                                       actionButton("go_shone",
                                                                    "(Re)start Numeric Simulation for Shone model", 
                                                                    style="background-color: #ec7063 ; border-radius: 10px !important; border: none; position:absolute;  bottom: 5px; margin: auto;") )))
                ),column(5,"ciao"), 
                       ))
               )
             )
)
