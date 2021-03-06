## Part 3
# Write a function that takes a directory of data files and a threshold 
# for complete cases and calculates the correlation between sulfate and nitrate
# for monitor locations where the number of completely observed cases 
# (on all variables) is greater than the threshold. The function should return 
# a vector of correlations for the monitors that meet the threshold requirement.
# If no monitors meet the threshold requirement, then the function should return
# a numeric vector of length 0. 
# A prototype of this function follows:

corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        ## Return a numeric vector of correlations
        
        specdata <- dir(directory, pattern = ".csv", recursive = TRUE, full.names = TRUE)
        correlations <- vector("numeric", length = 0)
        for(file in specdata){
                data <- read.csv(file)
                good <- complete.cases(data)
                data_na_rm <- data[good, ]
                no_complete_cases <- sum(good)
                
                if(no_complete_cases > threshold){ 
                        sulfate <- data_na_rm$sulfate
                        nitrate <- data_na_rm$nitrate
                        cor_sul_nit <- cor(sulfate, nitrate)
                        correlations <- c(correlations, cor_sul_nit)
                }
        }
        
        return(correlations)
}