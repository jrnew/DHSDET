#----------------------------------------------------------------------
# about.R
# Jin Rou New, 2014
#----------------------------------------------------------------------
function(){
  tabPanel("About",
           p("The DHS Data Exploration Tool (DHSDET) was created in ",
             a("R", 
               href = "http://www.r-project.org/", target = "_blank"),
             "with the package",
             a("Shiny", 
               href = "http://www.rstudio.com/shiny/", target = "_blank"),
             "using data from",
             a("The DHS Program Indicator Data API.", 
               href = "http://api.dhsprogram.com/", target = "_blank")
           ),
           p("This app was created by Jin Rou New (Department of Statistics & Applied Probability, National University of Singapore).",
             "For any questions, feedback or suggestions, please contact JR New at jrnew[at]nus.edu.sg."),
           p("Please use the latest version of Google Chrome, Mozilla Firefox or Internet Explorer to run this app; there may be problems with other browsers/versions."),
           p(em(paste("Last updated: 30 April 2014")))
  )
}

