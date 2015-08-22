ptm <- proc.time()
df<-read.csv("repdata_data_StormData.csv.bz2")
proc.time() - ptm
require(dplyr)
require(lubridate)
require(ggplot2)
clean<-df %>% mutate(year=year(mdy_hms(BGN_DATE))) %>% select(year,STATE,EVTYPE,FATALITIES,INJURIES,REFNUM) %>% group_by(year)
with(clean,table(year,count(EVTYPE)))

# Code to recreate a dataframe of official NOAA list of Events and Designators.
# Credit goes to Deas Richardson who shared this result derived from cutting and pasting 
# table 2.1.1 on page 6 of the National Weather Service Storm Data Documentation 10-1605 7Aug2007

Valid_EVTYPES<- structure(
  list(
    EventName = structure(
      c(1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L, 12L, 13L, 14L, 15L, 17L, 
        18L, 16L, 19L, 20L, 21L, 22L, 23L, 24L, 25L, 26L, 27L, 28L, 29L, 30L,
        31L, 32L, 33L, 34L, 35L, 36L, 37L, 38L, 39L, 40L, 41L, 42L, 43L, 44L, 
        45L, 46L, 47L, 48L), 
      .Label = c("Astronomical Low Tide", "Avalanche", "Blizzard", 
                 "Coastal Flood", "Cold/Wind Chill", "Debris Flow", 
                 "Dense Fog", "Dense Smoke", "Drought", "Dust Devil", 
                 "Dust Storm", "Excessive Heat", "Extreme Cold/Wind Chill", 
                 "Flash Flood", "Flood", "Freezing Fog", "Frost/Freeze", 
                 "Funnel Cloud", "Hail", "Heat", "Heavy Rain", "Heavy Snow", 
                 "High Surf", "High Wind", "Hurricane (Typhoon)", "Ice Storm", 
                 "Lake-Effect Snow", "Lakeshore Flood", "Lightning", 
                 "Marine Hail", "Marine High Wind", "Marine Strong Wind", 
                 "Marine Thunderstorm Wind", "Rip Current", "Seiche", "Sleet", 
                 "Storm Surge/Tide", "Strong Wind", "Thunderstorm Wind", 
                 "Tornado", "Tropical Depression", "Tropical Storm", "Tsunami", 
                 "Volcanic Ash", "Waterspout", "Wildfire", "Winter Storm", 
                 "Winter Weather"),
      class = "factor"), 
    Designator = structure(
      c(3L, 3L, 3L, 3L, 3L, 1L, 3L, 3L, 3L, 1L, 3L, 3L, 3L, 1L, 1L, 3L, 1L, 3L, 
        1L, 3L, 1L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 1L, 2L, 2L, 2L, 2L, 3L, 3L, 3L, 
        3L, 3L, 1L, 1L, 3L, 3L, 3L, 3L, 2L, 3L, 3L, 3L), 
      .Label = c("C", "M", "Z"), 
      class = "factor")
  ), 
  .Names = c("EventName", "Designator"), 
  class = "data.frame", 
  row.names = c(NA, -48L)
)
names(df)
x<-select(df,-REMARKS)
names(x)
