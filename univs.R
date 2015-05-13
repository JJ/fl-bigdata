#!/usr/bin/env rscript
    
data.US <- NULL  # create a place to save the URLs # change this line
data.UGR <- NULL  # create a place to save the URLs # change this line
library(RCurl)
library(RJSONIO)

for (year in (2008:2014)) {
    for (month in (1:12)) {
        
        theURL <- "http://stats.grok.se/json/es/"
        theURL <- paste0(theURL, year)
        
        if (month < 10) {
            theURL <- paste0(theURL, "0")
        }
        
        theURL <- paste0(theURL, month) 
        theURL.us <- paste0(theURL, "/Universidad de Sevilla")
        theURL.ugr <- paste0(theURL, "/Universidad de Granada")
        rawData.us <- getURL(theURL.us)
        parsedData.us <- fromJSON(rawData.us)
        rawData.ugr <- getURL(theURL.ugr)
        parsedData.ugr <- fromJSON(rawData.ugr)
        data.US <- c(data.US, parsedData.us)
        data.UGR <- c(data.UGR, parsedData.ugr)

    }
}
    
    ## END OF SCRIPT
