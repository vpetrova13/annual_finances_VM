library(tidyverse)

data <- read_csv("clean_data/finance_clean_data.csv")

value_adjust <- c(-50:50)
data_synth <- data %>%
  mutate(adjust_num = sample(value_adjust, size = nrow(data), replace = TRUE)) %>%
  mutate(value_synth = value + adjust_num) %>%
  select(-adjust_num)

data_synth <- data_synth %>%
  mutate(adjust_num = sample(value_adjust, size = nrow(data), replace = TRUE)) %>%
  mutate(balance_synth = balance + adjust_num) %>%
  select(-adjust_num)

data_synth <- data_synth %>% 
  select(-c(value, balance)) %>% 
  rename(value = value_synth) %>% 
  rename(balance = balance_synth)

write_csv(data_synth, "finance_clean_synthetic.csv")