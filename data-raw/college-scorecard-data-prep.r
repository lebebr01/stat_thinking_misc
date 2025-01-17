library(tidyverse)

college_score <- read_csv('data-raw/College-scorecard-reduced.csv',
                          guess_max = 10000)

college_score <- college_score %>%
  select(INSTNM, CITY, STABBR, PREDDEG, REGION, LOCALE,
         ADM_RATE, ACTCMMID, UGDS,
         COSTT4_A, COSTT4_P, TUITIONFEE_IN, TUITIONFEE_OUT,
         DEBT_MDN, GRAD_DEBT_MDN, FEMALE) %>%
  mutate(PREDDEG = fct_recode(factor(PREDDEG),
                              'Not Classified' = '0',
                              'Certificate Degree' = '1',
                              'Associate Degree' = '2',
                              'Bachelor Degree' = '3',
                              'Entirely Graduate Degree' = '4'),
         REGION = fct_recode(factor(REGION),
                             'US Service Schools' = '0',
                             'New England' = '1',
                             'Mid East' = '2',
                             'Great Lakes' = '3',
                             'Plains' = '4',
                             'Southeast' = '5',
                             'Southwest' = '6',
                             'Rocky Mountains' = '7',
                             'Far West' = '8',
                             'Outlying Areas' = '9'),
         LOCALE = fct_recode(factor(LOCALE),
                             'City: Large' = '11',
                             'City: Midsize' = '12',
                             'City: Small' = '13',
                             'Suburb: Large' = '21',
                             'Suburb: Midsize' = '22',
                             'Suburb: Small' = '23',
                             'Town: Fringe' = '31',
                             'Town: Distant' = '32',
                             'Town: Remote' = '33',
                             'Rural: Fringe' = '41',
                             'Rural: Distant' = '42',
                             'Rural: Remote' = '43',
                             'NA' = '-3',
                             'NA' = 'NULL'),
         # CCBASIC = fct_recode(factor(CCBASIC),
         #                      NA = '-2',
         #                      NA = 'NULL'),
         # CCUGPROF = fct_recode(factor(CCUGPROF),
         #                       ),
         # CCSIZSET = fct_recode(factor(CCSIZSET),
         #                       ),
         ADM_RATE = as.numeric(ADM_RATE),
         ACTCMMID = as.numeric(ACTCMMID),
         UGDS = as.numeric(UGDS),
         COSTT4_A = as.numeric(COSTT4_A),
         COSTT4_P = as.numeric(COSTT4_P),
         TUITIONFEE_IN = as.numeric(TUITIONFEE_IN),
         TUITIONFEE_OUT = as.numeric(TUITIONFEE_OUT),
         DEBT_MDN = as.numeric(DEBT_MDN),
         GRAD_DEBT_MDN = as.numeric(GRAD_DEBT_MDN),
         FEMALE = as.numeric(FEMALE)) %>%
  rename_all(tolower)

write_csv(college_score, path = 'data-raw/College-scorecard-4143.csv')

# Filter based on region of country
college_score_plains <- college_score %>%
  filter(region == 'Plains')

write_csv(college_score_plains, path = 'data-raw/College-scorecard-4143-plains.csv')

