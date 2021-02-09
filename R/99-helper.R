#' Varaibles and functions for use throughout the analysis project
#' 
#' Load into R scripts by including: source("R/99-helper.R")
#'
#' Updated 21-May-2020 by Paul Stevenson
#'

#### Default functions ----

#' factor_table
#' 
#' Takes a string of tupples and converts to a 2 column key/value table.
#' 
#' tmp <- "1|Some text, 2| Some more text, 3| All other text"
#' tibble(a = as.character(1:3)) %>%
#'   mutate(across("a", factor, factor_table(tmp)$key, factor_table(tmp)$value))

factor_table <- function(x) tibble(key = str_split(x, ",")[[1]]) %>%
  separate(key, into = c("key", "value"), sep = "\\|") %>%
  mutate(across(everything(), trimws))

#### Project variables ----



#### Project functions ----


