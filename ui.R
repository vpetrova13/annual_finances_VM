# UI 
dashboardPage(
  dashboardHeader(title = "Personal Finance"),
  dashboardSidebar(
    pickerInput("category",h5("Select Categories"), choices=unique(finance$categories), 
                options = list(`actions-box` = TRUE),multiple = TRUE,
                selected = c("bonus", "utility bills", "personal - small")),
    selectInput("month", label = h5("Select Month"), 
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
                selected = "2020-07-01"),
  sidebarMenu(
    menuItem("Dashboard", tabName = "dashboard"),
    menuItem("Description", tabName = "description")
  )),
  dashboardBody(
    shinyDashboardThemes(
      theme = "blue_gradient"),
            tabItems(
              tabItem("dashboard",
                fluidRow(
                tabBox(width = 12,
                  tabPanel(
                  title = "Yearly",
                  infoBoxOutput("highest_month"),
                  infoBoxOutput("highest_category"),
                  infoBoxOutput("highest_count"),
                  plotOutput("year_plot")
                ),
                tabPanel(
                  title = "Monthly",
                  box(width = 9, 
                      title = h4(strong("Spends/gains by categories over the chosen month")),
                      solidHeader = TRUE,
                  plotOutput("month_plot")),
                  box(width = 3, 
                       title = h5(strong("Top spends/gains over the chosen month")),
                      solidHeader = TRUE,
                  tableOutput("month_table"))
                )
                )
                )
              ),
              tabItem("description",
                      fluidRow(
                        
                      ))
          )
      )  
  )
