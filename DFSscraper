library(xml2)
library(rvest)

html=read_html("https://www.basketball-reference.com/leagues/NBA_2019_per_game.html")
Playerdata=html_nodes(html,".full_table .left")
webtable=html_text(Playerdata)
playernames=webtable[seq(1,length(webtable),2)]
teams=webtable[seq(2,length(webtable),2)]

atrr=html_attr(Playerdata, "data-append-csv")
Webtext=atrr[seq(1,length(webtable),2)]

newdf2=data.frame()


for(ii in 1:length(Webtext)){
  url="https://www.basketball-reference.com/players/a/"
  url=paste(url,Webtext[ii],"/gamelog/2019",sep="")
  newhtml=read_html(url)
  readnodes=html_nodes(newhtml,xpath= '//*[@id="pgl_basic"]')
  table19=html_table(readnodes,fill = TRUE)
  p19df1=table19[[1]]
  Name=rep(playernames[ii],NROW(p19df1))
  p19df=cbind(Name,p19df1[1:30])
  colnames(p19df)=c("Name",
                    "Rk","G","Date","AGE","Team","@","OPP","W/L","GS","Minutes",
                    "FG","FGA","FG%","3p","3PA","3p%","FT","FTA","FT%","ORB",
                    "DRB","TRB","AST","STL","BLK","TOV","PF","PTS","GameSc","+/-"
                    )
  
  if(ii==1){
    newdf2=p19df
    colnames(newdf2)=c("Name",
                      "Rk","G","Date","AGE","Team","@","OPP","W/L","GS","Minutes",
                      "FG","FGA","FG%","3p","3PA","3p%","FT","FTA","FT%","ORB",
                      "DRB","TRB","AST","STL","BLK","TOV","PF","PTS","GameSc","+/-"
                      )
    next
  }
  else{
    newdf2=rbind(newdf2,p19df)
  }
}

write.csv(newdf2, file = "2019Gamelogs10-20.csv")
