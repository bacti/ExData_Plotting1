## Load the data for limited rows from file, select the first 3 columns only
library(data.table)
filename <- 'household_power_consumption.txt'
DT <- fread(filename, select = c(1, 2, 3), skip = 66637, nrow = 2880)

## Add back the column names
names(DT) <- c('Date', 'Time', 'Global_active_power')

## Open png device
png(filename = 'plot2.png', width = 480, height = 480)

## Prepare transparent background
par(bg = NA)

## Plot 2
with(DT, {
    datetime <- strptime(paste(Date, Time), '%d/%m/%Y %H:%M:%S')
    plot(
        x = datetime,
        y = Global_active_power,
        type = 'l',
        xlab = NA,
        ylab = 'Global Active Power (kilowatts)',
    )
})

## Close device
dev.off()
