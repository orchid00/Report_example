# Documentation ----
# Description: first steps with R
# Author: Write your name
# Date: Aug 7, 2018

# Objects types ----
name <- "Your name"
num <- 24324323423243
logi <- TRUE

typeof(logi)

# Data structures ----
# Vector have one type
# matrix 2 dimensional vector all same type
# data.frame 2 dimensions each column 
# can hold a different data type

# Load packages ----
?library 
library()
library(tidyverse)
?tidyverse

# Download the dataset ----
?download.file
download.file(url = "https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/data/gapminder-FiveYearData.csv",
              destfile = "data/gapminder.csv")

# Explore dataset ----
?read_csv
gapminder <- read_csv(file = "data/gapminder.csv")

# testing new functions
# str
?str
str(gapminder)

# glimpse
# head
# tail
# dim
# ncol
# nrow






