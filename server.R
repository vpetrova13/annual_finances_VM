# Server 
source("R/categories_over_year.R")
source("R/categories_over_month.R")
source("R/category_box.R")
source("R/month_box.R")
source("R/value_box.R")
source("R/table_month.R")

server <- function(input, output) {
  
  output$year_plot <- create_cat_year(input = input, data = finance)
  output$month_plot <- create_cat_month(input = input, data = finance)
  output$highest_month <- month_infobox(input = input, data = finance)
  output$highest_category <- category_infobox(input = input, data = finance)
  output$highest_count <- value_infobox(input = input, data = finance)
  output$month_table <- create_month_table(input = input, data = finance)
}