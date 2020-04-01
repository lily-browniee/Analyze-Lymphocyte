### Results of single regression, BMI x Lymphocytes_PCT boxplot
```
> boxplot(Lymphocytes_PCT ~ IBS.subtype, data = IBS, main="Lymphocytes_PCT by IBS subtype", xlab = "IBS.subtype", ylab = "Lymphocytes_PCT")
> png("fig_output/Lymphocytes_PCT_boxplot.png")
> Lymphocytes_PCT_boxplot <- boxplot(Lymphocytes_PCT ~ IBS.subtype, data = IBS, main="Lymphocytes_PCT by IBS subtype", xlab = "IBS.subtype", ylab = "Lymphocytes_PCT")
> print(Lymphocytes_PCT_boxplot)

Call:
lm(formula = BMI ~ Lymphocytes_PCT, data = IBS1)

Coefficients:
    (Intercept)  Lymphocytes_PCT  
       25.57843          0.03652 

```

![](/fig_output/Lymphocytes_PCT_boxplot.png)
