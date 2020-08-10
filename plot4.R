## Load the data for limited rows from file
library(data.table)
filename <- 'household_power_consumption.txt'
DT <- fread(filename, skip = 66637, nrow = 2880)

## Add back the column names
names(DT) <- names(fread(filename, nrow = 0))

## Open png device
png(filename = 'plot4.png', width = 480, height = 480)

## Define 2x2 panels with transparent background
par(mfrow = c(2, 2), bg = NA)

## Plot 4
with(DT, {
    datetime <- strptime(paste(Date, Time), '%d/%m/%Y %H:%M:%S')

    ## Panel 1
    plot(
        x = datetime, y = Global_active_power,
        type = 'l',
        xlab = NA, ylab = 'Global Active Power',
    )

    ## Panel 2
    plot(
        x = datetime, y = Voltage,
        type = 'l',
        xlab = NA, ylab = 'Global Voltage Power',
    )

    ## Panel 3
    plot(
        x = datetime, y = Sub_metering_1,
        col = 'black', type = 'l',
        xlab = NA, ylab = 'Energy sub metering',
    )
    lines(x = datetime, y = Sub_metering_2, col = 'red')
    lines(x = datetime, y = Sub_metering_3, col = 'blue')
    legend('topright', legend = tail(names(DT), n = 3), col = c('black', 'red', 'blue'), lty = 1, bty = 'n')

    ## Panel 4
    plot(
        x = datetime,
        y = Global_reactive_power,
        type = 'l',
        xlab = NA,
        ylab = 'Global_reactive_power',
    )
})

## Close device
dev.off()
