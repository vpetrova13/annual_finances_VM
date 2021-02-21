# Server 
source("R/categories_over_year.R")
source("R/categories_over_month.R")

server <- function(input, output) {
  
  output$year_plot <- create_cat_year(input = input, data = finance)
  output$month_plot <- create_cat_month(input = input, data = finance)
  output$highest_month <- month_infobox(input = input, data = finance)
}