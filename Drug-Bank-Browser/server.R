#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
require(colorspace)
library(shiny)
library(data.tree)
library(tidyverse)
library(lubridate)
library(forcats)
library(collapsibleTree)
## Read drugs
drugs <- read_csv(file = "data/drugs.csv")
drugs$type <- as.factor(drugs$type)
drugs$state <- fct_explicit_na(drugs$state, "Unknown")
## Read Groups
drug_groups <- read_csv("data/drug_groups.csv")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$plot <- renderCollapsibleTree({
    drugs %>%
      select(primary_key, type = type, state, created) %>%
      full_join(drug_groups, by = c("primary_key" = "parent_key")) %>%
      rename(group = "text") %>%
      mutate(created_year = year(created),
             created_month = month(created)) %>%
      group_by(created_year, created_month, group, state) %>%
      summarize(`Number of Drugs` = n()) %>%
      collapsibleTreeSummary(
        hierarchy = input$hierarchy,
        root = "Drugs",
        inputId = "node",
        width = 800,
        attribute = "Number of Drugs"
      )
  })
  
  output$str <- renderPrint({
    tree_list <- input$node
    fltr_str <- ""
    if (!is.null(tree_list[["created_year"]])) {
      fltr_str <- add_comma(fltr_str)
      fltr_str <-
        paste0(fltr_str, "created_year", "='", tree_list[["created_year"]], "'")
    }
    
    if (!is.null(tree_list[["created_month"]])) {
      fltr_str <- add_comma(fltr_str)
      fltr_str <-
        paste0(fltr_str, "created_month", "='", trimws(tree_list[["created_month"]]), "'")
    }
    
    if (!is.null(tree_list[["group"]])) {
      fltr_str <- add_comma(fltr_str)
      fltr_str <- paste0(fltr_str, "group", "='", tree_list[["group"]], "'")
    }
    
    if (!is.null(tree_list[["state"]])) {
      fltr_str <- add_comma(fltr_str)
      fltr_str <- paste0(fltr_str, "state", "='", tree_list[["state"]], "'")
    }
    # print(input$node)
    return(fltr_str)
  })
  
})

add_comma <- function(x) {
  if (x != "") {
    x <- paste0(x, ",")
  }
  return(x)
}

construct_filter <- function(key, value, prev_filter = "") {
  if (!is.null(value)) {
    prev_filter <- add_comma(prev_filter)
    prev_filter <- paste0(prev_filter, key, "='", value, "'")
  }
}