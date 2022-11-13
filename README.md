BikeShare 
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

1                    casual                    Sun           2067.6086 secs
2                    member                    Sun            881.4162 secs
3                    casual                    Mon           1837.7099 secs
4                    member                    Mon            758.2602 secs
5                    casual                    Tue           1544.8222 secs
6                    member                    Tue            731.5243 secs
7                    casual                    Wed           1544.6104 secs
8                    member                    Wed            732.5412 secs
9                    casual                    Thu           1634.0557 secs
10                   member                    Thu            747.8117 secs
11                   casual                    Fri           1696.1002 secs
12                   member                    Fri            763.6394 secs
13                   casual                    Sat           1934.4052 secs
14                   member                    Sat            871.8730 secs

Here's the average, median, max and min ride lengths grouped seperately for members and casual riders.

member_casual     average_ride_length     median_length   max_ride_length   min_ride_length
                         
1 casual                      1789.           891           2946429              1
2 member                      779.           544           93594                 1


Let's see who took more rides in total.

member_casual      ride_count
 
1 casual           2557887
2 member           3341852

We have anlayzed the days, times, and months of rides by casual riders and members, their ride lengths, total number of rides, time length of their rides etc. 
Now, let's not forget to analyze the most popular start and end stations for both type of riders.

  #For members
  start_station_name                n
                            
 1 NA                           476042
 2 Kingsbury St & Kinzie St      26246
 3 Clark St & Elm St             24186
 4 Wells St & Concord Ln         23908
 5 Wells St & Elm St             21157
 6 Ellis Ave & 60th St           19786
 7 Clinton St & Madison St       19396
 8 University Ave & 57th St      19303
 9 Clinton St & Washington Blvd  19168
10 Dearborn St & Erie St         18964



   end_station_name                  n
                            
 1 NA                           474740
 2 Kingsbury St & Kinzie St      26021
 3 Wells St & Concord Ln         24586
 4 Clark St & Elm St             24382
 5 Wells St & Elm St             21446
 6 Clinton St & Madison St       19990
 7 Clinton St & Washington Blvd  19989
 8 University Ave & 57th St      19876
 9 Dearborn St & Erie St         19316
10 Ellis Ave & 60th St           19287

For members, Kingsbury St & Kinzie St are the most popular start as well as end stations.

#For casual riders

start_station_name                      n
                                  
 1 NA                                 359946
 2 Streeter Dr & Grand Ave             65470
 3 Millennium Park                     30812
 4 DuSable Lake Shore Dr & Monroe St   29315
 5 Michigan Ave & Oak St               28745
 6 DuSable Lake Shore Dr & North Blvd  24323
 7 Shedd Aquarium                      22491
 8 Theater on the Lake                 20800
 9 Wells St & Concord Ln               19581
10 Clark St & Lincoln Ave              16223

   end_station_name                        n
                                 
 1 NA                                 416979
 2 Streeter Dr & Grand Ave             67584
 3 Millennium Park                     31775
 4 Michigan Ave & Oak St               30158
 5 DuSable Lake Shore Dr & North Blvd  27928
 6 DuSable Lake Shore Dr & Monroe St   27120
 7 Theater on the Lake                 21905
 8 Shedd Aquarium                      21292
 9 Wells St & Concord Ln               18815
10 Clark St & Lincoln Ave              16136

For casual riders, Streeter Dr & Grand Ave are the most popular start and end stations, with Millennium Park scoring 2nd on the list. 
