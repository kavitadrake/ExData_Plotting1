#This file can be found online at https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#Since I'd rather not download it each time, I've downloaded it and the script is
#running on my local copy:
coursefile <- "./R/learning materials/exploratoryDA/household_power_consumption.txt"

#Only reading in the data for 02/01/2007 through 02/02/2007, which are here:
#rows 66638-69517, and then using the column names from the top.
data <- read.table(coursefile, sep=";", skip = 66637, nrow = 2880, 
                   na.strings = "?",
                   col.names = colnames(read.table(coursefile, sep=";", nrow = 1, header = TRUE))
                   )

#Assignment dictated graphing device, name, and dimensions:
png("plot1.png", width=480, height=480)

#Assignment asked for a bar histogram with these labels and this color:
hist(data$Global_active_power, 
     col ="red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilo watts)")

#According to the lecture, it is super important to close the connection to the 
#png file/graphic device we opened.
dev.off()