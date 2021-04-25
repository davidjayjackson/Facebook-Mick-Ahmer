library(dplyr)
library(tidyr)
library(ggplot2)
library(dlookr)

rm (list=ls())
### Fix BAD data
df <- read.csv("./BA.csv")
colnames(df) <- c("Names")
df <-tidyr::separate(df,Names, c("branchID","date","product","sales"), sep = ",")
table(df$product)

df$branchID <- as.numeric(df$branchID)
df$sales <- as.numeric(df$sales)
df$date <- as.Date(df$date)
### Plot total by Date

## Plot Sales by Product for Branch 518
branch <- df %>% filter(branchID =="5181" &  product =='"Yu Note 12"')
summary(branch)
ggplot(branch) + geom_col(aes(x=date,y=sales,fill=product))

### Use Glimpse/dlookr/DT to create summary table

dplyr::glimpse(df)
#summary(df)
dlookr::diagnose_numeric(df) %>% DT::data()
dlookr::diagnose_category(df) %>% DT::datatable()
