# wps.des: id = getWQPAvailableData, title = Creates csv of available data for one WQP site;
# wps.in: gdaInput, string, text input to demo, abstract about variable;

library(dataRetrieval)
library(dplyr)
output <- "output.csv"

getWQPAvailableData <- function(site, output){
  
  allWQP <- readWQPdata(siteid=site)
  output <- select(allWQP, CharacteristicName,
                         ResultSampleFractionText, ResultMeasure.MeasureUnitCode,
                         ActivityStartDate) %>%
                  group_by(CharacteristicName,
                              ResultSampleFractionText,
                              ResultMeasure.MeasureUnitCode) %>%
                  rename(Units = ResultMeasure.MeasureUnitCode) %>%
                  rename(Fraction=ResultSampleFractionText) %>%
                  summarise_each(funs(Count=n(), 
                                      Start=min(., na.rm=TRUE), 
                                      End=max(., na.rm=TRUE)), 
                                 one_of("ActivityStartDate")) 
    
  write.csv(output, file="output.csv", row.names=FALSE)
  print(output)
  return(output)
}

dataAvailable <- getWQPAvailableData(gdaInput, output)
# wps.out: dataAvailable, csv, title is output title, abstract is JSON object for item summary;

