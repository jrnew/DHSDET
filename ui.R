#----------------------------------------------------------------------
# ui.R
# Jin Rou New, 2014
#----------------------------------------------------------------------
shinyUI(pageWithSidebar(
  headerPanel(h3("DHS Data Exploration Tool"), 
              windowTitle = "DHS Data Exploration Tool"),
  source("shiny/sidebarPanel.R", local = T)$value,
  source("shiny/mainPanel.R", local = T)$value
))
