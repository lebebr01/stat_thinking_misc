library(readr)

baby <- read_csv("https://raw.githubusercontent.com/data-8/textbook/gh-pages/data/baby.csv")

readr::write_csv(baby, path = "data-raw/baby.csv")
