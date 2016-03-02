# Try to modify ns for discrete-valued variables, since the behaviour seems weird when knots fall on popular values

dns <- function(x, df){
	## Make one knot too many and check they are different
	splits <- quantile(x, (1:df)/(df+1)) 
	if (length(unique(splits))<df)
		warning("There might be too many knots in dns")

	## Linear extrapolation to the right number of knots
	w <- (1:(df-1))/df
	dknots <- (w*splits[-1] + (1-w)*splits[-df])

	print(dknots)
	## Make a spline
	return(ns(x, knots=dknots))
}

