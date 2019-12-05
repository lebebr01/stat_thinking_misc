library(tidyverse)

life_expectancy <- read_csv("/Users/brandonlebeau/Downloads/Life Expectancy Data.csv",
                            col_names = c('Country', 'Year', 'Status', 'Life_expec',
                                          'adult_mortality', 'infant_deaths',
                                          'alcohol', 'percent_expend',
                                          'hepatitis_b_immunization', 'measles_rate',
                                          'bmi', 'under_five_deaths', 'polio_immunization',
                                          'total_expend', 'diphtheria_immunization',
                                          'HIV_AIDS_deaths', 'gdp', 'population',
                                          'thinness_1019', 'thinness_59',
                                          'income_composition', 'schooling'),
                            skip = 1)

# save
write_csv(life_expectancy, path = 'Data-raw/life_expectancy.csv')
save(life_expectancy, file = 'Data/life_expectancy.rda')
