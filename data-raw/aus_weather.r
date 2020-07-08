library(readr)

aus_weather <- read_csv("data-raw/weatherAUS.csv",
                        guess_max = 100000) %>%
  na.omit() %>%
  select(-Evaporation, -Sunshine, -Cloud9am, -Cloud3pm)

save(aus_weather, file = 'data/aus_weather.rda')
