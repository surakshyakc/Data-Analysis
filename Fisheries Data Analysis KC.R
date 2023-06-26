landings_data = read.csv("C:/Users/skc/OneDrive - TPWD/_data/landings_data.txt")

landings_data

library(dplyr)
library(lubridate)
landings_data
landings_data = landings_data %>%
  rename(Year = yy,
         Date = dat,
         Trip_ID = trip,
         Effort_Hours = effort,
         Gear = gr,
         Species = sp,
         Length_cm = l_cm, #if unsure about an attribute call; use ($) table_name$  the attribute options will pop up #
         Weight_g = w_cm) %>%
  #Turn the date column into data format that R recognizes
  mutate(Date = mdy(Date))

#recall landings_data to confirm change
head(landings_data) #only gives you the first 6 lines of the table you are calling (takes up less space)++

landings_data[!complete.cases(landings_data),]

landings_data = na.omit(landings_data)
landings_data

unique(landings_data$Gear)

landings_data = landings_data %>%
  mutate(Gear=tolower(Gear))
         unique(landings_data$Gear)
         
unique(landings_data$Species) 
landings_data %>%
  filter(Species == "Caesoi cunning") %>%
  nrow()

landings_data %>%
  filter(Species == "Caesio cuning") %>%
  nrow()

landings_data = landings_data %>%

  mutate(Species = replace(Species,Species == "Caesoi cunning", "Caesio cuning"))

unique(landings_data$Species)

summary(landings_data$Length_cm)

plot(landings_data$Length_cm)
landings_data = landings_data %>%
  filter(Length_cm < 100)
PLOT(landings_data$Length_cm)
landings_data
