month_infobox <- function(input, data) {
  renderInfoBox({
    month_value <- finance %>% 
      filter(categories == input$category) %>% 
      mutate(absolute = abs(value)) %>% 
      group_by(date, categories) %>% 
      summarise(total = sum(absolute)) %>% 
      arrange(desc(total)) %>% 
      head(1)
    
    date_show <- format(month_value$date,'%b %Y')
    
    infoBox(
      "Month", paste0(date_show), icon = icon("calendar"),
      color = "light-blue", fill = TRUE
    )
    
  }
  )
}