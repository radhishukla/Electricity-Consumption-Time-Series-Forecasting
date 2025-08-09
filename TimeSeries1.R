# creating a dataframe from our dataset
mydata <- read.csv("C:\\Users\\victus\\Downloads\\opsd_germany_daily.txt", header = TRUE, row.names="Date")
mydata

#looking at part of dataframe using head() or tail()
head(mydata)
tail(mydata)

#view data in tabular format
View(mydata)

#Retrieve the dimension of object
dim(mydata)

#check datatype of each column in dataframe
str(mydata)

#looking at date column (will not show data as its index)
head(mydata$Date)

#looking at row names (indexes)
row.names(mydata)

#accessing a specific row
mydata["2006-01-01",]
mydata["2017-08-10",]

#accessing multiple rows

mydata[c("2006-01-01","2006-01-04"),]

summary(mydata)

#without parsing date column
mydata2 <- read.csv("C:\\Users\\victus\\Downloads\\opsd_germany_daily.txt", header = TRUE)
mydata2

#look at Date column
str(mydata2$Date)

#convert into date format
x <- as.Date(mydata2$Date)
head(x)
class(x)
str(x)

#create year, month, day columns
year <- as.numeric(format(x,'%Y'))
head(year)

month <- as.numeric(format(x,'%m'))
head(month)

day <- as.numeric(format(x,'%d'))
head(day)

head(mydata2)

#add columns to the existing dataframe

mydata2 <- cbind(mydata2,year,month,day)
head(mydata2)
mydata2[1:3]
head(sample(mydata2,8))

#Let's create a line plot of the full time series of Germany's
# daily electricity consumption, using the DataFrame's plot() method.

#using PLOT()

#Option 1:
plot(mydata2$year,mydata2$Consumption,type="l",xlab = "year", ylab="Consumption")

#Option 2:
plot(mydata2$year,mydata2$Consumption, type="l",xlab="year",ylab="Consumption",lty=1,ylim=c(800,1700),xlim=c(2006,2018))

#Better Options
#Option 3:
# for one plot/window
par(mfrow=c(1,1))
plot(mydata2[,2])

#Option 4
plot(mydata2[,2], xlab="year", ylab="Consumption")
plot(mydata2[,2], xlab="year", ylab="Consumption",type="l",lwd=2,col="blue")
plot(mydata2[,2], xlab="year", ylab="Consumption",type="l",lwd=2,xlim=c(0,2018))
plot(mydata2[,2], xlab="year", ylab="Consumption",type="l",lwd=2,xlim=c(2016,2018))

#Taking log values of consumption and take differences of logs
plot(10*diff(log(mydata2[,2])),xlab="year", ylab="Consumption",type="l",lwd=2,ylim=c(-5,5),main="Consumption Graph",col="orange")

#using ggplot()

library(ggplot2)

#Option 1
ggplot(mydata2,type="o")+geom_line(aes(x=year,y=Consumption))

#Option 2
ggplot(data=mydata2, aes(x=year,y=Consumption,group=1))+geom_line()+geom_point()

#Option 3
ggplot(data=mydata2, aes(x=year,y=Consumption,group=1))+geom_line(linetype="dashed")+geom_point()

ggplot(data=mydata2,mapping=aes(x=year,y=Consumption,col="red"))+geom_point()

# we can see that the plot() method has chosen pretty good tick locations (every two years) and labels (the years)
# for the x axis which is helpful. However with so many data points, the line plot is crowded and hard to read.
# Thus we can go with plot()
# Plot the data considering the solar and wind time series too.

mydata2

#wind column
min(mydata2[,3],na.rm=T)
max(mydata2[,3],na.rm=T)

#Consumption Column
min(mydata2[,2],na.rm=T)
max(mydata2[,2],na.rm=T)

#Solar
min(mydata2[,4],na.rm=T)
max(mydata2[,4],na.rm=T)

#Wind + Solar
min(mydata2[,5],na.rm=T)
max(mydata2[,5],na.rm=T)

# for multiple plots
par(mfrow=c(3,1))

#or

plot1 <- plot(mydata2[,2],xlab="year",ylab="Daily Totals(Gwh)",type="l",lwd=2,main="Consumption",col="orange",ylim=c(840,1750))
#plot1<-plot(mydata2[,1],mydata2[,2],xlab="year",ylab="Daily Totals(Gwh)",type="l",lwd=2,main="Consumption",col="orange",ylim=c(840,1750))

# Convert first column to Date
mydata2[,1] <- as.Date(mydata2[,1])

# Plot it!
plot(mydata2[,1], mydata2[,2],
     xlab = "Year",
     ylab = "Daily Totals (GWh)",
     type = "l",
     lwd = 2,
     main = "Consumption",
     col = "orange",
     ylim = c(840, 1750))

#test <- mydata3$moddate [mydata3$moddate>='2006-01-01' & mydata3$moddate<='2006-01-31]
#test

plot2 <- plot(mydata2[,4],xlab="year",ylab="Daily Totals (GWh)",type="l",main="Solar",ylim=c(0,500),col="blue")
plot2 <- plot(mydata2[,3],xlab="year",ylab="Daily Totals (GWh)",type="l",main="Solar",ylim=c(0,500),col="blue")
plot3 <- plot(mydata2[,3],xlab="year",ylab="Daily Totals (GWh)",type="l",main="Wind",ylim=c(0,900),col="red")
plot3 <- plot(mydata2[,1],xlab="year",ylab="Daily Totals (GWh)",type="l",main="Wind",ylim=c(0,900),col="red")

#1 plot/window
par(mfrow=c(1,1))

#lets plot time series in a single year to investigate further
str(mydata2)
x <- as.Date(mydata2$Date)
head(x)
class(x)
str(x)

# to convert date column into date format
moddate <- as.Date(x,format="%m/%d/%Y")

str(moddate)
mydata3 <- cbind(moddate,mydata2)
head(mydata3)
str(mydata3)

mydata4 = subset(mydata3, subset=mydata3$moddate>='2017-01-01' & mydata3$moddate<='2017-12-31')
head(mydata4)

plot4 <- plot(mydata4[,1],mydata4[,3],xlab="year",ylab="Daily Totals(GWh)",type="l",lwd=2,main="Consumption",col="orange")
