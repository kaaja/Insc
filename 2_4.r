m = 10000
xi = .005
sigmas = list(.05, .25)

for( i in 1:length(sigmas)){
  X = rnorm(m, xi, sigmas[[i]]);
  Y = rlnorm(m, xi, sigmas[[i]]) - 1;
  X11();
  plot(sort(X), sort(Y));
  title(c('sigma', sigmas[[i]]))
}