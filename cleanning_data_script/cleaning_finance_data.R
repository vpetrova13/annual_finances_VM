## Load libraries and read data
library(tidyverse)
library(janitor)
library(here)
library(lubridate)

raw_data <- read_csv(here("raw_data/MOROZV10660239-20201101.csv"))

## Remove unneeded columns 
finance_data <- raw_data %>% 
  clean_names() %>% 
  select(-account_number, -account_name, -x8)

## Change abbreviations to full names
finance_data <- finance_data %>% 
  mutate(type = str_replace_all(type, "D/\\D", replacement = "direct debit")) %>% 
  mutate(type = str_replace_all(type, "DPC", "digital banking payment")) %>% 
  mutate(type = str_replace_all(type, "BAC", "bank automated clearing")) %>% 
  mutate(type = str_replace_all(type, "POS", "point of sale")) %>% 
  mutate(type = str_replace_all(type, "INT", "interest")) %>% 
  mutate(type = str_replace_all(type, "LON", "loan")) %>% 
  mutate(type = str_replace_all(type, "C/\\L", "cash line")) %>% 
  mutate(type = str_replace_all(type, "ITL", "international transfer")) 

## Optimise description for further easier analysis
finance_data_clean <- finance_data %>% 
  mutate(date = str_remove(date, "^[0-9]{2}\\/")) %>% 
  mutate(description = str_to_lower(description)) %>% 
  mutate(description = str_remove(description, "\\'")) %>% 
  mutate(description = str_remove_all(description, "\\d+")) %>% 
  mutate(description = str_remove_all(description, "[:punct:]")) %>% 
  mutate(description = str_trim(description)) %>% 
  mutate(description = str_remove_all(description, "lvp")) %>% 
  mutate(description = str_extract_all(description, "[a-z]{4,}")) %>% 
  mutate(description = str_remove(description, "c[:punct:]+")) %>% 
  mutate(description = str_replace_all(description, ",", " " )) %>% 
  mutate(description = str_remove_all(description, "[:punct:]+")) 


## Assign each payment to group
finance_data_clean <- finance_data_clean %>% 
  mutate(categories = case_when(description == "personal  loan" ~ "car loan",
                                description == "council"  ~ "council tax",
                                description == "moneybox"  ~ "LISA",
                                description == "platinum  online  pymt"  ~ "credit card",
                                description == "savings  mobile  pymt"  ~ "savings"))

## Change date column from character to date type
finance_data_clean <- finance_data_clean %>% 
  #add days
  mutate(date = str_c(date, "/01")) %>% 
  #change to date type
  mutate(date = myd(date))

#check class of date column
class(finance_data_clean$date)

#remove sensitive data
finance_data_clean <- finance_data_clean %>% 
  select(-description)

## Write csv file of clean data
write_csv(finance_data_clean, "finance_clean_data.csv")

