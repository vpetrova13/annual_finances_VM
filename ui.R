# UI 
dashboardPage(
  dashboardHeader(title = "Personal Finance"),
  dashboardSidebar(
    pickerInput("category","Categories", choices=unique(finance$categories), 
                options = list(`actions-box` = TRUE),multiple = TRUE,
                selected = "savings")
    ),
  dashboardBody(
    shinyDashboardThemes(
      theme = "poor_mans_flatly"),
              fluidRow(
                valueBoxOutput("rate"),
                valueBoxOutput("count"),
                valueBoxOutput("users")
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