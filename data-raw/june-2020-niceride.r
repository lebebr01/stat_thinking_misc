library(tidyverse)
library(lubridate)


nice_ride_2020 <- read_csv("data-raw/202006-niceride-tripdata.csv",
                           guess_max = 100000)

# calculate trip data
nice_ride_2020 <- nice_ride_2020 %>%
  mutate(tripduration_seconds = as.numeric(difftime(ended_at, started_at, units = 'secs')),
         tripduration_minutes = as.numeric(difftime(ended_at, started_at, units = 'mins'))) %>%
  select(ride_id, rideable_type, started_at, ended_at, member_casual, tripduration_seconds, tripduration_minutes) %>%
  filter(tripduration_minutes < 240)

readr::write_csv(nice_ride_2020, path = 'data-raw/nice_ride_2020_June.csv')
