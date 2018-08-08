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

countriesByLetter <- function(fl){
    my_countries <- gapminder[starts_with %in% fl, ]
    my_countries
    return(my_countries)
}















