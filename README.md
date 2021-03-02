# Dashboard Personal Project

## Introduction
When I started my first job after graduation from university and became independent from my parents, I quickly realised that my bank balance was always negative or close to zero before a pay day. Since then I became interested in Personal finance and started to read online articles about it. All experts had in common the same advice which was to start calculate the budget and plan it. Calculate earnings and spendings per month or week. At that time, my bank app did not have budget calculator 


As part of Data Analysis course, we had to create a dashboard using RStudio and Shiny about Scotland's overall health state and particular health problem and how it changed over the last 5 - 10 years.

The user can explore and visualise the annual number of inpatient stays in hospitals in Scotland differentiated by gender, sex and specialty.

Our particular health topic was focused on  conditions that are caused by the abuse of alcohol. It shows **geographically** the difference of various rate of stays caused by different conditions related to alcohol (either mental or physical). 

Datasets were taken from [Public Health of Scotland](https://www.opendata.nhs.scot/dataset/annual-inpatient-and-daycase-activity)
and [Scottish Government](https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Falcohol-related-hospital-statistics).

## Group members 
[Veronika Moroz](https://github.com/vpetrova13),
[Matthew Willkins](https://github.com/matthewwillkins) and
[Michael Boyne](https://github.com/Michael-Boyne) who were part of DE5 cohort of Data Analysis course at CodeClan.

## Scotland Health app
The link for the app can be found **[here](https://veronika13.shinyapps.io/group_project)**.

### Datasets 
Both datasets required some cleaning and wrangling. Using filter function from tidyverse package, the user can interact with dashboard and explore more by choosing different variables such as year, gender, age range and NHS health board.

### The dashboard
#### First tab - Scotland
* First plot shows the difference in stays in Scotland hospitals between gender and age groups at the chosen year. 
* Second plot shows stays in hospital by different admission types and how they changed over the last 10 years. 
* Third one shows the table of total stays per department and average number of nights per patient in chosen department and year.

#### Second tab - Map of health boards
* Map visualises number and ratio of stays by different health boards in chosen year.
* The chosen Health board is highlighted by yellow border.
* Count is related to number of population. Thus, Glasgow is yeallow bright in every year. Ratio demonstrates the stays relative to 100,000 people, thus, better for comparison between different health boards.  
* Plot shows the causes of stays in decreasing order in chosen health board and year.  

#### Third tab - Health boards
* Plot demonstrates ratio stays in health boards in decreasing order by chosen year, condition and type of hospital.
* It shows which health board has the most prominent ratio of stays caused by the abuse of alcohol. 
* The table contains information from the plot.

## Images 
### First tab - Overview of inpatients 
![First tab - Overview](images/1st_tab_plot_gender.png)
![First tab - Overview](images/1st_tab_plot_table.png)
### Second tab - Spatial analysis
![Second tab - Spatial](images/2nd_tab_map.png)
![Second tab - Spatial](images/2nd_tab_plot.png)
### Third tab - Regional overview
![Third tab - Regional](images/3rd_tab_plot.png)
![Third tab - Regional](images/3rd_tab_table.png)

## Packages
| Package      | Version    
| :------------- | :----------: 
base R | 3.6.0 |
shinyWidgets | 0.5.7 | 
dplyr | 1.0.2 |
ggplot2 | 3.3.3 |
tidyverse | 1.3.0 |
stringr | 1.4.0 |
here | 0.1 |
dashboardthemes | 1.1.3 |
readr | 1.4.0 |
tidyr | 1.1.2 |
purr | 0.3.4 |
shinydashboard | 0.7.1 |
shiny | 1.5.0 |
forcats | 0.5.0 |
tibble | 3.0.4 |
