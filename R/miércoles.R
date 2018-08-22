## nothing yet
data("cbpp",package="lme4")
g1 <- glmer(incidence/size~period+(1|herd),
            data=cbpp,
            weights=size,
            family=binomial)
rr <- ranef(g1max)
pairs(rr[[1]])
af <- allFit(g1max)
ss <- summary(af)
names(ss)
ss$fixef
sort(ss$llik)

g1cs <- update(g1max,
               . ~ . - (period|herd) + (1|herd/period))

confint(g1cs,parm="theta_")

### strengthen prior!

mcmcglmm2 <- MCMCglmm(stmass~mnth*roostsitu,
                      random=~subject,
                      data=dataf,
                      nit=2e5,
                      prior=list(G=list(list(V=1,nu=5))))
