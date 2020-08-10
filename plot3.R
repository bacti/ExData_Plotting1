## Load the data for limited rows from file
library(data.table)
filename <- 'household_power_consumption.txt'
DT <- fread(filename, select = c(1, 2, 7, 8, 9), skip = 66637, nrow = 2880)

## Add back the column names
names(DT) <- c('Date', 'Time', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')

## Open png device
png(filename = 'plot3.png', width = 480, height = 480)

## Prepare transparent background
par(bg = NA)

## Plot 3
with(DT, {
    datetime <- strptime(paste(Date, Time), '%d/%m/%Y %H:%M:%S')
    plot(
        x = datetime,
        y = Sub_metering_1,
        col = 'black',
        type = 'l',
        xlab = NA,
        ylab = 'Energy sub metering',
    )
    lines(x = datetime, y = Sub_metering_2, col = 'red')
    lines(x = datetime, y = Sub_metering_3, col = 'blue')
    legend('topright', legend = tail(names(DT), n = 3), col = c('black', 'red', 'blue'), lty = 1)
})

## Close device
dev.off()
