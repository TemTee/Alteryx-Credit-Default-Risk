library(tidyverse)


x <- seq(1,62,2)
x[(seq(5,30,5))] <- NA
y <- rnorm(31)
y[seq(2,20,2)] <- NA
xy <- tibble(x,y)
colSums(is.na(xy))

sum_nas <- function(m,n){
  df <- tibble(m,n)
  number_of_nas <- colSums(is.na(df))
  number_of_nas
}

