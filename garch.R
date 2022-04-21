library(quantmod)

tesla <- getSymbols("TSLA", auto.assign = TRUE)
tesla
head(tesla)
head(TSLA)
tsla<- TSLA
str(tsla)
chart_Series(tsla)
chartSeries(tsla)

tsla.close<- tsla$TSLA.Close
head(tsla.close)

library(rugarch)
tsla1<- ugarchspec(variance.model = list(model="sGARCH", 
                                         garchOrder=c(1,1)),
                   mean.model = list(armaOrder=c(1,1)),
                   distribution.model = "std")
tslaGarch1<-ugarchfit(spec = tsla1, tsla.close)
tslaGarch1

tsla2<- ugarchspec(variance.model = list(model="sGARCH", 
                                         garchOrder=c(1,1)),
                   mean.model = list(armaOrder=c(0,0)),
                   distribution.model = "std")
tslaGarch2<-ugarchfit(spec = tsla2, tsla.close)
tslaGarch2

tsla3<- ugarchspec(variance.model = list(model="sGARCH", 
                                         garchOrder=c(1,1)),
                   mean.model = list(armaOrder=c(2,2)),
                   distribution.model = "std")

tslaGarch3<-ugarchfit(spec = tsla3, tsla.close)
tslaGarch3
tsla4<- ugarchspec(variance.model = list(model="sGARCH", 
                                         garchOrder=c(1,1)),
                   mean.model = list(armaOrder=c(3,3)),
                   distribution.model = "std")
tslaGarch4<-ugarchfit(spec = tsla4, tsla.close)
tslaGarch4

tslapredict <- ugarchboot(tslaGarch4,n.ahead = 10, method = c('partial','full')[1])
tslapredict
plot(tslapredict)



