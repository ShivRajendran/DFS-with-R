library(stargazer)

#----------DVP TABLE using Regression----------------------------
data=read.csv("dfRegres.csv", header=T)
data=data[order(data$Name),]
game=data[data$Position=="PG" & data$Minutes>27,]
z=summary(lm((FPTS)~OPP+-1, data=game))
PGS=(as.data.frame(z$coefficients[,1]))

game=data[data$Position=="SG" & data$Minutes>27,]
z=summary(lm((FPTS)~OPP+-1, data=game))
SGS=(as.data.frame(z$coefficients[,1]))

game=data[data$Position=="SF" & data$Minutes>27,]
z=summary(lm((FPTS)~OPP+-1, data=game))
SFS=(as.data.frame(z$coefficients[,1]))

game=data[data$Position=="PF" & data$Minutes>27,]
z=summary(lm((FPTS)~OPP+-1, data=game))
PFS=(as.data.frame(z$coefficients[,1]))

game=data[data$Position=="C" & data$Minutes>27,]
z=summary(lm((FPTS)~OPP+-1, data=game))
CS=(as.data.frame(z$coefficients[,1]))

master=cbind(PGS,SGS,SFS,PFS,CS)
names(master)=c("PG","SG","SF","PF","C")

write.csv(master,"DVP.csv")

#Treys allowed----------------------------------------
game=data[data$Minutes>27 & data$X3PA>0,]
z=summary(lm((X3p)~OPP+-1, data=game))
Treys=(as.data.frame(z$coefficients[,1]))
#REB allowed------------------------------------------
game=data[data$Minutes>27,]
z=summary(lm((TRB)~OPP+-1, data=game))
TRBS=(as.data.frame(z$coefficients[,1]))
#Asts allowed------------------------------------------
game=data[data$Minutes>27,]
z=summary(lm((AST)~OPP+-1, data=game))
ASTS=(as.data.frame(z$coefficients[,1]))
#Steals allowed----------------------------------------
game=data[data$Minutes>27,]
z=summary(lm((STL)~OPP+-1, data=game))
STL=(as.data.frame(z$coefficients[,1]))

master2=cbind(Treys,TRBS,ASTS,STL)
names(master2)=c("Threes","Rebs","Assists","Steal")
write.csv(master2,"DVP2.csv")

#Seperate each teams stats By position------------------------------------------
#threes
THREE=data.frame(matrix(NA, ncol=1, nrow=5))[-1]
for (i in unique(data$OPP)){
  game=data[data$OPP==i & data$Minutes>27 & data$X3PA>0,]
  z=summary(lm((X3p)~Position+-1, data=game))
  temp1=as.data.frame(z$coefficients[,1])
  names(temp1)=i
  THREE=cbind(THREE,temp1)
}
THREE=data.frame(t(THREE))
#rebounds
REBS1=data.frame(matrix(NA, ncol=1, nrow=5))[-1]
for (i in unique(data$OPP)){
  game=data[data$OPP==i & data$Minutes>27,]
  z=summary(lm((TRB)~Position+-1, data=game))
  temp1=as.data.frame(z$coefficients[,1])
  names(temp1)=i
  REBS1=cbind(REBS1,temp1)
}
REBS=data.frame(t(REBS1[]))

#Assists
REBS1=data.frame(matrix(NA, ncol=1, nrow=5))[-1]
for (i in unique(data$OPP)){
  game=data[data$OPP==i & data$Minutes>27,]
  z=summary(lm((AST)~Position+-1, data=game))
  temp1=as.data.frame(z$coefficients[,1])
  names(temp1)=i
  REBS1=cbind(REBS1,temp1)
}
ASSISTS=data.frame(t(REBS1[]))

#Actual Points
REBS1=data.frame(matrix(NA, ncol=1, nrow=5))[-1]
for (i in unique(data$OPP)){
  game=data[data$OPP==i & data$Minutes>27,]
  z=summary(lm((PTS)~Position+-1, data=game))
  temp1=as.data.frame(z$coefficients[,1])
  names(temp1)=i
  REBS1=cbind(REBS1,temp1)
}
RPTS=data.frame(t(REBS1[]))

master3=cbind(RPTS,ASSISTS,REBS,THREE)
master3=master3[order(rownames(master3)),]
write.csv(master3,"DVP3.csv")

# perform analysis here per set-----------------------
x="DEN"
y="MEM"
master[row.names(master)==paste("OPP",x,sep="")|row.names(master)==paste("OPP",y,sep=""),]
master2[row.names(master2)==paste("OPP",x,sep="")|row.names(master2)==paste("OPP",y,sep=""),]
RPTS[row.names(RPTS)==x|row.names(RPTS)==y,]
THREE[row.names(THREE)==x|row.names(THREE)==y,]
REBS[row.names(REBS)==x|row.names(REBS)==y,]
ASSISTS[row.names(ASSISTS)==x|row.names(ASSISTS)==y,]
