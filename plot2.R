# VK, May 2015

## Reading only the relevant data from the database

hpc <- suppressWarnings(read.csv2.sql(file = "household_power_consumption.txt", 
                                      sql = "select * from file where Date = '1/2/2007' 
                                      or Date = '2/2/2007'", header =TRUE, row.names = NULL,
                                      colClasses = "character"))

# Creates a datetime object
dt <- paste(hpc$Date, hpc$Time)

# Transform it into date/time class
datetime <- strptime(dt, "%d/%m/%Y %H:%M:%S")

# Opens PNG device and creates the file plot2.png in the working directory
png(file = "plot2.png")

# Creates and annotates the plot

with(hpc,{ plot(datetime, Global_active_power, type = "l", 
                xlab = "", ylab = "Global Active Power (kilowatts)")})

# Closes the PNG file device
dev.off()


