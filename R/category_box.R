category_infobox <- function(input, data) {
  renderInfoBox({
    category_value <- finance %>% 
      filter(categories == input$category) %>% 
      mutate(absolute = abs(value)) %>% 
      group_by(date, categories) %>% 
      summarise(total = sum(absolute)) %>% 
      arrange(desc(total)) %>% 
      head(1)
    
    category_value <- str_to_title(category_value$categories)
    
    infoBox(
      "Category", paste0(category_value), icon = icon("list"),
      color = "aqua", fill = TRUE
    )
    
  }
  )
}