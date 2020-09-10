library(readr)
library(lubridate)
library(dplyr)

cal_fire <- read_csv("data-raw/cal-fire-9-10-2020.csv")

cal_fire <- cal_fire %>%
  mutate(year_started = year(incident_dateonly_created),
         month_started = month(incident_dateonly_created),
         day_started = day(incident_dateonly_created),
         year_extinguished = year(incident_dateonly_extinguished),
         month_extinguished = month(incident_dateonly_extinguished),
         day_extinguished = day(incident_dateonly_extinguished)
         )

save(cal_fire, file = 'data/cal_fire.rda')
