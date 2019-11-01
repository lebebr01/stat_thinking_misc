library(readr)

baby <- read_csv("https://raw.githubusercontent.com/data-8/textbook/gh-pages/data/baby.csv",
                 col_names = c('birth_weight',
                               'gestational_days',
                               'maternal_age',
                               'maternal_height',
                               'maternal_pregnancy_weight',
                               'maternal_smoker'),
                 skip = 1)

readr::write_csv(baby, path = "data-raw/baby.csv")
