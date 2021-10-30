library(tidyverse)
library(lubridate)
library(dplyr)
library(RANN)
library(readr)



# Generates the list of N nearest point -----------------------------------

coord <-  as.data.frame(read_csv( "C:/Users/user/Documents/Udacity/AB Testing/round-roaster-stores.csv") %>% 
                          select(StoreID,Longitude, Latitude))
head(coord)
N_point <- nn2(coord, k=nrow(coord), treetype = "kd") 
N_point <- data.frame(N_point$nn.idx)  # convert to dataframe 
names(N_point) <- c("Store","1st_Nearest")     #  rename columns
names(N_point)[3:ncol(N_point)] <- ("Next_Nearest")
head(N_point)
N_point_store <- data.frame(coord$StoreID[N_point$Store],
                            coord$StoreID[N_point$`1st_Nearest`])    # convert index to store id
head(N_point_store)


# Function To Update Traffic Light Status ---------------------------------

# You're writing code to control your town's traffic lights. 
# You need a function to handle each change from green, to yellow, to red, 
# and then to green again.

# Complete the function that takes a string as an argument representing the
# current state of the light and returns a string representing the state the
# light should change to.

For example, update_light('green') should return 'yellow'.

test_that('Basic tests', {
  expect_equal(update_light('green'), 'yellow')
  expect_equal(update_light('yellow'), 'red')
  expect_equal(update_light('red'), 'green')
})


traffic_color <- c("green", "yellow", "red")

update_light <- for (current_state in traffic_color){
  if (current_state == "green") {
    update_light <-  "yellow"
  }
  else if (current_state == "yellow"){
    update_light <-  "red"
  }
  else {
    update_light <- "green"
  }
  return(update_light)
  
}
  


# Greetin Function --------------------------------------------------------





# ----------  Sum the number of NAs in a DataFrame of same length --------


sum_na <- function(df) {
  colSums(is.na(df))
  
}

# =====  function Check

ab <- data.frame(a = seq(1,62,2),
                 b = rnorm(31),
                 c = seq(35,65))
ab$a[(seq(5,25,5))] <- NA           #   Replaces values with NA
ab$b[seq(2,26,2)] <- NA             #   Replaces values with NA
ab$c[1:4] <- NA                     #   Replaces values with NA
sum_na(ab)


