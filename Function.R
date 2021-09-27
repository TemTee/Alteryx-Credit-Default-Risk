library(tidyverse)
options(digits = 2)

#===================     This Function sums the number of NAs in a DataFrame of same length   

sum_na <- function(df) {
  colSums(is.na(df))
  
}

# ==========  Check

ab <- data.frame(a = seq(1,62,2),
                 b = rnorm(31),
                 c = seq(35,65))
ab$a[(seq(5,25,5))] <- NA           #   Replaces values with NA
ab$b[seq(2,26,2)] <- NA             #   Replaces values with NA
ab$c[1:4] <- NA                     #   Replaces values with NA
sum_na(ab)
