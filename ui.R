# UI 
dashboardPage(
  dashboardHeader(title = "Personal Finance"),
  dashboardSidebar(
  sidebarMenu(
    menuItem("Description", tabName = "description"),
    menuItem("Dashboard", tabName = "dashboard")
  ),
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
              selected = "2020-07-01")),
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
                      status = "primary",
                  plotOutput("month_plot")),
                  box(width = 3, 
                       title = h5(strong("Top spends/gains over the chosen month")),
                      status = "primary",
                  tableOutput("month_table"))
                )
                )
                )
              ),
              tabItem("description",
                      fluidRow(
                        box(status = "primary", 
                          img(src ="hand_coin_pound_finance_icon_125507.png",
                              width = 400, height = 400)),
                        box(
                          title = h3("About App"), status = "primary", solidHeader = TRUE, 
                          h5("This is a dashboard that visualises the annual and monthly earnings and spends by categories
                          from October 2019 till October 2020."),
                          br(),
                          h5(strong("Aim of the app:")),
                          h5("To show which category accounts for the highest spendings/gains."),
                          br(),
                          h5(strong("App description:")), 
                          tags$li("The 'Yearly' tab allows to see how much the chosen category varied throughout the year.
                             It allows to see which month had the highest or lowest spend/gain."),
                          tags$li("The 'Monthly' tab allows to see all categories and how they varied throughout the chosen month.
                             It allows to see which category had the highest spend/gain."),
                          tags$li("If a bar is positive, then a category caused an income."),
                          tags$li("If a bar is negative, then a category caused an outcome."),
                          br(),
                          h5(strong("Data was synthesised for demontration purposes.")),
                          h5("Original source of dataset for the app is Author's transaction file from personal bank account.")
                        )
                      )
                  )
          )
      )  
  )
