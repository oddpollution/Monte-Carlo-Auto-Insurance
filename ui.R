#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(plyr)
library(dplyr)
library(tidyverse)
library(haven)
library(DT)
library(shiny)
library(scales)
library(plotly)

rsconnect::setAccountInfo(name='seagullskf', token='27BCA58DBD656C7F1947E0E894040163', secret='An3MvIR4w5K0ZUlIt2XHtdgyiDEz7lCe/S6eNCv/')

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("THE MONTE CARLO SIMULATOR"),
    img(src = "logo.png", height = 100, width = 100, align = "bottom-right"),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            numericInput("VIGS", "Vigentes", 1994768,
                         min = 0, max = 100000000, step = 1),
            numericInput("PER", "Periodo (Em meses)", 12,
                         min = 1, max = 12, step = 1),
            numericInput("PR", "Premio Medio", 1000,
                         min = 0, max = 100000000, step = 1),
            numericInput("VPR", "Desvio Padrao Premio Medio", 300,
                         min = 0, max = 100000000, step = 1),
            numericInput("SN", "Sinistro Medio", 600,
                         min = 0, max = 100000000, step = 1),
            numericInput("TX", "Taxa de Risco", 0.01,
                         min = 0, max = 100, step = 0.001),
            numericInput("PP", "Perda Parcial", 0.01,
                         min = 0, max = 100, step = 0.001),
            numericInput("PT", "Perda Total", 0.01,
                         min = 0, max = 100, step = 0.001),
            numericInput("RB", "Roubo", 0.01,
                         min = 0, max = 100, step = 0.001),
            numericInput("FT", "Furto", 0.01,
                         min = 0, max = 100, step = 0.001),
            numericInput("SIM", "nº de Simulações", 10000,
                         min = 0, max = 1000000, step = 100),
            actionButton("submit","calcular")
            ),

        # Show a plot of the generated distribution
        mainPanel("Tabela",
                  fluidRow(dataTableOutput("FTX")),
                  fluidRow(column(6, plotlyOutput("PLOTFPP")),
                  column(6, plotlyOutput("PLOTFPT"))),
                  fluidRow(column(6, plotlyOutput("PLOTFRB")),
                  column(6, plotlyOutput("PLOTFFT"))),
                  fluidRow(column(6, plotOutput("PLOTPR")),
                  column(6, plotOutput("PLOTSN")))
        )
    )
))
