# Future Sales
# Eugene Lucino - Team Why Axis

# read data (change file path as needed)
sales <- read.csv("Machine Learning/Predict Future Sales/sales_train.csv")

# no missing values here!
colSums(is.na(sales))

# but 6 duplicates; remove with nodup
sales[duplicated(sales),]
nodup <- unique(sales)

# one sale has an item_price of -1!?
summary(nodup$item_price)
nodup[nodup$item_price <= 0,]
nodup[nodup$item_price >= 50000,]

# removed sale with negative item_price
goodSales <- nodup[nodup$item_price >= 0,]
summary(goodSales$item_price)
goodSales[goodSales$item_price < 0.08,]
goodSales[goodSales$item_price >= 100000,]

# negative item_cnt_day indicates returns
summary(goodSales$item_cnt_day)
goodSales[goodSales$item_cnt_day <= -10,]
goodSales[goodSales$item_cnt_day >= 1000,]

# converting dates to actual Date types
goodSales$date <- as.character(goodSales$date)
goodSales$date <- format(goodSales$date, format = "%d.%m.%Y")
goodSales$date <- as.Date(goodSales$date, "%d.%m.%Y")

# change the line below to switch to another date format
goodSales$date <- format(goodSales$date, format = "%d-%m-%Y")

# goodSales is final training dataset
summary(goodSales)

# write to new csv
# use getwd to see where file will save to
# change file path as needed
getwd()
write.csv(goodSales, "salesData.csv")
