#----------------------------------------------------------------------
# outputMainPanel.R
# Jin Rou New, 2014
#----------------------------------------------------------------------
# Start run alert
observe({
  if (input$go == 0) return(NULL)
  if (is.null(input$indicator_ids)) return(NULL)
  if (is.null(input$country_codes)) return(NULL)
  showshinyalert(session, id = "goAlert", HTMLtext = paste("Retrieving data..."))
})
#----------------------------------------------------------------------
# Data URL
output$data_url <- renderUI({
  div(p("Source: ", a("URL", 
                      href = gsub("&f=json", "", paste0(getDHSDataURL(indicator_ids = input$indicator_ids, country_codes = input$country_codes))), 
                      target = "_blank")))
})
#----------------------------------------------------------------------
# Data download
output$data_download <- downloadHandler(
  filename <- function() {
    paste0("DHSData_", paste(input$country_codes, collapse = "&"), "_",
           paste(input$indicator_ids, collapse = "&"),
           "_", Sys.Date(), ".csv")
  },
  content <- function(file) {
    data <- getDHSData(getDHSDataURL(indicator_ids = input$indicator_ids,
                                     country_codes = input$country_codes))
    if (!is.null(data))
      write.csv(data, file, row.names = F, na = "")
  }
)
#----------------------------------------------------------------------
# Data table
output$data_table <- renderDataTable({
  data <- getDHSData(getDHSDataURL(indicator_ids = input$indicator_ids,
                                   country_codes = input$country_codes))
  if (!is.null(data))
    data
}, options = list(aLengthMenu = c(5, 10, 20, 50, 100), 
                  bFilter = FALSE,
                  bSortClasses = TRUE, 
                  iDisplayLength = 10))
#----------------------------------------------------------------------
# Data tab
output$data_tab <- renderUI({
  if (input$go == 0) return(NULL)
  if (is.null(input$indicator_ids)) return(NULL)
  if (is.null(input$country_codes)) return(NULL)
  withProgress(session, min=0, max=100, expr={    
    setProgress(message = 'Loading', detail = 'Please wait...',
                value = 50)
    div(fluidRow(div(class = "span4", uiOutput("data_url")),
                 div(class = "span8", align = "right",
                     downloadButton("data_download", "Download data"))),      
        dataTableOutput("data_table"))
  })
})
#----------------------------------------------------------------------
# Graph tab
output$graph_tab <- renderUI({
  if (input$go == 0) return(NULL)
  if (is.null(input$indicator_ids)) return(NULL)
  if (is.null(input$country_codes)) return(NULL)
  div(
#     p(strong("Graph options")),
#     fluidRow(
#       # change JR, 20140411
#       div(class = "span3",
#           selectInput("plotType", "Result to display",
#                       choices = c("Percentage" = "perc", 
#                                   "Count (in '000s)" = "count"),
#                       selected = "perc", selectize = FALSE)
#       ),
#       div(class = "span9", align = "right",
#           downloadButton("downloadPlot", "Download graph"))
#     ),
#     fluidRow(uiOutput("selectPlotCategories")),
    plotOutput("data_plot", width = "1050px", height = "550px")
  )
})
#----------------------------------------------------------------------
# Graph
# output$data_plot <- renderPlot({
#   withProgress(session, min=0, max=100, expr={
#     RunMCMCAndGetResults()
#     setProgress(message = 'Loading', detail = 'Please wait...',
#                 value = 90)
#     run.name <- getRunName()
#     ShinyPlotResults(run.name = run.name,
#                      plot.prop = ifelse(input$plotType == "perc", TRUE, FALSE), # change JR, 20140411
#                      add.info = "Show Data" %in% input$plotCategories, # change JR, 20140409
#                      categories.to.plot = input$plotCategories[!(input$plotCategories %in% "Show Data")], # change JR, 20140409
#                      cex.adj.factor = 0.7)
#   })
# })
# #----------------------------------------------------------------------
# # Make plot available for download
# output$downloadPlot <- downloadHandler(
#   filename <- function() {
#     paste0("Results Plot ", gsub(" ", "", input$isoselect), " ", Sys.Date(), ".pdf")
#   },
#   content <- function(file) {
#     pdf(file, width = 21, height = 12)
#     RunMCMCAndGetResults()
#     run.name <- getRunName()
#     ShinyPlotResults(run.name = run.name,
#                      plot.prop = ifelse(input$plotType == "perc", TRUE, FALSE), # change JR, 20140411
#                      add.info = "Show Data" %in% input$plotCategories, # change JR, 20140409
#                      categories.to.plot = input$plotCategories[!(input$plotCategories %in% "Show Data")]) # change JR, 20140409
#     dev.off()}
# )
