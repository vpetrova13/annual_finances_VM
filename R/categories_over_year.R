create_cat_year <- function(input, data) {
  renderPlot({
    finance %>% 
      filter(categories == input$category) %>% 
      ggplot() +
      aes(x = date, y = value, fill = categories) +
      geom_col()  +
      theme_light() +
      theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +
      labs(
        title = "Spends and gains by categories over the year",
        x = "Months",
        y = "Total £"
      ) +
      scale_x_continuous(breaks = c("09/2019","09/2020"))
  }
  )
}