In this project, I analyzed bike usage data of annual members and casual bike riders from last 12 months. The business task was to convert maximum number of casual riders to member riders, with purchased memberships. The data consisted of over 1 billion rows, which made using R a better choice to analyze it. 
First, I installed and loaded tidyverse, janitor, and lubridate packages in RStudio. 
Next, I imported bike usage data from July 2021 to June 2022 into RStudio, and created a new dataframe by merging 12 different datasets from 12 different months. After that, I cleaned the new merged dataframe by removing extra spaces etc and removing empty columns and rows.
Next, I made new columns extracting day_of_week, starting hour of the bike rides, months of the rides, and trip duration. I removed all the rows containing 0 for trip duration.
I also wanted to use this cleaned and newly-created dataframe to create visualizations with Tableau. So, I used write.csv to save this dataframe as a .csv file to use with Tableau later.
Next, I created diferent charts as shown below to analyze and get insights from our data.

![image](https://user-images.githubusercontent.com/99208128/201503465-7fae7135-dbd2-4167-8fd7-ab50385c331a.png)
This bar chart clearly shows us that although there is a high number of casual riders throughout the year, July and August are the peak months for casual bike riders. This could be due to summer tourism in those months, where the riders rent bikes temporarily for their trips instead of buying memberships. 

![image](https://user-images.githubusercontent.com/99208128/201503720-4c4a9929-71ca-4b24-a993-f5e228932c28.png)
Maximum number of casual riders ride on Saturday and Sunday. Again, the reason could be the influx of visitors or tourists on the weekends, who prefer to pay-per-ride than buy memberships.

![image](https://user-images.githubusercontent.com/99208128/201503841-aeb880f4-588e-413b-84a6-b6fec79de00a.png)
If we look at the above histograms, again, we see that the maximum number of casual riders ride on Sunday and Saturday afternoons and early evenings.

When I did descriptive analysis, I also noticed that Casual riders are riding almost twice as long as the members.



Also, casual riders took 2557887 rides in total, whereas members took 3341852 rides in total.
         

We have anlayzed the days, times, and months of rides by casual riders and members, their ride lengths, total number of rides, time length of their rides etc. Now, let's not forget to analyze the most popular start and end stations for both type of riders.
 
For members, Kingsbury St & Kinzie St are the most popular start as well as end stations.
 
For casual riders, Streeter Dr & Grand Ave are the most popular start and end stations, with Millennium Park scoring 2nd on the list. 

Conclusion: To Act on the business insights received from this project, it is important to spend the most on marketing to target the casual bike riders during July and August, and also on the weekends. It is also necessary to target the marketing for casual riders at, at least their top three popular stations. Discounted coupons for annual memberships and Flyers pointing the benefits of annual memberships are an option to encourage the casual riders to buy annual memberships. Email marketing is not an option for us here because we were not given the access to customers' information or credit card information or emails due to legal concerns.
