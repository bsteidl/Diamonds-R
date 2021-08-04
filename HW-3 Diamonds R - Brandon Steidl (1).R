#Keep the template as well as the question(s) and their number(s) intact
#HW-3: Playing with Diamonds
install.packages("ggplot2") #You do this onley Once
library(ggplot2) #To load the ggplot package
data("diamonds") #To load the diamonds dataset which comes with ggplot
library(ggplot2)
data(diamonds)
View(diamonds)
class(diamonds)
dim(diamonds)
names(diamonds)
row.names(diamonds)

#Q1: Use the names() method to get the different names of the columns
colnames(diamonds, do.NULL = FALSE, prefix = "col")

#Q2 Use the str method to get the datatypes of the diamonds columns
str(diamonds)

#Q3 
diamonds$clarity #Will return all the values of the clarity column
##Use the unique() method to get the unique and different values of clarity
unique(diamonds$clarity)

#Q4.1 Use the table() method to get a tabular count of the different clarity(s) 
table(diamonds$clarity)

#Q4.2 plot a barchart (histogram) of the different clarity(s) produced in Q4.1
diamonds$clarity <- as.numeric(diamonds$clarity)
hist(diamonds$clarity)
     
#Q5.1 use the nrow() and ncol methods to get the number of records and number of columns
nrow(diamonds)
ncol(diamonds)

#Q5.2 write the code that returns the nrow and ncol in one method
dim(diamonds)

#Q6 Write the code to get the first 15 records of carat, clarity and price
diamonds[c(1:15),c(1,4,7)]

#Q7 write the code that provides a summary of the carat column
summary(diamonds$carat)


#Q8 Write the code to get all the diamonds whose 
## carat is > 3.0, and cut is Ideal or Premium
count = 0
for (x in diamonds$carat)
  if (diamonds$carat > 3.0 == TRUE && diamonds$cut == "Ideal" || diamonds$cut == "Premium")
    count = count + 1
    print(count)

#Q9  Write the code to separately calculate of carat
## min
min(diamonds$carat)

## 13th percentile
quantile(diamonds$carat, 0.13)

## Q1, 
quantile(diamonds$carat, 0.25)

## Q2,
quantile(diamonds$carat, 0.5)

## mean,
mean(diamonds$carat)

## Q3
quantile(diamonds$carat, 0.75)

## 93rd Percentile
quantile(diamonds$carat, 0.93)

# Q10 if the following was given
Q1= 61
Q3=62.8

#Q11 The following code will calculate the total number of outliers
IQR= Q3 - Q1
UL= Q3 +IQR
LL= Q1-IQR
count=0
for(x in diamonds$depth){
  if( x > UL | x < LL) {
    count = count + 1
  }
}
print(count) #Will print the total upper and lower outliers
#Write the code that seperately calculates and prints the outlier on the upper end asw well as
## the outliers on the lower end
count = 0
for(x in diamonds$depth)
  if(x > UL)
    count = count + 1
print(count)

count = 0
for(x in diamonds$depth)
  if(x > LL)
    count = count + 1
print(count)

#Q12
windows() #Or quartz()
par(mfrow=c(1, 2)) #to split the window into 1 row and 2-columns plotting region

#Q12.1 show a boxplot of the carat, 
## also add a strip chart add a stripchart with method=jitter as well
windows()
par(mfrow=c(1,2))
boxplot(diamonds$carat, data=diamonds)
stripchart(diamonds$carat, vertical=TRUE, 
           add=TRUE, method="stack", col='red', pch=".", cex=2)
stripchart(diamonds$carat, vertical=TRUE, 
           add=TRUE, method="jitter", col='red', pch=".", cex=2)

#Q12.2 Show a boxplot of the carat broken down by cut, 
## also add a strip chart add a stripchart with method=jitter as well
boxplot(diamonds$carat~cut, data=diamonds)
stripchart(diamonds$carat~cut, data=diamonds, vertical=TRUE, 
           add=TRUE, method="jitter", col='red', pch=".", cex=2)

#Q13, 14, 15	Empirical Formula Analysis: With 
mean= 61.75
stdev= 1.43
## any observation that is more than 3 stdevs away from the mean is an outlier, 
## write the R Code to:
### Calculate the number of outliers above the UL, 
### Calculate the number of outliers below the LL, 
Q1=0.4
Q3=1.04
IQR= Q3 - Q1
UL= Q3 +IQR
LL= Q1-IQR

count = 0
for(x in diamonds$carat)
  if(x > UL)
    count = count + 1
print(count)

count = 0
for(x in diamonds$carat)
  if(x > LL)
    count = count + 1
print(count)