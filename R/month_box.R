month_infobox <- function(input, data) {
  renderInfoBox({
    month_value <- finance %>% 
      mutate(absolute = abs(value)) %>% 
      filter(categories == input$category)%>% 
      group_by(date, categories) %>% 
      summarise(total = sum(absolute)) %>% 
      slice_max(total,n=1) %>% 
      ungroup() 
    
    infoBox(
      "Progress", paste0(month_value), icon = icon("list"),
      color = "purple", fill = TRUE
    )
    
  }
  )
}