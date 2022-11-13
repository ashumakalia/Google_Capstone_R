BikeShare 
In this project, I analyzed bike usage data of annual members and casual bike riders from last 12 months. The business task was to convert maximum number of casual riders to member riders, with purchased memberships. The data consisted of over 1 billion rows, which made using R a better choice to analyze it. 
First, I installed and loaded tidyverse, janitor, and lubridate packages in RStudio. 
Next, I imported bike usage data from July 2021 to June 2022 into RStudio, and created a new dataframe by merging 12 different datasets from 12 different months. After that, I cleaned the new merged dataframe by removing extra spaces etc and removing empty columns and rows.
Next, I made new columns extracting day_of_week, starting hour of the bike rides, months of the rides, and trip duration. I removed all the rows containing 0 for trip duration.
I also wanted to use this cleaned and newly-created dataframe to create visualizations with Tableau. So, I used write.csv to save this dataframe as a .csv file to use with Tableau later.
Next, I created diferent graphs and charts as shown below. 

![image](https://user-images.githubusercontent.com/99208128/201503465-7fae7135-dbd2-4167-8fd7-ab50385c331a.png)
