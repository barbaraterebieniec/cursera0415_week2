## Part 1
# Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) 
# across a specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory', 
# 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' 
# particulate matter data from the directory specified in the 'directory' argument and returns the mean 
# of the pollutant across all of the monitors, ignoring any missing values coded as NA. 
# A prototype of the function is as follows:

pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  specdata <- dir(directory, pattern = ".csv", recursive = TRUE, full.names = TRUE)[id]
  sub.specdata <- lapply(specdata, read.csv, header = TRUE, sep = ",")
  results <- unlist(lapply(sub.specdata, function(f){
  f[, pollutant]
  }))
  return(mean(results,na.rm = TRUE))
  

  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
}
