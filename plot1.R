## Load the data for limited rows from file, select the 3rd column only
DT <- fread(filename, select = c(3), skip = 66637, nrow = 2880)

## Add back the column names
names(DT) = c('Global_active_power')

## Open png device
png(filename = 'plot1.png', width = 480, height = 480)

## Prepare transparent background
par(bg = NA)

## Plot 1
with(DT,
    hist(
        x = as.numeric(Global_active_power),
        col = 'red',
        xlab = 'Global Active Power (kilowatts)',
        ylab = 'Frequency',
        main = 'Global Active Power'
    )
)

## Close device
dev.off()
