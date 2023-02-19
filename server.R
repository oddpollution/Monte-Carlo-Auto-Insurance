#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
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

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    ##########
    #   PP   #
    ##########
    
    MontePP <- eventReactive(input$submit,{
        Mandela <- rpois(input$VIGS, input$TX)
        mean <- mean(Mandela)
        sigma <- sd(Mandela)
        
        #colocar distribui??o para adquirir par?metros
        paths <- 1000
        count<-input$PER*30
        interval<-input$PER/count
        sample<-matrix(0,nrow=(count+1),ncol=paths)
        for(i in 1:paths)
        {
            sample[1,i]<- input$PP
            for(j in 2:(count+1))
            {
               sample[j,i]<-sample[j-1,i]*exp(interval*(mean-((sigma)^2)/2)+((interval)^.5)*rnorm(1)*sigma) #Expression for Geometric Brownian Motion
            }
        }
#        matplot(sample,main="Perda Parcial",xlab="Time",ylab="Path",type="l")
#        PP <- data.frame("PERDA PARCIAL" = formatC(percent(mean(sample[count+1,])),digits = 6))
        
        return(sample)
        
    })
#    output$FPP <- renderTable({MontePP()}, bordered = TRUE, align = 'c')
#    output$PLOTFPP <- renderPlot({MontePP()})

###################################################################    
    
    ##########
    #   PT   #
    ##########
    
    MontePT <- eventReactive(input$submit,{
        Mandela <- rnbinom(input$VIGS, 1, 1-input$TX)
        mean <- mean(Mandela)
        sigma <- sd(Mandela)
        
        #colocar distribui??o para adquirir par?metros
        paths <- 1000
        count<-input$PER*30
        interval<-input$PER/count
        sample<-matrix(0,nrow=(count+1),ncol=paths)
        for(i in 1:paths)
        {
            sample[1,i]<- input$PT
            for(j in 2:(count+1))
            {
                sample[j,i]<-sample[j-1,i]*exp(interval*(mean-((sigma)^2)/2)+((interval)^.5)*rnorm(1)*sigma) #Expression for Geometric Brownian Motion
            }
        }
#        matplot(sample,main="Perda Total",xlab="Time",ylab="Path",type="l")
#        PT <- data.frame("PERDA TOTAL" = formatC(percent(mean(sample[count+1,])),digits = 6))  
        
        return(sample)
        
    })
#    output$FPT <- renderTable({MontePT()}, bordered = TRUE, align = 'c')
#    output$PLOTFPT <- renderPlot({MontePT()})
    
###################################################################    
    
    ##########
    #   RB   #
    ##########
    
    MonteRB <- eventReactive(input$submit,{
        Mandela <- rnbinom(input$VIGS, 1, 1-input$TX)
        mean <- mean(Mandela)
        sigma <- sd(Mandela)
        
        #colocar distribui??o para adquirir par?metros
        paths <- 1000
        count<-input$PER*30
        interval<-input$PER/count
        sample<-matrix(0,nrow=(count+1),ncol=paths)
        for(i in 1:paths)
        {
            sample[1,i]<- input$RB
            for(j in 2:(count+1))
            {
                sample[j,i]<-sample[j-1,i]*exp(interval*(mean-((sigma)^2)/2)+((interval)^.5)*rnorm(1)*sigma) #Expression for Geometric Brownian Motion
            }
        }
#       matplot(sample,main="Roubo",xlab="Time",ylab="Path",type="l")
#       RB <- data.frame("ROUBO" = formatC(percent(mean(sample[count+1,])),digits = 6))
       
       return(sample)
       
    })
#    output$FRB <- renderTable({MonteRB()}, bordered = TRUE, align = 'c')
#    output$PLOTFRB <- renderPlot({MonteRB()})
    
###################################################################    
    
    ##########
    #   FT   #
    ##########
    
    MonteFT <- eventReactive(input$submit,{
        Mandela <- rnbinom(input$VIGS, 1, 1-input$TX)
        mean <- mean(Mandela)
        sigma <- sd(Mandela)
        
        #colocar distribui??o para adquirir par?metros
        paths <- 1000
        count<-input$PER*30
        interval<-input$PER/count
        sample<-matrix(0,nrow=(count+1),ncol=paths)
        for(i in 1:paths)
        {
            sample[1,i]<- input$FT
            for(j in 2:(count+1))
            {
                sample[j,i]<-sample[j-1,i]*exp(interval*(mean-((sigma)^2)/2)+((interval)^.5)*rnorm(1)*sigma) #Expression for Geometric Brownian Motion
            }
        }
#        matplot(sample,main="Furto",xlab="Time",ylab="Path",type="l")
#        FT <- data.frame("FURTO" = formatC(percent(mean(sample[count+1,])),digits = 2))
        return(sample)
    })
#    output$FFT <- renderTable({MonteFT()}, bordered = TRUE, align = 'c')
#    output$PLOTFFT <- renderPlot({MonteFT()})

