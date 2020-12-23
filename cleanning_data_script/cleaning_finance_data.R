## Load libraries and read data
library(tidyverse)
library(janitor)
library(here)

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
                                description == "savings  mobile  pymt"  ~ "savings",
                                description == "moroz  gift"  ~ "husband",
                                description == "mairi  godley  rent  september  mobile"  ~ "rent",
                                description == "scaled  solutions"  ~ "salary",
                                description == "churchill  insurance"  ~ "car insurance",
                                description == "allanshaw  centre  hamilton"  ~ "personal - big",
                                description == "petrov  help  mobile  pymt"  ~ "parents",
                                description == "vanguard asset"  ~ "investment",
                                description == "crowdcube  moneybox  exeter"  ~ "investment",
                                description == "west  lothian  credi  mobile  pymt"  ~ "savings",
                                description == "mobile  limited"   ~ "utility bills",
                                description == "accrbsplat  mobile  pymt" ~ "credit card",
                                description == "anatolii  moroz  food  mobile" ~ "husband",
                                description == "personal  loan  initial  payment" ~ "car loan",
                                description == "west  lothian  credi  mobile  pymt" ~ "savings",
                                description == "mairi  godley  rent  august  mobile" ~ "rent",
                                description == "amznmktplace  amazoncouk" ~ "personal - small",
                                description == "first  mobile  aberdeen" ~ "personal - small",
                                description == "transferwise  asus" ~ "bonus",
                                description == "lintlithgow  connect  lintlithgow" ~ "petrol",
                                description == "character0" ~ "credit card",
                                description == "aldi  linlithgow" ~ "food",
                                description == "mobile" ~ "utility bills",
                                description == "paypal  johnlewispl" ~ "parents",
                                description == "petrova  komp  help  mobile" ~ "parents",
                                description == "apcoa" ~ "personal - small",
                                description == "mairi  godley  rent  july  mobile" ~ "rent",
                                description == "happy  beds  dewsbury" ~ "personal - big",
                                description == "nectarsleep  milton  keynes" ~ "personal - big",
                                description == "loan" ~ "car loan",
                                description == "liqpaydoshi  nikolaev  dnsk  vrate" ~ "personal - small",
                                description == "limited  sutton  coldfi  refund" ~ "bonus",
                                description == "anatolii  moroz  gift  mobile" ~ "husband",
                                description == "mairi  godley  rent  june  online  pymt" ~ "rent",
                                description == "johns  church  linlithgow" ~ "personal - small",
                                description == "paypal  ppwdldjkeau  ppwdhcb" ~ "personal - small",
                                description == "codeclan  limited  veronika  moroz  online  pymt" ~ "personal - big",
                                description == "west  lothian  credi  online  pymt" ~ "savings",
                                description == "veronika  moroz" ~ "savings",
                                description == "moroz  return" ~ "husband",
                                description == "limited  sutton  coldfi" ~ "personal - big",
                                description == "livingston  credit  wlcu" ~ "savings",
                                description == "johns  evangelic  giving  online  pymt" ~ "personal - small",
                                description == "west  lothian  credit  livingston" ~ "savings",
                                description == "mairi  godley  rent  online  pymt" ~ "rent",
                                description == "paypal  code  paypal  code  pprdazfy" ~ "personal - small",
                                description == "paypal  electrawork" ~ "personal - small",
                                description == "tesco  stores  falkirk" ~ "food",
                                description == "mairi  godley  rent  april  mobile" ~ "rent",
                                description == "sainsburys" ~ "food",
                                description == "vanguard" ~ "investment",
                                description == "anatolii  moroz  ticket  online  pymt" ~ "husband",
                                description == "telecoms" ~ "utility bills",
                                description == "plusnet  sheffield" ~ "utility bills",
                                description == "bulb  energy" ~ "utility bills",
                                description == "wwwwestlot  hianleisure" ~ "husband",
                                description == "savings  online  pymt" ~ "savings",
                                description == "mairi  godley  rent  march  online  pymt" ~ "rent",
                                description == "bank  scot" ~ "personal - small",
                                description == "freetrade  internet" ~ "investment",
                                description == "rbsci  west  lothian  ncil  chaps" ~ "bonus",
                                description == "mairi  godley  rent  february  online  pymt" ~ "rent",
                                description == "oakwood  scotland  compensation  ybbpi" ~ "bonus",
                                description == "tradinguk  london" ~ "investment",
                                description == "pnet" ~ "utility bills",
                                description == "jelena  petrova  lloyds  mobile  pymt" ~ "parents",
                                description == "ihspa  london  vrate" ~ "husband",
                                description == "ukvi  london  vrate" ~ "husband",
                                description == "mairi  godley  rent  january  mobile" ~ "rent",
                                description == "cashback" ~ "bonus",
                                description == "institute  biomedica  london" ~ "personal - big",
                                description == "mairi  godley  rent  december  online  pymt" ~ "rent",
                                description == "moneybox  initial  payment" ~ "LISA",
                                description == "churchill  retail" ~ "car insurance",
                                description == "mairi  godley  rent  november  online  pymt" ~ "rent",
                                description == "lner" ~ "bonus",
                                description == "morrisons  petrol  edinburgh" ~ "petrol",
                                description == "notemachine" ~ "personal - small",
                                description == "barclays" ~ "personal - small",
                                description == "mairi  godley  rent  october  mobile" ~ "rent",
                                description == "merseyrail  liverpool  refund" ~ "bonus",
                                description == "bmach" ~ "personal - small",
                                description == "insurance" ~ "car insurance",
                                description == "vanguard  asset" ~ "investment",
                                description == "happy  beds  dewsbury  refund" ~ "bonus",
                                description == "vitalij  petrov  debt  online  pymt" ~ "parents"))

## Write csv file of clean data
write_csv(finance_data_clean, "finance_clean_data.csv")



