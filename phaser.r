library(latex2exp)
library(reconPlots)
library(phaseR)
s=0.2#0.804
a=0.3#0.125
d=0.02#0.13
sol1 <- function(k){
  y=s*k^a
  return(y)
}
sol2 <- function(k){
  y=d*k+k^-1
}
sol3 <- function(x){
  y= s*x^(a) - d*x - x^-1
  return(y)
}
curve(sol1, xname="k", from=0, to=20, ylab=expression(dot(k)))
curve(sol2, add=TRUE)


curve(sol3, from=0, to=40)
abline(h=0)

solow <- function(t, k, parameters) {
  list((s*k^a)-((d*k^2+1)/(k)))
}
example2_phasePortrait <- phasePortrait(solow,
                                        ylim = c(0.2, 30),
                                        frac = 0.5,
                                        xlab="k",
                                        ylab=expression(dot(k)))
example2_flowField     <- flowField(solow,
                                    xlim   = c(0, 500),
                                    ylim   = c(0.0001, 30),
                                    system = "one.dim",
                                    add    = FALSE,
                                    xlab   = "t",
                                    ylab="k")
example12_nullclines  <- nullclines(solow,
                                    xlim   = c(0, 500), 
                                    ylim   = c(0.00001, 30),
                                    points = 50)
example2_trajectory    <- trajectory(solow,
                                     y0     = c(1,3,4,5,7,10,30),
                                     tlim   = c(0, 500),
                                     system = "one.dim",
                                     ylab="k")
abline(h=1.5426, col="blue")
abline()
ex <- numericalSolution(solow, y0=c(1,1),tlim=c(1,100))
ex2 <- findEquilibrium(solow, y0=c(1,1),tlim=c(1,100))
