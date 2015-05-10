# VK, May 2015

## Reading only the relevant data from the database

hpc <- suppressWarnings(read.csv2.sql(file = "household_power_consumption.txt", 
                                      sql = "select * from file where Date = '1/2/2007' 
                     or Date = '2/2/2007'", header =TRUE, row.names = NULL,
                                      colClasses = "character"))

# Opens PNG device and creates the file plot1.png in the working directory
png(file = "plot1.png")

# Creates and annotates the histogram
hist(as.numeric(hpc$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

# Closes the PNG file device
dev.off()