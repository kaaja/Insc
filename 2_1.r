library(ggplot2)

xi <- .005
sigma <- .05
#m1 <- 100
#m2 <- 1000
#m3 <- 10000
#ms = c(m1, m2, m3)
totalLength = 10000
ms = seq(1,totalLength,length=totalLength)
meanMC = numeric(totalLength)
sdMC = numeric(totalLength)

for(m in 1:length(ms)){
  epsilon <- rnorm(ms[m])
  R <- exp(xi + sigma*epsilon)  - 1
  meanMC[m] = mean(R)
  sdMC[m] = sd(R)
}

meanExact <- exp(xi + sigma^2/2) - 1
sdExact <- exp(xi + sigma^2/2)*sqrt(exp(sigma^2) - 1)

c('meanMC: ', meanMC) 
c('exactMC:', meanExact)

c('meanSd: ', sdMC) 
c('exactSd:', sdExact)

titles = c('Mean', 'Sdt')
variablesToPlot = list(meanMC, sdMC)
variablesExact = list(meanExact, sdExact)

#length(variablesToPlot)

"
for( i in 1:length(titles)){
  #plot.new()
  #plot(ms, variablesToPlot[[i]], type='l')
  qplot(ms, variablesToPlot[[i]], geom ='line')
  title(titles[[i]])
  abline(h=variablesExact[[i]])
}
"
plot.new()
plot(ms, meanMC, type='l')
title('mean')
abline(h=meanExact)

plot.new()
plot(ms, sdMC, type='l')
title('sd')
abline(h=sdExact)

