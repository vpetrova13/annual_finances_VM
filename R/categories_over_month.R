create_cat_month <- function(input, data) {
  renderPlot({
    finance %>% 
      filter(date == input$month) %>% 
      ggplot() +
      aes(x = categories, y = value, fill = categories) +
      geom_col() +
      theme_bw() +
      theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +
      labs(
        x = "Categories",
        y = "Total £"
      ) +
      geom_hline(yintercept=0, linetype="dashed")
  }
  )
}