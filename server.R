#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

########### Libraries ###########

library(plyr)
library(dplyr)
library(tidyverse)
library(haven)
library(DT)
library(shiny)
library(scales)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    ########### PP ###########
    
    MontePP <- eventReactive(input$submit,{
      withProgress(message = "Gerando IRS", value = 1/13, {
      
        Mandela <- rpois(input$VIGS, input$TX)
        mean <- mean(Mandela)
        sigma <- sd(Mandela)
        
        #colocar distribui??o para adquirir par?metros
        paths <- input$SIM
        count <- input$PER*30
        interval <- input$PER/count
        sample <- matrix(0,nrow=(count+1),ncol=paths)
        sample[1,] <- input$PP
        rnormm <- as.matrix(sapply(1:paths, function(x) rnorm((count+1), mean = 0, sd = 1)))
        
        for(i in 1:paths) {
            for(j in 2:(count+1)) {
              sample[j,i]<-sample[j-1,i]*exp(interval*(mean-((sigma)^2)/2)+((interval)^.5)*rnormm[j-1,i]*sigma) #Expression for Geometric Brownian Motion
            }
        }
#        matplot(sample,main="Perda Parcial",xlab="Time",ylab="Path",type="l")
#        PP <- data.frame("PERDA PARCIAL" = formatC(percent(mean(sample[count+1,])),digits = 6))
        
        return(sample)
        
        })
    })
#    output$FPP <- renderTable({MontePP()}, bordered = TRUE, align = 'c')
#    output$PLOTFPP <- renderPlot({MontePP()})

    ########### PT ###########
    
    MontePT <- eventReactive(input$submit,{
      withProgress(message = "Gerando IRS", value = 1/13, {
      
        Mandela <- rnbinom(input$VIGS, 1, 1-input$TX)
        mean <- mean(Mandela)
        sigma <- sd(Mandela)
        
        #colocar distribui??o para adquirir par?metros
        paths <- input$SIM
        count <- input$PER*30
        interval <- input$PER/count
        sample <- matrix(0,nrow=(count+1),ncol=paths)
        sample[1,] <- input$PT
        rnormm <- as.matrix(sapply(1:paths, function(x) rnorm((count+1), mean = 0, sd = 1)))
        
        for(i in 1:paths) {
            for(j in 2:(count+1)) {
              sample[j,i]<-sample[j-1,i]*exp(interval*(mean-((sigma)^2)/2)+((interval)^.5)*rnormm[j-1,i]*sigma) #Expression for Geometric Brownian Motion
            }
        }
#        matplot(sample,main="Perda Total",xlab="Time",ylab="Path",type="l")
#        PT <- data.frame("PERDA TOTAL" = formatC(percent(mean(sample[count+1,])),digits = 6))  
        
        return(sample)
        
      })
    })
#    output$FPT <- renderTable({MontePT()}, bordered = TRUE, align = 'c')
#    output$PLOTFPT <- renderPlot({MontePT()})
    
    ########### RB ###########
    
    MonteRB <- eventReactive(input$submit,{
      withProgress(message = "Gerando IRS", value = 2/13, {
      
        Mandela <- rnbinom(input$VIGS, 1, 1-input$TX)
        mean <- mean(Mandela)
        sigma <- sd(Mandela)
        
        #colocar distribui??o para adquirir par?metros
        paths <- input$SIM
        count <- input$PER*30
        interval <- input$PER/count
        sample <- matrix(0,nrow=(count+1),ncol=paths)
        sample[1,] <- input$RB
        rnormm <- as.matrix(sapply(1:paths, function(x) rnorm((count+1), mean = 0, sd = 1)))
        
        for(i in 1:paths) {
            for(j in 2:(count+1)) {
              sample[j,i]<-sample[j-1,i]*exp(interval*(mean-((sigma)^2)/2)+((interval)^.5)*rnormm[j-1,i]*sigma) #Expression for Geometric Brownian Motion
            }
        }
#       matplot(sample,main="Roubo",xlab="Time",ylab="Path",type="l")
#       RB <- data.frame("ROUBO" = formatC(percent(mean(sample[count+1,])),digits = 6))
       
       return(sample)
       
      })
    })
