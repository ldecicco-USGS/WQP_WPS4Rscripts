# wps.des: id = plotDischargeFunction, title = Creates a png file in the image folder, abstract = abstract can have spaces no commas;
# wps.in: plotDischargeInput, string, text input to demo, abstract about variable;

library(dataRetrieval)
library(EGRET)
output <- "output.png"

plotDischarge <- function(x, output){

  discharge <- readNWISDaily(x, "00060", "", "")
  INFO <- readNWISInfo(x, parameterCd = "00060", interactive = FALSE)
  eList <- as.egret(INFO, discharge)
  
  png(output)
    plotFour(eList)
  dev.off()
  print(output)
  return(output)
}

dischargeFile <- plotDischarge(plotDischargeInput, output)
# wps.out: dischargeFile, png, title is output title, abstract is JSON object for item summary;


