# UI 
dashboardPage(
  dashboardHeader(title = "Personal Finance"),
  dashboardSidebar(
    pickerInput("category",h4("Categories"), choices=unique(finance$categories), 
                options = list(`actions-box` = TRUE),multiple = TRUE,
                selected = "savings")
    ,
  selectInput("month", label = h4("Select Month"), 
              choices = c("September 2019" ="2019-09-01",
                          "October 2019"="2019-10-01",
                          "November 2019"="2019-11-01",
                          "December 2019"="2019-12-01",
                          "January 2020"="2020-01-01",
                          "February 2020"="2020-02-01",
                          "March 2020"="2020-03-01",
                          "April 2020"="2020-04-01",
                          "May 2020"="2020-05-01",
                          "June 2020"="2020-06-01",
                          "July 2020"="2020-07-01",
                          "August 2020"="2020-08-01",
                          "September 2020"="2020-09-01"), 
              selected = "2020-09-01")),
  dashboardBody(
    shinyDashboardThemes(
      theme = "poor_mans_flatly"),
              fluidRow(
                infoBoxOutput("highest_month"),
                infoBoxOutput("highest_category"),
                infoBoxOutput("highest_count")
              ),
              fluidRow(
                tabBox( width = 12,
                  tabPanel(
                  title = "Year",
                  plotOutput("year_plot")
                ),
                tabPanel( status = "info",
                  title = "Month",
                  plotOutput("month_plot")
                )
              )
      )  
  )
)