#    output$FRB <- renderTable({MonteRB()}, bordered = TRUE, align = 'c')
#    output$PLOTFRB <- renderPlot({MonteRB()})
    
    ########### FT ###########
    
    MonteFT <- eventReactive(input$submit,{
      withProgress(message = "Gerando IRS", value = 3/13, {
      
        Mandela <- rnbinom(input$VIGS, 1, 1-input$TX)
        mean <- mean(Mandela)
        sigma <- sd(Mandela)
        
        #colocar distribui??o para adquirir par?metros
        paths <- input$SIM
        count <- input$PER*30
        interval <- input$PER/count
        sample <- matrix(0,nrow=(count+1),ncol=paths)
        sample[1,] <- input$FT
        rnormm <- as.matrix(sapply(1:paths, function(x) rnorm((count+1), mean = 0, sd = 1)))
        
        for(i in 1:paths) {
            for(j in 2:(count+1)) {
              sample[j,i]<-sample[j-1,i]*exp(interval*(mean-((sigma)^2)/2)+((interval)^.5)*rnormm[j-1,i]*sigma) #Expression for Geometric Brownian Motion
            }
        }
#        matplot(sample,main="Furto",xlab="Time",ylab="Path",type="l")
#        FT <- data.frame("FURTO" = formatC(percent(mean(sample[count+1,])),digits = 2))
        
        return(sample)
        
      })
    })
#    output$FFT <- renderTable({MonteFT()}, bordered = TRUE, align = 'c')
#    output$PLOTFFT <- renderPlot({MonteFT()})

    ########### PREMIO ###########
    
    MontePR <- eventReactive(input$submit,{
      withProgress(message = "Gerando IRS", value = 4/13, {
      
        u1<-runif(input$VIGS)
        r<--2*log(u1)
        u2<-runif(input$VIGS)
        th<-2*pi*u2
        z1<-sqrt(r)*cos(th)
        z2<-sqrt(r)*sin(th)
        z<-vector(length=input$SIM)
        i=1
        j=1
        while (i<=input$SIM) {
            z[i]=z1[j]
            i=i+1
            z[i]=z2[j]
            j=j+1
            i=i+1
        }
        
        z<-z*input$VPR+input$PR
        
#        hist(z,main="box-mueller",breaks=50)
#        cat(mean(z),"   ",sd(z),"\n")
#        Prigan <- mean(z)
#        return(Prigan)
#        frp <- eventReactive(data.frame("PREMIO MEDIO" = formatC(Prigan,digits = 0)))
        
        return(z)
        
            })
        })
    
#    output$FPR <- renderTable(data.frame('PREMIO.MEDIO'={MontePR()}), bordered = TRUE, align = 'c') 
#    output$PLOTPR <- renderPlot({MontePR()})

    ########### SINISTRO ###########
    
    MonteSN <- eventReactive(input$submit,{
      withProgress(message = "Gerando IRS", value = 5/13, {
    Mandela <- rnorm(input$VIGS,input$TX)
    
    mean <- exp(mean(Mandela)+(sd(Mandela)^2)/2)
    variance <- exp(2*mean(Mandela)+sd(Mandela)^2)*(exp(sd(Mandela)^2)-1)
    
        medial<-log(mean^2/(sqrt(variance+(mean^2))))
        sigmal<-sqrt(log(variance/mean^2)+1)
        z <- vector(length=input$SIM)
        x <- vector(length=input$SIM)
        y <- vector(length=input$SIM)
        i=2
        while (i<=input$SIM) {
            z[i] = qnorm(runif(1),0,1)
            x[i] = medial + z[i]*sigmal
            y[i] = exp(x[i])*input$SN
            i=i+1
        }
        
#        hist(y,main="The lognormal",breaks=50)
#        cat(median(y),"   ",sd(y),"\n")
#        Carga <- median(y)
#        return(Carga)
#        SINIS <- data.frame("SINI MEDIO" = formatC(Carga,digits = 0))
        
        return(y)
        
      })
    })
