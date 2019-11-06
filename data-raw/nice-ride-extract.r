library(tidyverse)
library(lubridate)

# urls
nice_ride <- c("https://s3.amazonaws.com/niceride-data/201910-niceride-tripdata.csv.zip",
               "https://s3.amazonaws.com/niceride-data/201909-niceride-tripdata.csv.zip",
               "https://s3.amazonaws.com/niceride-data/201908-niceride-tripdata.csv.zip",
               "https://s3.amazonaws.com/niceride-data/201907-niceride-tripdata.csv.zip",
               #"https://s3.amazonaws.com/niceride-data/201906-niceride-tripdata.csv.zip",
               "https://s3.amazonaws.com/niceride-data/201905-niceride-tripdata.csv.zip",
               "https://s3.amazonaws.com/niceride-data/201904-niceride-tripdata.csv.zip")

# unzip files
load_zip_file <- function(url, name = NULL) {
  temp <- tempfile()
  download.file(url,temp)
  if(is.null(name)) {
    name <- unlist(strsplit(gsub("\\.zip$", "", url), "\\/"))
    name <- name[length(name)]
  }
  read_csv(unz(temp, name),
           col_names = c('tripduration',
                         'start_time',
                         'end_time',
                         'start_station',
                         'start_station_name',
                         'start_station_lat',
                         'start_station_long',
                         'end_station',
                         'end_station_name',
                         'end_station_lat',
                         'end_station_long',
                         'bikeid',
                         'usertype',
                         'birth_year',
                         'sex',
                         'bike_type'),
           skip = 1)
}

# iterate over urls
nice_ride_data <- lapply(nice_ride, load_zip_file)
nice_ride_data_06 <- load_zip_file("https://s3.amazonaws.com/niceride-data/201906-niceride-tripdata.csv.zip",
                                   name = "2001906-niceride-tripdata.csv")

# combine into single dataframe
nice_ride <- bind_rows(
  nice_ride_data,
  nice_ride_data_06
) %>%
  mutate(month = month(start_time),
         year = year(start_time),
         day = day(start_time),
         hour = hour(start_time),
         minute = minute(start_time),
         morning = case_when(
           hour > 4 & hour < 12 ~ "Morning",
           hour <= 4 | hour > 21 ~ "Night",
           TRUE ~ "Afternoon"
         )
         ) %>%
  select(-start_time, -end_time, -start_station_lat, -start_station_long,
         -end_station_lat, -end_station_long)
