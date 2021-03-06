## BTEC395 Project
## By Hana G Velecina

## Install necessary packages
install.packages("ggplot2")
library(ggplot2)
# library(ggrepel)

## set working directory to source file location 

setwd("./data/")

## Read data
IBS1 <- read.table("../data/IBSGXData.txt", sep = "\t", header = TRUE)
View(IBS1)


## Lymphocytes_PCT Single Regression Test vs DROSHA gene
Lymphocytes.regression <- lm(DROSHA ~ Lymphocytes_PCT.... , data=IBS1)
summary(Lymphocytes.regression)

## Lymphocytes_PCT Scatterplots vs DROSHA gene
ggplot(IBS1, aes(x=DROSHA, y=Lymphocytes_PCT....)) +
  geom_point() +    
  geom_smooth(method=lm) 

## Read data
IBS <- read.csv("../data/GSE124549_20200330.csv", header = TRUE)

head(IBS)

## Recursive analysis for regression  - RNA Expression

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

## Read in the table of fold changes
FCdata <- read.csv("../data/FC.csv", row.names = 1, header = FALSE)

## Read in the table of expression data
IBS <- read.csv("../data/GXdata.csv", header = TRUE)

## Access only the columns with RNA Expression (subsetting)
names(IBS)[28:277]

## Make a list of anova(lm()) results for bloodwork parameter
storage <- list()

for(i in names(IBS)[28:277]){
  storage[[i]]  <- anova(lm(get(i) ~ LymphocytePCT, IBS))
}

## Extract the p-values into a new list
pVals <- list()

for(i in names(storage)){
  pVals[[i]] <- -(log10(storage[[i]]$'Pr(>F)'))
}

## Convert the pValues list into a data frame. 
DFpvalues <- data.frame(matrix(unlist(pVals), nrow=length(pVals), byrow=T))

## Combine the results dataframes and write column labels

VolcanoPlotData <- cbind(FCdata, DFpvalues)
names(VolcanoPlotData)[1] <- paste("log2(slopeDiff)")
names(VolcanoPlotData)[2] <- paste("-log10(Pval)")

## Add a column to evaluate significance

VolcanoPlotData$Sig <- ifelse(VolcanoPlotData$`-log10(Pval)` > 1.3, "Sig", "Insig");

## Make a volcano-style scatterplot for these results

png("../fig_output/LymphocytePCTplot.png")
LymphocytePCTplot <- ggplot(VolcanoPlotData, aes(x = `log2(slopeDiff)`, y = `-log10(Pval)`, label=rownames(VolcanoPlotData), color=Sig)) +
  geom_point(aes(color = Sig)) +
  scale_color_manual(values = c("grey", "red")) +
  theme_bw(base_size = 12) + theme(legend.position = "bottom") +
  geom_text(aes(x = `log2(slopeDiff)`,y = `-log10(Pval)`, fontface = 1, size=3,  label=row.names(VolcanoPlotData)))

print(LymphocytePCTplot + ggtitle("Gene Expression vs. LymphocytePCT Level"))
dev.off()
