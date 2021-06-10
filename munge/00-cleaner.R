#' R/00-cleaner.R
#' 
#' Script to read in "raw-data", perform preliminary data cleaning/harmonisation
#' steps and save in the "data" folder for munging.
#' 
#' Updated 10-June-2020 by Paul Stevenson
#' 

#### Project automation with ProjectTemplate ----

ProjectTemplate::load.project(munging = FALSE, cache_loading = FALSE, data_loading = FALSE)

#### helper functions ----

source("R/99-helper.R")

#### load data ----

# dat_raw <- read_csv(file = "data-raw/file.csv", col_types = cols(.default = "c"))
dat_raw <- read_xlsx("data-raw/file.xlsx", sheet = "Sheet1", col_types = c("text"))

# dictionary <- read_csv(file = "data-raw/data_dictionary.xlsx", col_types = cols(.default = "c"))
dictionary <- read_xlsx("data-raw/data_dictionary.xlsx", sheet = "Data Dictionary", col_types = c("text"))

#### Data cleaning ----

# dat_raw <- biometrics::clean_REDCap(dat_raw, dictionary)

#### save data ----

save(dat_raw, dictionary, file = "data/dat.RData")
