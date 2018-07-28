##' 
##' @examples
##' dd <- data.frame(x=rnorm(10),y=rnorm(10))
##' ggplot(dd,aes(x,y))+
##'     geom_point() +
##'     stat_centseg()
##' ggplot(dd,aes(x,y))+
##'     geom_point() +
##'     stat_centseg(cfun=median)
##' data("Gasoline",package="nlme")
##' ggplot(Gasoline,aes(yield,endpoint,colour=Sample))+
##'     geom_point()+
##'     ggalt::geom_encircle()
##'     stat_centseg()
library(ggplot2)
StatCentSeg <- ggplot2::ggproto("StatCentSeg", Stat,
                                compute_group = function(data, scales, params,
                                                         cfun=median) {
    data$xend <- cfun(data$x)
    data$yend <- cfun(data$y)
    return(data)
  },
  required_aes = c("x", "y")
)
stat_centseg <- function(mapping = NULL, data = NULL, geom = "segment",
                       position = "identity", na.rm = FALSE, show.legend = NA, 
                       inherit.aes = TRUE, cfun=median, ...) {
  layer(
    stat = StatCentSeg, data = data, mapping = mapping, geom = geom, 
    position = position, show.legend = show.legend, inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, cfun = cfun, ...)
  )
}

dd <- data.frame(x=rnorm(10),y=rnorm(10))
ggplot(dd,aes(x,y))+
    geom_point() +
    stat_centseg()
ggplot(dd,aes(x,y))+
    geom_point() +
    stat_centseg(cfun=median)

data("Gasoline",package="nlme")
ggplot(Gasoline,aes(yield,endpoint,colour=Sample))+
    geom_point()+
    ggalt::geom_encircle()
    stat_centseg()
