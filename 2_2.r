n <- 1000
xi <- .005
sigma1 <- .05
sigma2 <- .25
sigmas = list(sigma1, sigma2)

u = (1:n-.5)/n

for( i in 1:length(sigmas)){
  X11()
  sigma = sigmas[[i]]
  
  qno = xi +sigma*qnorm(u)
  qln = exp(qno) -1
  
  plot(qno, qln)
  title(c('sigma ', sigma))
}





