
## BTEC330 Project2 Velecina

## Install necessary packages
install.packages("ggplot2")
library(ggplot2)

## Read data
IBS <- read.csv("data/RobinsonEtAl_Sup1.csv", header = TRUE)
head(IBS)

IBS$Lymphocytes_result <- "NA"

## Assign "HIGH", "NORMAL", or "LOW" based on clinical range to the Lymphocytes_result parameter

IBS$Lymphocytes_result[IBS$Lymphocytes > 54] <- "HIGH"

IBS$Lymphocytes_result[IBS$Lymphocytes <= 19 & IBS$Lymphocytes >= 53] <- "NORMAL"

IBS$Lymphocytes_result[IBS$Lymphocytes < 18] <- "LOW"

write.csv(IBS, "data_output/Lymphocytes.csv")

##  Single Regressions 
##  Data obtained from Robinson, et al. 2019 (doi: https://doi.org/10.1101/608208)
##  https://statquest.org/2017/10/30/statquest-multiple-regression-in-r/
##  http://www.sthda.com/english/articles/40-regression-analysis/167-simple-linear-regression-in-r/
##  http://r-statistics.co/Linear-Regression.html

## Single Regression Test, BMI vs. Lymphocytes parameter
Lymphocytes.regression <- lm(BMI ~ Lymphocytes, data = IBS)
summary(Lymphocytes.regression)

## Output the results to a file
## http://www.cookbook-r.com/Data_input_and_output/Writing_text_and_output_from_analyses_to_a_file/
sink('data_output/Lymphocytes_regression.txt', append = TRUE)
print(Lymphocytes.regression)
sink()

## ANOVA: IBS-subtype vs. Lymphocytes parameter
## http://www.sthda.com/english/wiki/one-way-anova-test-in-r
Lymphocytes.aov <- aov(Lymphocytes ~ IBS.subtype, data = IBS)
summary(Lymphocytes.aov)
sink('data_output/Lymphocytes_anova.txt', append = TRUE)
print(Lymphocytes.aov)
sink()

## Print scatterplot and box plots as .png files into "fig_output" project directory.
## http://www.sthda.com/english/wiki/ggsave-save-a-ggplot-r-software-and-data-visualization

## Scatterplots
## https://www.statmethods.net/graphs/scatterplot.html

ggplot(IBS, aes(x = BMI, y = Lymphocytes)) +
  geom_point() +    
  geom_smooth(method = lm) 

png("fig_output/Lymphocytes_scatterplot.png")
Lymphocytes_scatterplot <- ggplot(IBS, aes(x = BMI, y = Lymphocytes)) +
  geom_point() +    
  geom_smooth(method = lm) 

print(Lymphocytes_scatterplot)
dev.off()

## Box plots
## https://www.statmethods.net/graphs/boxplot.html

boxplot(Lymphocytes ~ IBS.subtype, data = IBS, main="Lymphocytes by IBS subtype", 
        xlab = "IBS.subtype", ylab = "Lymphocytes"
)

png("fig_output/Lymphocytes_boxplot.png")
Lymphocytes_boxplot <- boxplot(Lymphocytes ~ IBS.subtype, data = IBS, main="Lymphocytes by IBS subtype", 
                       xlab = "IBS.subtype", ylab = "Lymphocytes"
)
print(Lymphocytes_boxplot)
dev.off()




