#----------------------------------------------------------------------
# main_shinyapp.R
#----------------------------------------------------------------------
# 1. Install required software.
#    a. Install R: http://www.r-project.org/
#    b. Install JAGS: https://sourceforge.net/projects/mcmc-jags/files/ (Download JAGS-3.4.0.exe (31.7 MB))
#    c. Install Rtools: http://cran.r-project.org/bin/windows/Rtools/
#    d. Download and unzip this file: https://dl.dropboxusercontent.com/u/38155136/FPET.zip 
#    e. Open up R, and run this script: https://dl.dropboxusercontent.com/u/38155136/FPET.R 

# (Run the following lines if this is the first time you are using DHSDET)
# pkgs <- c("shiny", "devtools", "MCMCpack", "rjags", "R2jags", 
#           "lattice", "abind", "msm", "proto", 
#           "plyr", "ggplot2", "reshape2", "foreach")
# install.packages(pkgs, repos = "http://cran.r-project.org")
# sapply(pkgs, library, character.only = T)
# devtools::install_github("shiny-incubator", "rstudio")

# 3. Run code below. App will open in browser.
rm(list = ls())
require(shiny)
workdir <- "D:/Dropbox/Learning/playbox/DHSDET"
setwd(workdir)
runApp(getwd(), port = 8888)


# Examples: http://api.dhsprogram.com/rest/dhs/data/examples
# Tabulate the TFR values by the survey IDs
# xtabs(as.numeric(Value) ~ SurveyId, data=APIdata)
# breakdown=ALL or Subnational
# CharacteristicCategory and CharacteristicLabel
#----------------------------------------------------------------------
# devtools::install_github('rstudio/shinyapps')
require(shinyapps)
shinyapps::setAccountInfo(name="jrnew", token="A45DC21747C8D970327E9FE8CCABB461", 
                          secret="Sufbe3CH7XxvbMf1qHvrocVvlgAnrn+Wi4CbVUMF")
deployApp()
# shinyapps::configureApp("DHSDET", size="xxlarge") # change instance type of app
# debug
# shinyapps::appDependencies()
# packageDescription('shinyIncubator')
#----------------------------------------------------------------------
# END
#----------------------------------------------------------------------
# Idea: Combine with gVis package for more visualisation awesomeness!
# gVis package has functionality of selecting/deselecting data points,
# but displaying data series might not be possible?