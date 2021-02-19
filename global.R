# Global
# load in libraries
library(shiny)
library(shinydashboard)
library(tidyverse)
library(dashboardthemes)
library(here)
library(shinyWidgets)

# general <- read_csv()

finance <- read_csv(here("clean_data/finance_clean_data.csv"))
finance <- finance %>% 
  mutate(date = factor(date, levels = c("09/2019", "10/2019", "11/2019",
                                        "12/2019", "01/2020", "02/2020",
                                        "03/2020", "04/2020", "05/2020",
                                        "06/2020", "07/2020", "08/2020",
                                        "09/2020")))