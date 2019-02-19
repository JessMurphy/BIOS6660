
standardize_street <- function(street) {
  # Applies transformations to standardize some aspects of a street name.
  #
  # Args:
  #   street: A street name
  #
  # Returns:
  #   A standardized version of the street name
  std <- toupper(street)
  std <- gsub("\\s+AVE[\\s.]*$", " AVENUE", std, perl = TRUE)
  std <- gsub("\\s+ST[\\s.]*$", " STREET", std, perl = TRUE)
  std <- gsub("\\s+DR[\\s.]*$", " DRIVE", std, perl = TRUE)
  std <- gsub("\\s+PL[\\s.]*$", " PLACE", std, perl = TRUE)
  std
}


plot_avg_wkday_traffic <- function(traffic_data) {
  # Creates a histogram of average weekday traffic across locations
  #
  # Args:
  #   traffic_data: A traffic dataset as a data frame
  #
  # Returns:
  #   A ggplot object representing the histogram
  
  plt_data <- traffic_data %>% 
    group_by(Main.Location) %>% 
    summarize(avg_WDT = mean(AAWDT)) %>%
    filter(avg_WDT > 1)
  
  ggplot() +
    geom_bar(stat = "identity") + 
    aes(x = plt_data$Main.Location, y = plt_data$avg_WDT) +
    labs(x = "Main Location", y = "Avg Weekday Traffic") +
    theme(axis.text.x = element_blank(), axis.ticks.x = element_blank())
}

