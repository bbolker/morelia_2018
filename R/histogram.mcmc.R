histogram.mcmc <- function (x, data = NULL, outer, aspect = "xy", default.scales = list(relation = "free"), 
    start = 1, thin = 1, main = attr(x, "title"), xlab = "", 
    ..., subset = coda:::thinned.indices(x, start = start, 
        thin = thin)) 
{
    if (!is.R()) {
        stop("This function is not yet available in S-PLUS")
    }
    if (!missing(outer)) 
        warning("specification of outer ignored")
    data <- as.data.frame(x)
    form <- as.formula(paste("~", paste(lapply(names(data), as.name), 
        collapse = "+")))
    histogram(form, data = data[subset, , drop = FALSE], outer = TRUE, 
        aspect = aspect, default.scales = default.scales, main = main, 
        xlab = xlab, ...)
}
