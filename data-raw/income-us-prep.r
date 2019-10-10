library(tidyverse)
library(ggformula)
library(mosaic)
library(titanic)
library(rpart)
library(rsample)
library(rpart.plot)

theme_set(theme_bw(base_size = 14))

income <- read_csv("/Users/brandonlebeau/Downloads/adult.data", 
                   guess_max = 10000,
                   col_names = c('age', 'workclass', 'fnlwgt', 'education', 
                                 'education_num',
                                 'marital_status', 'occupation', 'relationship',
                                 'race', 'sex', 'capital_gain', 'capital_loss',
                                 'hours_per_week', 'native_country',
                                 'greater_than_50k')) %>%
  filter(native_country == 'United-States',
         occupation != '?', occupation != "Armed-Forces", occupation != "Priv-house-serv") %>%
  select(-education_num, -fnlwgt, -relationship, -capital_gain, -capital_loss) %>%
  mutate(education = fct_collapse(education,
                                  "less-HS" = c('Preschool', '10th', '11th', '12th', '1st-4th', '5th-6th', '7th-8th', '9th'),
                                  Assoc = c('Assoc-acdm', 'Assoc-voc')
                                  ),
         marital_status = fct_collapse(marital_status,
                                       Married = c('Married-AF-spouse', 'Married-civ-spouse', 'Married-spouse-absent')
                                       ),
         workclass = fct_collapse(workclass,
                                  government = c('Federal-gov', 'Local-gov', 'State-gov'),
                                  "self-employ" = c('Self-emp-inc', 'Self-emp-not-inc')
                                  ),
         race = fct_lump(race, n = 2),
         greater_than_50k_num = ifelse(greater_than_50k == ">50K", 1, 0)
         ) %>%
  filter(race != 'Other', workclass != 'Without-pay')

set.seed(2019)
income_sample <- sample_n(income, size = 5000)

write_csv(income_sample, path = "/Users/brandonlebeau/Dropbox/statthink/data-raw/income-us.csv")
