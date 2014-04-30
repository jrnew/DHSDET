#----------------------------------------------------------------------
# global.R
# Jin Rou New, 2014
#----------------------------------------------------------------------
library(shiny)
library(shinyIncubator)
library(shinysky)
library(RJSONIO)
library(plyr)
library(ggplot2)
library(reshape2)

# URLs
country_info_url <- "http://api.dhsprogram.com/rest/dhs/countries?f=json"
indicators_info_url <- "http://api.dhsprogram.com/rest/dhs/indicators?returnFields=IndicatorId,Label,Definition&f=json"

getIndicators <- function() {
  indicators_info <- getDHSData(indicators_info_url)
  indicators <- indicators_info$IndicatorId
  names(indicators) <- indicators_info$Label
  return(indicators)
}

getCountries <- function() {
  country_info <- getDHSData(country_info_url)
  head(country_info)
  countries <- country_info$DHS_CountryCode
  names(countries) <- country_info$CountryName
  return(countries)
}

getDHSDataURL <- function(indicator_ids, country_codes) {
  return_fields <- c("Indicator", "IndicatorId", "CountryName", "CountryCode",
                     "SurveyId", "SurveyType", "SurveyYearLabel", "SurveyYear",
                     "Value",
                     "CharacteristicCategory", "CharacteristicLabel")
  data_url <- paste0("http://api.dhsprogram.com/rest/dhs/data?",
                     "indicatorIds=", paste(indicator_ids, collapse = ","), "&",
                     "countryIDs=", paste(country_codes, collapse = ","), "&",
                     "breakdown=National", "&",
                     "returnFields=", paste(return_fields, collapse = ","), "&",
                     "perpage=1000&",
                     "f=json")
#   "surveyYear="
#   "surveyType="
# http://api.dhsprogram.com/rest/dhs/data/examples
  return(data_url)
}

getDHSData <- function(url) {
  # Import JSON file
  json_file <- fromJSON(url)
  # Unlist JSON file
  json_file <- lapply(json_file, function(x) { unlist(x) })
  # Convert JSON input to a data frame and return it
  data <- as.data.frame(do.call("rbind", json_file), stringsAsFactors=FALSE)
  data <- data[, !(colnames(data) %in% c("DataId", "Recordcount", "Page", "Totalpages"))]
  return(data)
}

# processDHSData <- 
# http://api.dhsprogram.com/rest/dhs/data/fields