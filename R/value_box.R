value_infobox <- function(input, data) {
  renderInfoBox({
    value <- finance %>% 
      filter(categories == input$category) %>% 
      mutate(absolute = abs(value)) %>% 
      group_by(date, categories) %>% 
      summarise(total = sum(absolute)) %>% 
      arrange(desc(total)) %>% 
      head(1)
    
    infoBox(
      "Total", paste0("£",value$total), icon = icon("chart-line"),
      color = "teal", fill = TRUE
    )
    
  }
  )
}