#Install packages
install.packages('tidyverse')
install.packages('janitor')
install.packages('lubridate')

#Load packages
library(tidyverse)
library(janitor)
library(lubridate)

#Import csv files to RStudio and rename them
Jul2021 <- read_csv("Bike_data/202107-divvy-tripdata.csv")
Aug2021 <- read_csv("Bike_data/202108-divvy-tripdata.csv")
Sep2021 <- read_csv("Bike_data/202109-divvy-tripdata.csv")
Oct2021 <- read_csv("Bike_data/202110-divvy-tripdata.csv")
Nov2021 <- read_csv("Bike_data/202111-divvy-tripdata.csv")
Dec2021 <- read_csv("Bike_data/202112-divvy-tripdata.csv")
Jan2022 <- read_csv("Bike_data/202201-divvy-tripdata.csv")
Feb2022 <- read_csv("Bike_data/202202-divvy-tripdata.csv")
Mar2022 <- read_csv("Bike_data/202203-divvy-tripdata.csv")
Apr2022 <- read_csv("Bike_data/202204-divvy-tripdata.csv")
May2022 <- read_csv("Bike_data/202205-divvy-tripdata.csv")
Jun2022 <- read_csv("Bike_data/202206-divvy-tripdata.csv")

#Check field formatting
str(Jul2021)
str(Aug2021)
str(Sep2021)
str(Oct2021)
str(Nov2021)
str(Dec2021)
str(Jan2022)
str(Feb2022)
str(Mar2022)
str(Apr2022)
str(May2022)
str(Jun2022)

#Create new dataframe by merging all 12 datasets and name it merged_data
merged_data <- bind_rows(Jul2021, Aug2021, Sep2021, Oct2021, Nov2021, Dec2021, Jan2022, Feb2022, Mar2022, Apr2022, May2022, Jun2022)

#Clean data & remove extra spaces, parenthesis etc.
merged_data <-clean_names(merged_data)
  
#Remove empty columns and rows in our dataframe 
remove_empty(merged_data, which=c())
                         
#to see more rows
'print(n=...)'

#Find day of week by using wday()
merged_data$day_of_week <-wday(merged_data$started_at, label=T, abbr = T)

#Use format(as.POSIXct) to extract a certain TIME HOUR FORMAT
merged_data$starting_hour <-format(as.POSIXct(merged_data$started_at), '%H')

#Extract the date using format(as.Date)
merged_data$month <-format(as.Date(merged_data$started_at), '%m')

#Find trip duration using difftime()
merged_data$trip_duration <-difftime(merged_data$ended_at, merged_data$started_at, units = 'sec')

#Remove rows where trip_duration  <= 0
cleaned_df <-merged_data[!(merged_data$trip_duration<=0),]

#Lets export our cleaned_df using write.csv, to use it with Tableau
write.csv(cleaned_df, file='Capstone_df.csv')

#Graph number of rides by rider type on different days of week
#Use options(scipen=) to remove scientific values from graphs
options(scipen=999)
ggplot(data=cleaned_df)+
  aes(x = day_of_week, fill = member_casual)+
  geom_bar(position = 'dodge') +
  labs(x = 'Day of Week', y = 'Number of Rides', fill = 'Member Type', title = 'Number of Rides by Member Type' )
ggsave("number_of_rides_by_member_type.png")

#Graph number of rides by rider type per month
ggplot(data = cleaned_df) +
  aes(x = month, fill = member_casual)+
  geom_bar ( position = 'dodge') +
  labs( x = 'Month', y = 'Number of Rides', fill = 'Member Type', title = 'Number of Rides per Month')
ggsave("number_of_rides_per_month.png")

#Graph hourly use of bikes throughout the week by rider type
#Use Facet_wrap() a create panels
#Use element_text(size = ) to reduce text size to fit the charts
#Use dpi to save chart for higher resolution for clarity on bigger screens

ggplot(data = cleaned_df) +
  aes (x = starting_hour, fill = member_casual) +
  facet_wrap(~day_of_week) +
  geom_bar()+
  labs(x= ' Starting Hour', y = 'Number of Rides', fill = 'Member Type', title = 'Hourly use of Bikes throughout the week')+
  theme(axis.text = element_text (size = 5))
ggsave ("Hoursly_use_of_bikes_throughout_the_week.png", dpi = 1000)

#Use aggregate() to calculate mean trip duration
aggregate(cleaned_df$trip_duration~cleaned_df$member_casual + cleaned_df$day_of_week, FUN = mean)

#Find ride lengths using start time and end time and name the new column ride_length
cleaned_df$ride_length <- difftime(cleaned_df$ended_at, cleaned_df$started_at)

#Lets see how are columns are structured one more time
str(cleaned_df)

#Change ride_length to numeric so we can run our calculations later
cleaned_df$ride_length <-as.numeric(as.character(cleaned_df$ride_length))

#Check if ride_length is numeric now
is.numeric(cleaned_df$ride_length)

#Lets install package and library geosphere to work with latitudes and longitudes 

install.packages ("geosphere")
library(geosphere)

#Now we find the ride distance and name the new column ride_distance
cleaned_df$ride_distance <- distGeo(matrix(c(cleaned_df$start_lng, cleaned_df$start_lat), ncol=2),
                                    matrix(c(cleaned_df$end_lng, cleaned_df$end_lat), ncol=2))

#Lets view a quick summary of data now
summary(cleaned_df)

#Calculate average, median, max and min ride lengths and group them separately for members and casual riders
cleaned_df %>%
  group_by(member_casual) %>%
    summarize(average_ride_length = mean(ride_length), median_length = median(ride_length), 
              max_ride_length = max(ride_length), min_ride_length = min(ride_length))

#Lets find out who takes more rides by calculating the total number of rides for members and casuals
cleaned_df %>%
  group_by(member_casual) %>%
  summarize(ride_count = length(ride_id))

#Lets look at the mean distance covered by members and casual riders
cleaned_df %>%
  group_by(member_casual) %>% drop_na() %>%
  summarize (average_ride_distance = mean(ride_distance)) %>%
  ggplot() +
  geom_col(mapping = aes (x = member_casual, y= average_ride_distance, fill = member_casual), show.legend = FALSE)+
  labs(title = "Average distance covered by Members and Casual Riders")
  
#Find the most popular stations using count, and filter functions and by making new dataframes for annual members and casual riders
annual_mem_df <- filter(cleaned_df, member_casual == 'member')
count(annual_mem_df, start_station_name, sort = T)
count(annual_mem_df, end_station_name, sort = T)

casual_mem_df <-filter(cleaned_df, member_casual == 'casual')
count(casual_mem_df, start_station_name, sort = T)
count(casual_mem_df, end_station_name, sort = T)
