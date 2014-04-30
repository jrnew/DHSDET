#----------------------------------------------------------------------
# mainPanel.R
# Jin Rou New, 2014
#----------------------------------------------------------------------
tabPanelAbout <- source("about.R")$value

mainPanel(
  width = 9,
  progressInit(),
  tabsetPanel(
    tabPanel("Data",      
             uiOutput("data_tab")), 
#     tabPanel("Graph", 
#              uiOutput("graph_tab")),
    tabPanelAbout()
  )
) # end mainPanel
