library(tidyverse)
library(synthpop)

data <- read_csv("clean_data/finance_clean_data.csv")
data <- data %>% 
  select(-description)
codebook.syn(data)
mysyn <- syn(data)
summary(mysyn)

compare(mysyn, data, stat = "counts")
