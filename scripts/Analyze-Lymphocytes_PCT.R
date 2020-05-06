
## BTEC330 Project2
## By Hana G Velecina

setwd("./")

## Install necessary packages
install.packages("ggplot2")
library(ggplot2)

## Read data
IBS <- read.csv("../data/GSE124549_20200330.csv", header = TRUE)
IBS <- read.csv("data/RobinsonEtAl_Sup1.csv", header = TRUE)

head(IBS)

IBS$Lymphocytes_PCT_result <- "NA"

## Assign "HIGH", "NORMAL", or "LOW" based on clinical range to the Lymphocytes_PCT_result parameter

IBS$Lymphocytes_PCT_result[IBS$Lymphocytes_PCT > 54] <- "HIGH"

IBS$Lymphocytes_PCT_result[IBS$Lymphocytes_PCT <= 19 & IBS$Lymphocytes_PCT >= 53] <- "NORMAL"

IBS$Lymphocytes_PCT_result[IBS$Lymphocytes_PCT < 18] <- "LOW"

write.csv(IBS, "data_output/Lymphocytes_PCT.csv")

## BTEC395 spring2020 Final Project (new lines of codes)

##  Single Regressions 
##  Data obtained from Robinson, et al. 2019 (doi: https://doi.org/10.1101/608208)
##  https://statquest.org/2017/10/30/statquest-multiple-regression-in-r/
##  http://www.sthda.com/english/articles/40-regression-analysis/167-simple-linear-regression-in-r/
##  http://r-statistics.co/Linear-Regression.html

## Single Regression Test, BMI vs. Lymphocytes_PCT parameter
Lymphocytes_PCT.regression <- lm(Body.Mass.Index..BMI...kg.m.2. ~ Lymphocytes_PCT...., data = IBS)
summary(Lymphocytes_PCT.regression)

## Recursive analysis for regression  - RNA Expression
## https://stackoverflow.com/questions/42464767/how-to-run-lm-regression-for-every-column-in-r
## https://stackoverflow.com/questions/44170937/performing-lm-and-segmented-on-multiple-columns-in-r
## http://www.learnbymarketing.com/tutorials/explaining-the-lm-summary-in-r/
## https://tutorials.iq.harvard.edu/R/Rstatistics/Rstatistics.html


## Access only the columns with RNA Expression
names(IBS)[37:286]

##  Make a data frame of list type
storage <- list()

## linear regression for each expressed gene
for(i in names(IBS)[37:286]){
  storage[[i]]  <- lm(get(i) ~ Lymphocytes_PCT...., IBS)
}

summary(storage$AGO2)
summary(storage$AGO2)$r.squared
summary(storage$AGO2)$coefficients[,4]

## output the results of the 250 genes in data_output folder
sink('../data_output/Lymphocytes_PCT_storage.txt', append = TRUE)
print(storage)
sink()



## Output the results to a file
## http://www.cookbook-r.com/Data_input_and_output/Writing_text_and_output_from_analyses_to_a_file/
sink('data_output/Lymphocytes_PCT_regression.txt', append = TRUE)
print(Lymphocytes_PCT.regression)
sink()

## ANOVA: IBS-subtype vs. Lymphocytes_PCT parameter
## http://www.sthda.com/english/wiki/one-way-anova-test-in-r
Lymphocytes_PCT.aov <- aov(Lymphocytes_PCT ~ IBS.subtype, data = IBS)
summary(Lymphocytes_PCT.aov)
sink('data_output/Lymphocytes_PCT_anova.txt', append = TRUE)
print(Lymphocytes_PCT.aov)
sink()

## Print scatterplot and box plots as .png files into "fig_output" project directory.
## http://www.sthda.com/english/wiki/ggsave-save-a-ggplot-r-software-and-data-visualization

## Scatterplots
## https://www.statmethods.net/graphs/scatterplot.html

ggplot(IBS, aes(x = BMI, y = Lymphocytes_PCT)) +
  geom_point() +    
  geom_smooth(method = lm) 

png("fig_output/Lymphocytes_PCT_scatterplot.png")
Lymphocytes_PCT_scatterplot <- ggplot(IBS, aes(x = BMI, y = Lymphocytes_PCT)) +
  geom_point() +    
  geom_smooth(method = lm) 

print(Lymphocytes_PCT_scatterplot)
dev.off()

## Box plots
## https://www.statmethods.net/graphs/boxplot.html

boxplot(Lymphocytes_PCT ~ IBS.subtype, data = IBS, main="Lymphocytes_PCT by IBS subtype", 
        xlab = "IBS.subtype", ylab = "Lymphocytes_PCT"
)

png("fig_output/Lymphocytes_PCT_boxplot.png")
Lymphocytes_PCT_boxplot <- boxplot(Lymphocytes_PCT ~ IBS.subtype, data = IBS, main="Lymphocytes_PCT by IBS subtype", 
                       xlab = "IBS.subtype", ylab = "Lymphocytes_PCT"
)
print(Lymphocytes_PCT_boxplot)
dev.off()



