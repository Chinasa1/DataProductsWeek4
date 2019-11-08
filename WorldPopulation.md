
Developing Data Product week 4 Assignment: World Population evolution
========================================================
author:
date: November 9th, 2019
autosize: true

Overview
========================================================

-This presentation contains the documentation of the shiny app created to manipulate world population evolution since 1950.

- The source data can be found in this site <https://www.worldometers.info/world-population/world-population-by-year/>

- The application builds a plot of world population of the selected year range.

- The yearly evolution is computed.

Server UI Part 2
========================================================

The data is download from: https://raw.githubusercontent.com/Chinasa1/DataProductsWeek4/master/historical_pop.csv

The year range is taken from user input

```
  Year World_Population Yearly_Change Net_Change Density  Urban_Pop
1 2019       7713468100          1.08   82377060      52 4299438618
2 2018       7631091040          1.10   83232115      51 4219817318
  Urban_Pop_Perc
1             56
2             55
```

Server UI Part 2
========================================================

The data is taken in the range of the given years


The population change is the calculated

```r
    maxPop <- popData[popData$Year == iMaxYear, 2]
    minPop <- popData[popData$Year == iMinYear, 2]

    #format the yearly difference of the population
    diff <- format(maxPop-minPop, decimal.mark=",",  big.mark=", ",small.mark=".", small.interval=3)
```

The Conclusion
========================================================

With this course we've learned how to develop web application with R using shiny package

This project allows us to practice and have hands-on with shiny

Thou the application presented here is an easy one.

The source code of the application can be found in [github]

[github]: https://github.com/Chinasa1/DataProductsWeek4
