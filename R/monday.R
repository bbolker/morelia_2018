library(lme4)
data("cbpp",package="lme4")
## head(cbpp)
table(cbpp$herd)

g0 <- ggplot(cbpp,
    aes(x=period,y=incidence/size,
        colour=herd))
g1 <- (g0 
  + geom_point() 
  + geom_line(aes(group=herd)) 
  + facet_wrap(~herd)
)

cbpp2 <- transform(cbpp,
  herd=reorder(herd,incidence/size,
               FUN=mean)
)


g1 %+% cbpp2

##
L <- load("../data/gopherdat2.RData")

(ggplot(Gdat,aes(year,shells/Area,colour=Site))
  +geom_point()
  +geom_line()
)

library(ggalt)
(ggplot(Gdat,aes(prev,shells/Area,colour=Site))
  +geom_point()
  ##+geom_line()
  + stat_centseg(cfun=mean)
  ## + geom_path()
  ## + geom_text(aes(label=year))
)

data("sleepstudy",package="lme4")
library(lme4)
View(sleepstudy)


(ggplot(sleepstudy,
        aes(Days,Reaction,colour=Subject))+
    geom_point()+
    geom_line() ## alpha=0.5)## +
    ##geom_smooth(method="lm",se=FALSE)
)

## random intercept model
m_int <- lmer(Reaction~Days+(1|Subject),
              sleepstudy)
m_int
m_rs <- lmer(Reaction~Days+(1+Days|Subject),
              sleepstudy)
summary(m_int)
ranef(m_int)   ## deviations from population level
coef(m_int)    ## group-level predictions
fixef(m_int)   ## population-level estimates
VarCorr(m_int) ## random-effects variances
