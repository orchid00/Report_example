# Documentation ----
# Description: first steps with R
# Author: Paula Andrea Martinez
# Date: Aug 7, 2018

# Objects types ----
name <- "Your name"    # character
num <- 24324323423243  # numeric
logi <- TRUE           # logical

# You can ask the type using the function typeof
typeof(logi)

# Data structures ----
# vector has only one type
# matrix is a two-dimensional vector, all of the same type
# data.frame is a two-dimensions structure, but each column 
# can hold a different data type

# Install packages ----
# uncomment if you haven't install tidyverse
# install.packages("tidyverse") 

# Load packages ----
?library 
library(tidyverse)
?tidyverse

# Download the dataset ----
?download.file
# Extra condition if file doesn't exist download
if (!file.exists("../data/SWCgapminder.csv")) {
    download.file(url = "https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/data/gapminder-FiveYearData.csv",
                  destfile = "data/SWCgapminder.csv")
}

# Explore dataset ----
?read_csv
gapminder <- read_csv(file = "data/SWCgapminder.csv")

# testing new functions
# str Structure
?str
str(gapminder)

# glimpse
glimpse(gapminder)

# class gives as the data type or structure of the object 
class(gapminder)

# head
head(gapminder) # by default 6 lines

# If you prefer to custom the number of lines use n
head(gapminder, n = 3)

# tail
tail(gapminder)

# dim
dim(gapminder)

# ncol
ncol(gapminder)

# nrow
nrow(gapminder)

# View for less than 100 thousand rows
View(gapminder)

# Subseting ----
gapminder$country

class(gapminder$country)
class(gapminder$pop)

?length
length(gapminder$country)
nrow(gapminder$country)

?unique
uniqueCountries <- unique(gapminder$country)

length(unique(gapminder$country))

length(uniqueCountries)

# selecting using []
gapminder[1]
gapminder[1, 3]
gapminder[1:15, 1:6]
gapminder[1:15, ]
gapminder[140:150, ]

# *conditions ----
# filter for a specific year
gapminder[gapminder$year == 1957, ]



# Subsetting for Italy
gapminder[769:780, ] 

# Subsetting for Ghana, first and third column
gapminder[gapminder$country == "Ghana", c(1,3)]





