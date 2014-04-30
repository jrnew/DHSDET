#----------------------------------------------------------------------
# sidebarPanel.R
# Jin Rou New, 2013
#----------------------------------------------------------------------
sidebarPanel(
  width = 3,
  tags$head(
    tags$link(rel="stylesheet", type="text/css", href="style.css")
  ),
  # Google analytics
  HTML("<script>",
       "(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){",
       "(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),",
       "m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)",
       "})(window,document,'script','//www.google-analytics.com/analytics.js','ga');",  
       "ga('create', 'UA-42087579-1', 'shinyapps.io');",
       "ga('send', 'pageview');",
       "</script>"
  ),
  helpText("Retrieve DHS data for any indicator and country."),
  #----------------------------------------------------------------------
  # Select indicator
  wellPanel(
    p(strong("1. Select indicator.")),
    selectInput(inputId = "indicator_ids", label = NULL, choices = getIndicators(), multiple = T, selectize = T)
  ),
  #----------------------------------------------------------------------
  # Select country
  wellPanel(
    p(strong("2. Select country.")),
    selectInput(inputId = "country_codes", label = NULL, choices = getCountries(), multiple = T, selectize = T)
  ),
  fluidRow(div(class = "span3", actionButton("go", "Go!", styleclass = "primary")),
           div(class = "span7", shinyalert("goAlert", click.hide = FALSE, auto.close.after = 5)))
)
