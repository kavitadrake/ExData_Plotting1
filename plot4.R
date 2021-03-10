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
png("plot4.png", width=480, height=480)

#Set the parameter of 2x2 (in row order), as depicted in the assignment.
#This should result in two graphs on top and two on bottom.
par(mfrow = c(2, 2))

#Top left/first graph. Unlike plot2.R, there should be no title, and the
#"kilowatts" should be absent.
plot(datetime, data$Global_active_power, 
     type = "l", 
     ylab = "Global Active Power",
     xlab = "" #The graph on the course page had no label here.
     )

#Top right/second graph. Unlike previous and next graphs, this should have
#a label on the x axis, but assignment has it defaulting to the variable name.
plot(datetime, data$Voltage, 
     ylab = "Voltage", 
     type="l"
     )

#Bottom left/third graph is what was generated in plot3.R, so I will copy most
#of the code from there. However, in the assignment graphic the legend had no 
#box around it for this part, so I've changed that from plot3.R.

#First we're setting up the plot with a blank canvas (type = "n"), but putting in
#the label on the left, and a blank label on the bottom, as shown in the assignment.
plot(datetime, data$Sub_metering_1, 
     type = "n", 
     ylab = "Energy sub metering", 
     xlab = ""
      )

#Then we'll add in the data for each of the three sub metering types, 1-3. In the
#assignment graph, it uses a line graph, so that is type = "l". The first submetering
#is in black, so no col specified. 2 and 3 are red and blue, respectively.
points(datetime, data$Sub_metering_1, type = "l")
points(datetime, data$Sub_metering_2, type = "l", col = "red")
points(datetime, data$Sub_metering_3, type = "l", col = "blue")

#Now I'm adding in the legend. First argument tells it where to go. The "legend"
#parameter is the text lines inside the box. In the assignment graphic, these line
#colors correspond to the lines as stated above. The line type "lty" is set to 1
#to get a simple solid line in the color specified.
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"),
       box.lty = 0,
       lty = 1,
       cex = 0.9,
       inset = .01
        )

#And at last the bottom right/fourth graph. Like the second one, this one has
#the variable as the default label for the x axis.
plot(datetime, data$Global_reactive_power, 
     ylab = "Global_reactive_power", 
     type = "l"
     )

#According to the lecture, it is super important to close the connection to the 
#png file/graphic device we opened.
dev.off()