
infs <- function(x, df){
	xmin <- min(x)
	other <- x[x!=xmin]
	infknots <- c(
		mean(c(xmin, min(other)))
		, quantile(other, (1:(df-2))/(df-1))
	)
	print(infknots)
	return(ns(x, knots=infknots))
}
