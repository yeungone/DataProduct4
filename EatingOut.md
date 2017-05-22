Predicting how much Americans spend on eating out (1935 to 2014)
========================================================
author: M. Yeung
date: May 21, 2017
autosize: true


Overview
========================================================

This project is part of the Coursera Data Science Specilization Series for Developing Data Products

The application source code (UI.R and Server.R) can be found https://github.com/yeungone/DataProduct4





Predicting how much Americans spend, in Billions of dollar,  on eating out per year 
========================================================



- In this application, we will predict how much money, in Billions of dollars, is spent eating out by Americans
- Given the year, between 1935 to 2014 and using data from: United States Department of Agriculture
- Two types of regression model are used: Linear vs Polynomial


Eating Out Data Set
========================================================
The data used comes from United States Department of Agriculture
https://www.ers.usda.gov/data-products/food-expenditures.aspx

Using the data from total expenditures from eating out


```r
food <- read.csv("EatingOut.csv", na.strings=c("NA","#DIV/0!",""))
summary(food)
```

```
      Year          Eating      
 Min.   :1935   Min.   :  6.71  
 1st Qu.:1955   1st Qu.: 31.66  
 Median :1974   Median : 76.83  
 Mean   :1974   Mean   :175.49  
 3rd Qu.:1994   3rd Qu.:316.42  
 Max.   :2014   Max.   :615.79  
```

Plot
========================================================
Comparison of Linear vs Ploynomial regression model reference to actual dollars spent
The interactive application can be found
https://yeungone.shinyapps.io/lesson_4_-_hw_1/

![Eating Out](Eatingout.png)



