#load dplyr and ggplot packages

library(dplyr)
library(ggplot2)
library(data.table)   
#set workspace and verify
setwd("Desktop/Austin_Realty")
getwd()

#DATA IMPORT AND CLEANING

#import Zillow time series rent data for all homes plus multi-family
ZillowRent<-read.csv(file="Zri_All_wMH_RENT.csv", header=TRUE,sep=",")

#Change RegionName to ZipCode and CountyName to County for ZillowRent
head(ZillowRent,n=5)
names(ZillowRent)[2] <- "ZipCode"
names(ZillowRent)[6] <- "County"
head(ZillowRent,n=5)

#Remove "X" from time series (year) column header
setnames(ZillowRent, old=c("X2011","X2012", "X2013", "X2014", "X2015"),
          new=c("2011","2012", "2013", "2014", "2015"))

head(ZillowRent,n=5)

#import Zillow time series home value data for all SF plus Condo homes
ZillowOwn<-read.csv(file="Zhvi_AllHomes_Values.csv", header=TRUE,sep=",")

#Change RegionName to ZipCode for ZillowOwn
head(ZillowOwn,n=5)
names(ZillowOwn)[2] <- "ZipCode"
head(ZillowOwn,n=5)

#Remove "X" from time series (year) column header
setnames(ZillowOwn, old=c("CountyName", "X2011","X2012", "X2013", "X2014", "X2015"),
         new=c("Coounty", "2011","2012", "2013", "2014", "2015"))
head(ZillowOwn, n=5)


#DATA ANALYSIS


