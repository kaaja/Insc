xi <- .005;
sigma <- .05;
m <- 1000000;

R = rlnorm(m, xi, sigma) -1;
meanMC = mean(R);
sdMC = sd(R);

meanExact = exp(xi + .5*sigma^2) -1;
sdExact = exp(xi + .5*sigma^2)*sqrt(exp(sigma^2) - 1);

x11();
plot(density(R));
d = density(R[1:100]);
lines(d$x, d$y)

#c and d
bws = list(.005, .012, .018, .025);
for(i in 1:length(bws)){
  x11();
  plot(density(R), ylim=c(0,10))
  d = density(R[1:100], bw=bws[[i]]);
  lines(d$x, d$y);
  title(c('bw', bws[[i]]));
}
