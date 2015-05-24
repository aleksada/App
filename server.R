##Calculate the mean and variance of given distribution
moment <- function(ss,n,p){
  sam<-rbinom(ss,n,p)
  mu<-mean(sam)
  vv<-var(sam)
  c(mu,vv)
}

shinyServer(
  function(input, output) {
    
  output$real <- renderPrint({
    mm<-input$n*input$p
    vv<-input$n*input$p*(1-input$p)
    c(mm,vv)})
  
  output$mvs <- renderPrint({moment(input$ss,input$n,input$p)}) 
  
  output$histo <- renderPlot({
    mm<-input$n*input$p
    vv<-input$n*input$p*(1-input$p)
    ss<-input$ss
    p<-input$p
    n<-input$n
    sam<-rbinom(ss,n,p)
    x<-seq((mm-2*vv),(mm+2*vv),length=1000)
    y<-dnorm(x,mm,sqrt(vv))
    hist(sam,main='Histogram',freq=FALSE,ylim=c(0,max(y)))
    lines(x,y,col="blue",lwd=5)
    legend("topleft","Normal distribution",lwd=5,col="blue")
    legend("topright",c(paste("Trials = ", n),paste("Probability = ", p),paste("Sample Size = ", ss)))
    })
 }
)