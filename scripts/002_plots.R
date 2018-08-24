# Documentation ----
# Description: first steps with R
# Author: Paula Andrea Martinez
# Date: Aug 8, 2018
# 
# Load the packages ----
library(tidyverse)
# load gapminder dataset
gapminder <- read_csv(file = "data/SWCgapminder.csv")
# Explore the dataset ----
glimpse(gapminder)

# Make some plots!!! ----
plot(gapminder$gdpPercap, gapminder$lifeExp) 

?ggplot2
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
    geom_point()

??geom
# A scatter plot of year vs pop
ggplot(data = gapminder, aes(x = year, y = pop)) +
    geom_point()

# A scatter plot of year vs pop with shape
ggplot(data = gapminder, aes(x = year, y = pop, shape = continent)) +
    geom_point()

# A scatter plot of year vs pop with colour
ggplot(data = gapminder, aes(x = year, y = pop, colour = continent)) +
    geom_point()

# unique years
unique_years <- unique(gapminder$year)
unique_years

# scale
??scale

# custom scale in the x axis
ggplot(data = gapminder, aes(x = year, y = pop, colour = continent)) +
    geom_point() +
    scale_x_continuous(breaks = unique_years)

# Create a histogram of lifeExp
ggplot(data = gapminder, aes(x = lifeExp, fill = continent)) +
    geom_histogram(bins = 12)

# create a histogram by continent and a new theme
ggplot(data = gapminder, aes(x = lifeExp, fill = continent)) +
    geom_histogram(bins = 12) +
    facet_wrap(~ continent) +
    theme_dark()

#Create a line plot of year and lifeExp coloured by continent
ggplot(data = gapminder, aes(x = year, y = lifeExp, colour = continent)) +
    geom_line()

# asthetics
# x
# y
# shape
# colour
# fill
# by


#Create a line plot of year and lifeExp coloured by continent
# by country
ggplot(data = gapminder, aes(x = year, y = lifeExp, 
                             colour = continent,
                             by = country)) +
   geom_line()


# scatter plot gdpPercap vs lifeExp with geom_smooth()
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, 
                             color = continent)) +
    geom_point() +
    geom_smooth(method = "lm", size = 2, 
                colour = "black" ) +
    scale_x_log10() +
    labs(x = "GDP per Capita", y = "Life Expectation")

# Create a line plot for year vs lifeExp colour by 
# continent
# Plot only the countries that start with letter A
starts_with <- substr(gapminder$country, 
                       start = 1, stop = 1)
starts_with

my_countries <- gapminder[starts_with %in% c("R", "Y"), ]
my_countries
View(my_countries)

ggplot(data = my_countries, aes( x = year, y = lifeExp,
                                 colour = continent)) +
    geom_line() +
    facet_wrap( ~ country)

ggsave(filename = "figs/LifeExp_countries_R_Y.png")

# New function ----
# create a function to subset countries by the first 
# letter
# The function countriesByLetter needs a parameter 
# called fl, that stands for first letters 
countriesByLetter <- function(fl){
    my_countries <- gapminder[starts_with %in% fl, ]
    my_countries
    return(my_countries)
}

# run the function
countriesByLetter(fl = c("A", "C" ))
countries_A_C <- countriesByLetter(fl = c("A", "C" ))
View(countries_A_C)

# Function plot by country ----
plotCountriesByLetter <- function(fl){
    my_countries <- gapminder[starts_with %in% fl, ]
    ggplot(data = my_countries, aes( x = year, y = lifeExp,
                                     colour = continent)) +
        geom_line() +
        facet_wrap( ~ country)
    
    names <- paste(fl, collapse = "_") 
    ggsave(filename = paste0("figs/LifeExp_countries_", 
                             names, ".png"))
}

plotCountriesByLetter(c("D", "I"))


# Save data ----
my_countries
View(my_countries)

write_csv(x = my_countries, 
          path = "data/countriesR_Y.csv" )


# Data manipulation with dplyr ----
?`dplyr-package`
?`%>%` # ctrl+Shift+M

head(gapminder)

gapminder %>% 
    head()

# What is the number of unique countries
# 142

gapminder$country %>% 
    unique() %>% 
    length()

# select() ----
# picks variables based on their names
# It only affects columns and keeps all rows 
# Using select() selectry country and continent 
# from the gapminder

gapminder %>% 
    select(country, continent)

select(gapminder, country, continent)

# Select those columns that starts_with the letter c
# from the gapminder

gapminder %>%
    select(starts_with("c"))

select(gapminder, starts_with("c"))


# filter() ----
# picks cases based on their values
gapminder %>% 
    filter(year == "2007")

gapminder %>% 
    filter(year > 2000)

# Select your country and the year 2002
# from the gapminder
# Tip two columns one row 
gapminder %>% 
    select(country, year, pop) %>% 
    filter(country == "Italy", year == 2002)

# Select African countries for
# lifeExp, country and year, 
# How many rows does your data
# have and why?

# add colours to this plot
gapminder %>% 
    filter(continent == "Oceania" ) %>% 
    select(year, country, lifeExp, continent) %>% 
    ggplot(aes(x = year, y = lifeExp, colour = country)) +
       geom_point()
    
    
    
    

# Save this into african_countries
african_countries <- gapminder %>% 
    filter(continent == "Africa" ) %>% 
    select(year, country, lifeExp)

dim(african_countries) # 624  3
# write african_countries as a csv file in data/
write_csv(african_countries, 
          path = "data/african_countries.csv")


