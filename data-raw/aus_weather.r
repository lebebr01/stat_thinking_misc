library(readr)

aus_weather <- read_csv("data-raw/weatherAUS.csv",
                        guess_max = 100000)
