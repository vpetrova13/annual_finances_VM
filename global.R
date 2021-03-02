# Global
# load in libraries
library(shiny)
library(shinydashboard)
library(tidyverse)
library(dashboardthemes)
library(here)
library(shinyWidgets)
library(rsconnect)

# general <- read_csv()

finance <- read_csv(here("clean_data/finance_clean_synthetic.csv"))

