create_month_table <- function(input, data) {
  renderTable({
    finance %>% 
      filter(date == input$month) %>% 
      mutate(absolute = abs(value)) %>% 
      group_by(categories) %>% 
      summarise(spends_gains = sum(absolute)) %>% 
      arrange(desc(spends_gains)) %>% 
      rename(Categories = categories,
            "Total £" = spends_gains)
  }
  )
}