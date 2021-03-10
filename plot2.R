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

#Because we're only using two dates, we need the granularity of the time stamp.
#So we'll put the time and date columns together into one, in the date data type.
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Assignment dictated graphing device, name, and dimensions:
png("plot2.png", width=480, height=480)

#The assignment wanted these particular things plotted:
plot(datetime, data$Global_active_power, 
      type = "l", 
      main = "Global Active Power",
      ylab = "Global Active Power (kilo watts)",
      xlab = "" #The graph on the course page had no label here.
      )

#According to the lecture, it is super important to close the connection to the 
#png file/graphic device we opened.
dev.off()