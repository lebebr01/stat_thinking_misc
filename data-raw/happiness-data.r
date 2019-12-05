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

# Creating a new column for continents

happy$Continent <- NA

happy$Continent[which(happy$Country %in% c("Israel", "United Arab Emirates", "Singapore", "Thailand", "Taiwan Province of China",
                                                   "Qatar", "Saudi Arabia", "Kuwait", "Bahrain", "Malaysia", "Uzbekistan", "Japan",
                                                   "South Korea", "Turkmenistan", "Kazakhstan", "Turkey", "Hong Kong S.A.R., China", "Philippines",
                                                   "Jordan", "China", "Pakistan", "Indonesia", "Azerbaijan", "Lebanon", "Vietnam",
                                                   "Tajikistan", "Bhutan", "Kyrgyzstan", "Nepal", "Mongolia", "Palestinian Territories",
                                                   "Iran", "Bangladesh", "Myanmar", "Iraq", "Sri Lanka", "Armenia", "India", "Georgia",
                                                   "Cambodia", "Afghanistan", "Yemen", "Syria"))] <- "Asia"
happy$Continent[which(happy$Country %in% c("Norway", "Denmark", "Iceland", "Switzerland", "Finland",
                                                   "Netherlands", "Sweden", "Austria", "Ireland", "Germany",
                                                   "Belgium", "Luxembourg", "United Kingdom", "Czech Republic",
                                                   "Malta", "France", "Spain", "Slovakia", "Poland", "Italy",
                                                   "Russia", "Lithuania", "Latvia", "Moldova", "Romania",
                                                   "Slovenia", "North Cyprus", "Cyprus", "Estonia", "Belarus",
                                                   "Serbia", "Hungary", "Croatia", "Kosovo", "Montenegro",
                                                   "Greece", "Portugal", "Bosnia and Herzegovina", "Macedonia",
                                                   "Bulgaria", "Albania", "Ukraine"))] <- "Europe"
happy$Continent[which(happy$Country %in% c("Canada", "Costa Rica", "United States", "Mexico",
                                                   "Panama","Trinidad and Tobago", "El Salvador", "Belize", "Guatemala",
                                                   "Jamaica", "Nicaragua", "Dominican Republic", "Honduras",
                                                   "Haiti"))] <- "North America"
happy$Continent[which(happy$Country %in% c("Chile", "Brazil", "Argentina", "Uruguay",
                                                   "Colombia", "Ecuador", "Bolivia", "Peru",
                                                   "Paraguay", "Venezuela"))] <- "South America"
happy$Continent[which(happy$Country %in% c("New Zealand", "Australia"))] <- "Australia"
happy$Continent[which(is.na(happy$Continent))] <- "Africa"

# save to statthink package
write_csv(happy, path = "data-raw/happiness.csv")
save(happy, file = "data/happiness.rda")