#    output$FSN <- renderTable(data.frame('SINISTRO.MEDIO'={MonteSN()}), bordered = TRUE, align = 'c')
#    output$PLOTSN <- renderPlot({MonteSN()})

    ########### GRAPH PP ###########
    
    graf_pp <- eventReactive(input$submit,{
      withProgress(message = "Gerando IRS", value = 6/13, {
        pp <- MontePP()
        
        sample1 <- as.numeric(rowMeans(pp))
        sample1 <- as.data.frame(sample1)
        
        sample2 <- rowMeans(pp) + apply(pp, 1, sd) * 1.64
        sample3 <- rowMeans(pp) - apply(pp, 1, sd) * 1.64
        
        sample4 <- data.frame(c(1:as.integer(input$PER*30+1)),sample1,sample2,sample3)
        
        nm <- c("x","md", "sd1", "sd2")
        
        colnames(sample4) <- nm
        
        #Gráfico#
        
        fig <- plot_ly(sample4, x = ~x, y = ~sd1, type = 'scatter', mode = 'lines',
                       line = list(color = 'transparent'),
                       showlegend = FALSE, name = 'High') 
        fig <- fig %>% add_trace(y = ~sd2, type = 'scatter', mode = 'lines',
                                 fill = 'tonexty', fillcolor='rgba(0,100,80,0.2)', line = list(color = 'transparent'),
                                 showlegend = FALSE, name = 'Low') 
        fig <- fig %>% add_trace(x = ~x, y = ~md, type = 'scatter', mode = 'lines',
                                 line = list(color='rgb(0,100,80)'),
                                 name = 'Close') 
        fig <- fig %>% layout(title = paste("Perda parcial ao longo do tempo",input$nomestck),
                              paper_bgcolor='rgb(255,255,255)', plot_bgcolor='rgb(229,229,229)',
                              xaxis = list(title = "Days",
                                           gridcolor = 'rgb(255,255,255)',
                                           showgrid = TRUE,
                                           showline = FALSE,
                                           showticklabels = TRUE,
                                           tickcolor = 'rgb(127,127,127)',
                                           ticks = 'outside',
                                           zeroline = FALSE),
                              yaxis = list(title = "Taxa (%)",
                                           gridcolor = 'rgb(255,255,255)',
                                           showgrid = TRUE,
                                           showline = FALSE,
                                           showticklabels = TRUE,
                                           tickcolor = 'rgb(127,127,127)',
                                           ticks = 'outside',
                                           zeroline = FALSE))
        
        fig
        
        # matplot(pp,main="Perda Parcial",xlab="Time",ylab="Path",type="l")
      })
    })

    output$PLOTFPP <- renderPlotly({graf_pp()})
        
    ########### GRAPH PT ###########
    
    graf_pt <- eventReactive(input$submit, {
      withProgress(message = "Gerando IRS", value = 7/13, {
        pt <- MontePT()
        
        sample1 <- as.numeric(rowMeans(pt))
        sample1 <- as.data.frame(sample1)
        
        sample2 <- rowMeans(pt) + apply(pt, 1, sd) * 1.64
        sample3 <- rowMeans(pt) - apply(pt, 1, sd) * 1.64
        
        sample4 <- data.frame(c(1:as.integer(input$PER*30+1)),sample1,sample2,sample3)
        
        nm <- c("x","md", "sd1", "sd2")
        
        colnames(sample4) <- nm
        
        #Gráfico#
        
        fig <- plot_ly(sample4, x = ~x, y = ~sd1, type = 'scatter', mode = 'lines',
                       line = list(color = 'transparent'),
                       showlegend = FALSE, name = 'High') 
        fig <- fig %>% add_trace(y = ~sd2, type = 'scatter', mode = 'lines',
                                 fill = 'tonexty', fillcolor='rgba(0,100,80,0.2)', line = list(color = 'transparent'),
                                 showlegend = FALSE, name = 'Low') 
        fig <- fig %>% add_trace(x = ~x, y = ~md, type = 'scatter', mode = 'lines',
                                 line = list(color='rgb(0,100,80)'),
                                 name = 'Close') 
        fig <- fig %>% layout(title = paste("Perda total ao longo do tempo",input$nomestck),
                              paper_bgcolor='rgb(255,255,255)', plot_bgcolor='rgb(229,229,229)',
                              xaxis = list(title = "Days",
                                           gridcolor = 'rgb(255,255,255)',
                                           showgrid = TRUE,
                                           showline = FALSE,
                                           showticklabels = TRUE,
                                           tickcolor = 'rgb(127,127,127)',
                                           ticks = 'outside',
                                           zeroline = FALSE),
                              yaxis = list(title = "Taxa (%)",
                                           gridcolor = 'rgb(255,255,255)',
                                           showgrid = TRUE,
                                           showline = FALSE,
                                           showticklabels = TRUE,
                                           tickcolor = 'rgb(127,127,127)',
                                           ticks = 'outside',
                                           zeroline = FALSE))
        
        fig
        
        # matplot(pt,main="Perda Total",xlab="Time",ylab="Path",type="l")
      })
    })
    
    output$PLOTFPT <- renderPlotly({graf_pt()})
    
    ########### GRAPH RB ###########
    
    graf_rb <- eventReactive(input$submit, {
      withProgress(message = "Gerando IRS", value = 8/13, {
        
        rb <- MonteRB()
        
        sample1 <- as.numeric(rowMeans(rb))
        sample1 <- as.data.frame(sample1)
        
        sample2 <- rowMeans(rb) + apply(rb, 1, sd) * 1.64
        sample3 <- rowMeans(rb) - apply(rb, 1, sd) * 1.64
        
        sample4 <- data.frame(c(1:as.integer(input$PER*30+1)),sample1,sample2,sample3)
        
        nm <- c("x","md", "sd1", "sd2")
        
        colnames(sample4) <- nm
        
        #Gráfico#
        
        fig <- plot_ly(sample4, x = ~x, y = ~sd1, type = 'scatter', mode = 'lines',
                       line = list(color = 'transparent'),
                       showlegend = FALSE, name = 'High') 
        fig <- fig %>% add_trace(y = ~sd2, type = 'scatter', mode = 'lines',
                                 fill = 'tonexty', fillcolor='rgba(0,100,80,0.2)', line = list(color = 'transparent'),
                                 showlegend = FALSE, name = 'Low') 
        fig <- fig %>% add_trace(x = ~x, y = ~md, type = 'scatter', mode = 'lines',
                                 line = list(color='rgb(0,100,80)'),
                                 name = 'Close') 
        fig <- fig %>% layout(title = paste("Roubo ao longo do tempo",input$nomestck),
                              paper_bgcolor='rgb(255,255,255)', plot_bgcolor='rgb(229,229,229)',
                              xaxis = list(title = "Days",
                                           gridcolor = 'rgb(255,255,255)',
                                           showgrid = TRUE,
                                           showline = FALSE,
                                           showticklabels = TRUE,
                                           tickcolor = 'rgb(127,127,127)',
                                           ticks = 'outside',
                                           zeroline = FALSE),
                              yaxis = list(title = "Taxa (%)",
                                           gridcolor = 'rgb(255,255,255)',
                                           showgrid = TRUE,
                                           showline = FALSE,
                                           showticklabels = TRUE,
                                           tickcolor = 'rgb(127,127,127)',
                                           ticks = 'outside',
                                           zeroline = FALSE))
        
        fig
        
        # matplot(rb,main="Roubo",xlab="Time",ylab="Path",type="l")
      })
    })
    
    output$PLOTFRB <- renderPlotly({graf_rb()})
    
    ########### GRAPH FT ###########
    
    graf_ft <- eventReactive(input$submit, {
      withProgress(message = "Gerando IRS", value = 9/13, {
        
        ft <- MonteFT()
        
        sample1 <- as.numeric(rowMeans(ft))
        sample1 <- as.data.frame(sample1)
        
        sample2 <- rowMeans(ft) + apply(ft, 1, sd) * 1.64
        sample3 <- rowMeans(ft) - apply(ft, 1, sd) * 1.64
        
        sample4 <- data.frame(c(1:as.integer(input$PER*30+1)),sample1,sample2,sample3)
        
        nm <- c("x","md", "sd1", "sd2")
        
        colnames(sample4) <- nm
        
        #Gráfico#
        
        fig <- plot_ly(sample4, x = ~x, y = ~sd1, type = 'scatter', mode = 'lines',
                       line = list(color = 'transparent'),
                       showlegend = FALSE, name = 'High') 
        fig <- fig %>% add_trace(y = ~sd2, type = 'scatter', mode = 'lines',
                                 fill = 'tonexty', fillcolor='rgba(0,100,80,0.2)', line = list(color = 'transparent'),
                                 showlegend = FALSE, name = 'Low') 
        fig <- fig %>% add_trace(x = ~x, y = ~md, type = 'scatter', mode = 'lines',
                                 line = list(color='rgb(0,100,80)'),
                                 name = 'Close') 
        fig <- fig %>% layout(title = paste("Furto ao longo do tempo",input$nomestck),
                              paper_bgcolor='rgb(255,255,255)', plot_bgcolor='rgb(229,229,229)',
                              xaxis = list(title = "Days",
                                           gridcolor = 'rgb(255,255,255)',
                                           showgrid = TRUE,
                                           showline = FALSE,
                                           showticklabels = TRUE,
                                           tickcolor = 'rgb(127,127,127)',
                                           ticks = 'outside',
                                           zeroline = FALSE),
                              yaxis = list(title = "Taxa (%)",
                                           gridcolor = 'rgb(255,255,255)',
                                           showgrid = TRUE,
                                           showline = FALSE,
                                           showticklabels = TRUE,
                                           tickcolor = 'rgb(127,127,127)',
                                           ticks = 'outside',
                                           zeroline = FALSE))
        
        fig
        
        # matplot(ft,main="Furto",xlab="Time",ylab="Path",type="l")
      })  
    })
    
    output$PLOTFFT <- renderPlotly({graf_ft()})
    
    ########### GRAPH PR ###########
    
    graf_pr <- eventReactive(input$submit, {
      withProgress(message = "Gerando IRS", value = 10/13, {
        
        pr <- MontePR()
        
        hist(pr,main="box-mueller",breaks=50)
        cat(mean(pr),"   ",sd(pr),"\n")
        
      })
    })
    
    output$PLOTPR <- renderPlot({graf_pr()})
    
    ########### GRAPH SN ###########
    
    graf_sn <- eventReactive(input$submit, {
      withProgress(message = "Gerando IRS", value = 11/13, {
        
        
        sn <- MonteSN()
        
        hist(sn,main="The lognormal",breaks=50)
        cat(median(sn),"   ",sd(sn),"\n")
        
        })
    })
    
    output$PLOTSN <- renderPlot({graf_sn()})
    
    ########### TABLE SUMMARY ###########
    
    tab_pp <- eventReactive(input$submit,{
      withProgress(message = "Gerando IRS", value = 12/13, {
        
      count<-input$PER*30
      
      pp <- data.frame(as.numeric(MontePP()))
      PP <- data.frame("PERDA PARCIAL" = formatC(percent(mean(pp[count+1,])),digits = 6))
      
      pt <- data.frame(as.numeric(MontePT()))
      PT <- data.frame("PERDA TOTAL" = formatC(percent(mean(pt[count+1,])),digits = 6))
      
      rb <- data.frame(as.numeric(MonteRB()))
      RB <- data.frame("ROUBO" = formatC(percent(mean(rb[count+1,])),digits = 6))
      
      ft <- data.frame(as.numeric(MonteFT()))
      FT <- data.frame("FURTO" = formatC(percent(mean(ft[count+1,])),digits = 6))
      
      pr <- formatC(mean(MontePR()), digits = 2,width = 8, format = "f", flag = "-")
      PR <- data.frame("PREMIO MEDIO" = pr)
      
      sn <- formatC(median(MonteSN()), digits = 2,width = 8, format = "f", flag = "-")
      SN <- data.frame("SINISTRO MEDIO" = sn)
      
      sn1 <- median(MonteSN())
      pr1 <- mean(MontePR())
      SP <- formatC(percent(sn1/pr1),digits = 2)
      SP <- data.frame('S/P' = SP)
      
      table <- data.frame(PP,PT,RB,FT,PR,SN,SP)
      
      return(table)
      })
    })
    
    output$FTX <- DT::renderDataTable({tab_pp()})
    
})

    ##########
    #TABLE PP#
    ##########
    # 
    # tab_pp <- reactive({
    #     
    #     count<-input$PER*30
    #     
    #     pp <- data.frame(as.numeric(MontePP()))
    # 
    # PP <- data.frame("PERDA PARCIAL" = formatC(percent(mean(pp[count+1,])),digits = 6))
    # 
    # return(PP)
    # 
    # })
    # 
    # output$FPP <- renderTable({tab_pp()}, bordered = TRUE, align = 'c')
    # 
    # ##########
    # #TABLE PT#
    # ##########
    # 
    # tab_pt <- reactive({
    #     
    #     count<-input$PER*30
    #     
    #     pt <- data.frame(as.numeric(MontePT()))
    #     
    #     PT <- data.frame("PERDA TOTAL" = formatC(percent(mean(pt[count+1,])),digits = 6))
    #     
    #     return(PT)
    #     
    # })
    # 
    # output$FPT <- renderTable({tab_pt()}, bordered = TRUE, align = 'c')
    # 
    # ##########
    # #TABLE RB#
    # ##########
    # 
    # tab_rb <- reactive({
    #     
    #     count<-input$PER*30
    #     
    #     rb <- data.frame(as.numeric(MonteRB()))
    #     
    #     RB <- data.frame("ROUBO" = formatC(percent(mean(rb[count+1,])),digits = 6))
    #     
    #     return(RB)
    #     
    # })
    # 
    # output$FRB <- renderTable({tab_rb()}, bordered = TRUE, align = 'c')
    # 
    # ##########
    # #TABLE FT#
    # ##########
    # 
    # tab_ft <- reactive({
    #     
    #     count<-input$PER*30
    #     
    #     ft <- data.frame(as.numeric(MonteFT()))
    #     
    #     FT <- data.frame("FURTO" = formatC(percent(mean(ft[count+1,])),digits = 6))
    #     
    #     return(FT)
    #     
    # })
    # 
    # output$FFT <- renderTable({tab_ft()}, bordered = TRUE, align = 'c')
    # 
    # ##########
    # #TABLE PR#
    # ##########
    # 
    # tab_pr <- reactive({
    #     
    #     pr <- formatC(mean(MontePR()), digits = 2,width = 8, format = "f", flag = "-")
    #      
    #     PR <- data.frame("PREMIO MEDIO" = pr)
    #     
    #     return(PR)
    #     
    # })
    # 
    # output$FPR <- renderTable({tab_pr()}, bordered = TRUE, align = 'c')
    # 
    # ##########
    # #TABLE SN#
    # ##########
    # 
    # tab_sn <- reactive({
    #     
    #     sn <- formatC(median(MonteSN()), digits = 2,width = 8, format = "f", flag = "-")
    #     
    #     SN <- data.frame("SINI MEDIO" = sn)
    #     
    #     return(SN)
    #     
    # })
    # 
    # output$FSN <- renderTable({tab_sn()}, bordered = TRUE, align = 'c')
    # 
    # ################
    # #SINISTRALIDADE#
    # ################
    # 
    # MonteSP <- reactive({
    #     withProgress(message = "Gerando IRS", value = 1/2, {
    #     sn1 <- median(MonteSN())
    #     pr1 <- mean(MontePR())
    #     
    #     SP = formatC(percent(sn1/pr1),digits = 2)
    #     
    #     return(SP)
    #     })
    # })
    # 
    # output$FSP <- renderTable(data.frame('S/P' = {MonteSP()}), bordered = TRUE, align = 'c')
    #     
    # })

