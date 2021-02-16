# UI 
dashboardPage(
  dashboardHeader(title = "Personal Finance"),
  dashboardSidebar(
    sliderInput("rateThreshold", "Warn when rate exceeds",
                min = 0, max = 50, value = 3, step = 0.1
    ),
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard"),
      menuItem("Raw data", tabName = "rawdata")
    )
  ),
  dashboardBody(
    shinyDashboardThemes(
      theme = "poor_mans_flatly"),
    tabItems(
      tabItem("dashboard",
              fluidRow(
                valueBoxOutput("rate"),
                valueBoxOutput("count"),
                valueBoxOutput("users")
              ),
              fluidRow(
                box(
                  width = 8, status = "info", solidHeader = TRUE,
                  title = "Popularity by package (last 5 min)",
                  plotOutput("year_plot")
                ),
                box(
                  width = 4, status = "info",
                  title = "Top packages (last 5 min)",
                  plotOutput("month_plot")
                )
              )
      )
    )
  )
)