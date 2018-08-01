library(lme4)
data("sleepstudy",package="lme4") ## redundant
## names(sleepstudy) ## check variable names
m1 <- lmer(Reaction~Days+(Days|Subject),
           sleepstudy)