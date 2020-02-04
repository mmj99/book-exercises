# Exercise 5: dplyr grouped operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

# What was the average departure delay in each month?
# Save this as a data frame `dep_delay_by_month`
# Hint: you'll have to perform a grouping operation then summarizing your data
View(flights)

dep_delay_by_month <- flights %>%
  group_by(month) %>%
  summarize(delay = mean(dep_delay, na.rm = TRUE)) %>%
  select(month, delay)
print(dep_delay_by_month)
  

# Which month had the greatest average departure delay?

greatest_del_month <- dep_delay_by_month %>%
  filter(delay == max(delay)) %>%
  select(month)
print(greatest_del_month)

# If your above data frame contains just two columns (e.g., "month", and "delay"
# in that order), you can create a scatterplot by passing that data frame to the
# `plot()` function

plot(dep_delay_by_month)

# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation then summarize your data
# You can use the `head()` function to view just the first few rows

destinations <- flights %>%
  group_by(dest) %>%
  summarize(avg_arr_delay = mean(arr_delay, na.rm = TRUE)) %>%
  filter(avg_arr_delay == max(avg_arr_delay, na.rm = TRUE)) %>%
  select(dest, avg_arr_delay)
print(destinations)

# You can look up these airports in the `airports` data frame!
View(airports)
airports %>%
  filter(faa == "CAE")

# Which city was flown to with the highest average speed?

highest_speed_city <- flights %>%
  group_by(dest) %>%
  summarize(avg_speed = mean(distance / air_time, na.rm = TRUE)) %>%
  filter(avg_speed == max(avg_speed, na.rm = TRUE))
print(highest_speed_city)


