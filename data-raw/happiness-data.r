# load libraries
library(tidyverse)
library(mosaic)
library(ggformula)
library(rpart)
library(broom)

# read in data files
happy_files <- list.files(path = "/Users/brandonlebeau/Downloads/world-happiness",
                          full.names = TRUE)
happy_names <- list(
  c('Country', 'Region', 'Happiness_rank', 'Happiness_score', 'Standard_error',
    'Economy_score', 'Family_score', 'Health_score', 'Freedom_score',
    'Trust_score', 'Generosity_score', 'Dystopia_residual'),
  c('Country', 'Region', 'Happiness_rank', 'Happiness_score', 'low_ci', 'high_ci',
    'Economy_score', 'Family_score', 'Health_score', 'Freedom_score',
    'Trust_score', 'Generosity_score', 'Dystopia_residual'),
  c('Country', 'Happiness_rank', 'Happiness_score', 'high_ci', 'low_ci',
    'Economy_score', 'Family_score', 'Health_score', 'Freedom_score',
    'Generosity_score', 'Trust_score',  'Dystopia_residual'),
  c('Happiness_rank', 'Country', 'Happiness_score',
    'Economy_score', 'Family_score', 'Health_score', 'Freedom_score',
    'Generosity_score', 'Trust_score'),
  c('Happiness_rank', 'Country', 'Happiness_score',
    'Economy_score', 'Family_score', 'Health_score', 'Freedom_score',
    'Generosity_score', 'Trust_score')
)
years <- 2015:2019

happy_data <- lapply(1:length(happy_files), function(xx) 
  read_csv(happy_files[xx], col_names = happy_names[[xx]], skip = 1))

# add year
happy_data <- lapply(seq_along(happy_data), function(xx) 
  mutate(happy_data[[xx]], year = years[xx])
  )

happy_data <- lapply(seq_along(happy_data), function(xx) 
  mutate(happy_data[[xx]], Trust_score = as.numeric(Trust_score)))

# bind rows
happy <- bind_rows(
  happy_data
)

# attempt to fill in regions
happy_regions <- select(happy, Country, Region) %>%
  distinct() %>%
  na.omit()

happy <- happy %>%
  select(-Region) %>%
  left_join(happy_regions, by = 'Country')

# remove a few columns
happy <- happy %>%
  select(Country, Region, year, Happiness_score, Economy_score, Family_score, Health_score,
         Freedom_score, Trust_score, Generosity_score)

# save to statthink package
write_csv(happy, path = "data-raw/happiness.csv")
save(happy, file = "data/happiness.rda")
