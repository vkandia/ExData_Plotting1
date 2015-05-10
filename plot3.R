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

# Opens PNG device and creates the file plot3.png in the working directory
png(file = "plot3.png")

# Creates and annotates the plot

with(hpc, plot(datetime, Sub_metering_1 , xlab = "", ylab = "Energy sub metering", type = "n"))
with(hpc, lines(datetime, Sub_metering_1, col = "black"))
with(hpc, lines(datetime, Sub_metering_2, col = "red"))
with(hpc, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)

# Closes the PNG file device
dev.off()
     