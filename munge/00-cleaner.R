#' R/00-cleaner.R
#' 
#' Script to read in "raw-data", perform preliminary data cleaning/harmonisation
#' steps and save in the "data" folder for munging.
#' 
#' Updated 9-Feb-2020 by Paul Stevenson
#' 

#### Project automation with ProjectTemplate ----

ProjectTemplate::load.project(munging = FALSE, cache_loading = FALSE, data_loading = FALSE)

#### helper functions ----

source("R/99-helper.R")

#### load data ----

# dat_raw <- read_csv(file = "data/file.csv", col_types = cols(.default = "c"))
dat_raw <- read_xlsx("data/file.xlsx", sheet = "Sheet1", col_types = c("text"))
dict <- read_xlsx("data/data_dictionary.xlsx", sheet = "Data Dictionary", col_types = c("text"))

#### Data cleaning ----

# clean column names

names(dat_raw) <- map_chr(names(dat_raw), function(x, d) ifelse(x %in% d$name, d[d$name == x,]$name_clean, x), d = dict)

# Set column class

dat_raw <- dat_raw %>%
  mutate(across(c("date", "dob", dict[dict$type %in% c("Integer", "Numeric"),]$name_clean), as.numeric),
         across(c("date", "dob"), excel_numeric_to_date),
         across("gender", factor, levels = c("M", "F"), labels = c("Male", "Female")))

# Apply labels to columns

var_label(dat_raw) <- map_chr(names(dat_raw), function(x, d) ifelse(x %in% d$name_clean, d[d$name_clean == x,]$description, x), d = dict)

#### save data ----

save(dat_raw, file = "data/dat_raw.RData")
cache("dict")