###################################################################    
    
    ##########
    # PREMIO #
    ##########
    
    MontePR <- eventReactive(input$submit,{
        u1<-runif(input$VIGS)
        r<--2*log(u1)
        u2<-runif(input$VIGS)
        th<-2*pi*u2
        z1<-sqrt(r)*cos(th)
        z2<-sqrt(r)*sin(th)
        z<-vector(length=1000)
        i=1
        j=1
        while (i<=1000)
        {
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
    
#    output$FPR <- renderTable(data.frame('PREMIO.MEDIO'={MontePR()}), bordered = TRUE, align = 'c') 
#    output$PLOTPR <- renderPlot({MontePR()})

###################################################################    
    
    ##########
    #SINISTRO#
    ##########
    
    MonteSN <- eventReactive(input$submit,{
    
    Mandela <- rnorm(input$VIGS,input$TX)
    
    mean <- exp(mean(Mandela)+(sd(Mandela)^2)/2)
    variance <- exp(2*mean(Mandela)+sd(Mandela)^2)*(exp(sd(Mandela)^2)-1)
    
        medial<-log(mean^2/(sqrt(variance+(mean^2))))
        sigmal<-sqrt(log(variance/mean^2)+1)
        z <- vector(length=1000)
        x <- vector(length=1000)
        y <- vector(length=1000)
        i=2
        while (i<=1000)
        {
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
#    output$FSN <- renderTable(data.frame('SINISTRO.MEDIO'={MonteSN()}), bordered = TRUE, align = 'c')
#    output$PLOTSN <- renderPlot({MonteSN()})

###################################################################    
    
    ##########
    #GRAPH PP#
    ##########
    
    graf_pp <- reactive({
        
        pp <- MontePP()
        
        matplot(pp,main="Perda Parcial",xlab="Time",ylab="Path",type="l")
        
    })

    output$PLOTFPP <- renderPlot({graf_pp()})
        
    ##########
    #GRAPH PT#
    ##########
    
    graf_pt <- reactive({
        
        pt <- MontePT()
        
        matplot(pt,main="Perda Total",xlab="Time",ylab="Path",type="l")
        
    })
    
    output$PLOTFPT <- renderPlot({graf_pt()})
    
    ##########
    #GRAPH RB#
    ##########
    
    graf_rb <- reactive({
        
        rb <- MonteRB()
        
        matplot(rb,main="Roubo",xlab="Time",ylab="Path",type="l")
        
    })
    
    output$PLOTFRB <- renderPlot({graf_rb()})
    
    ##########
    #GRAPH FT#
    ##########
    
    graf_ft <- reactive({
        
        ft <- MonteFT()
        
        matplot(ft,main="Furto",xlab="Time",ylab="Path",type="l")
        
    })
    
    output$PLOTFFT <- renderPlot({graf_ft()})
    
    ##########
    #GRAPH PR#
    ##########
    
    graf_pr <- reactive({
        
        pr <- MontePR()
        
        hist(pr,main="box-mueller",breaks=50)
        cat(mean(pr),"   ",sd(pr),"\n")
        
    })
    
    output$PLOTPR <- renderPlot({graf_pr()})
    
    ##########
    #GRAPH SN#
    ##########
    
    graf_sn <- reactive({
        
        sn <- MonteSN()
        
        hist(sn,main="The lognormal",breaks=50)
        cat(median(sn),"   ",sd(sn),"\n")
        
    })
    
    output$PLOTSN <- renderPlot({graf_sn()})
    
    ###################################################################    
    
    ##########
    #TABLE PP#
    ##########
    
    tab_pp <- reactive({
        
        count<-input$PER*30
        
        pp <- data.frame(as.numeric(MontePP()))
    
    PP <- data.frame("PERDA PARCIAL" = formatC(percent(mean(pp[count+1,])),digits = 6))

    return(PP)
    
    })
    
    output$FPP <- renderTable({tab_pp()}, bordered = TRUE, align = 'c')
    
    ##########
    #TABLE PT#
    ##########
    
    tab_pt <- reactive({
        
        count<-input$PER*30
        
        pt <- data.frame(as.numeric(MontePT()))
        
        PT <- data.frame("PERDA TOTAL" = formatC(percent(mean(pt[count+1,])),digits = 6))
        
        return(PT)
        
    })
    
    output$FPT <- renderTable({tab_pt()}, bordered = TRUE, align = 'c')
    
    ##########
    #TABLE RB#
    ##########
    
    tab_rb <- reactive({
        
        count<-input$PER*30
        
        rb <- data.frame(as.numeric(MonteRB()))
        
        RB <- data.frame("ROUBO" = formatC(percent(mean(rb[count+1,])),digits = 6))
        
        return(RB)
        
    })
    
    output$FRB <- renderTable({tab_rb()}, bordered = TRUE, align = 'c')
    
    ##########
    #TABLE FT#
    ##########
    
    tab_ft <- reactive({
        
        count<-input$PER*30
        
        ft <- data.frame(as.numeric(MonteFT()))
        
        FT <- data.frame("FURTO" = formatC(percent(mean(ft[count+1,])),digits = 6))
        
        return(FT)
        
    })
    
    output$FFT <- renderTable({tab_ft()}, bordered = TRUE, align = 'c')
    
    ##########
    #TABLE PR#
    ##########
    
    tab_pr <- reactive({
        
        pr <- formatC(mean(MontePR()), digits = 2,width = 8, format = "f", flag = "-")
         
        PR <- data.frame("PREMIO MEDIO" = pr)
        
        return(PR)
        
    })
    
    output$FPR <- renderTable({tab_pr()}, bordered = TRUE, align = 'c')
    
    ##########
    #TABLE SN#
    ##########
    
    tab_sn <- reactive({
        
        sn <- formatC(median(MonteSN()), digits = 2,width = 8, format = "f", flag = "-")
        
        SN <- data.frame("SINI MEDIO" = sn)
        
        return(SN)
        
    })
    
    output$FSN <- renderTable({tab_sn()}, bordered = TRUE, align = 'c')

    ################
    #SINISTRALIDADE#
    ################
    
    MonteSP <- reactive({
        withProgress(message = "Gerando ETTJ", value = 1/2, {
        sn1 <- median(MonteSN())
        pr1 <- mean(MontePR())
        
        SP = formatC(percent(sn1/pr1),digits = 2)
        
        return(SP)
        })
    })
    
    output$FSP <- renderTable(data.frame('S/P' = {MonteSP()}), bordered = TRUE, align = 'c')
        
    })

