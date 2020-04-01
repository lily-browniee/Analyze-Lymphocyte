### Results of single regression, BMI x Lymphocytes_PCT scatterplot
```
> scatterplot(Lymphocytes_PCT ~ IBS.subtype, data = IBS, main="Lymphocytes_PCT by IBS subtype", xlab = "IBS.subtype", ylab = "Lymphocytes_PCT")
> png("fig_output/Lymphocytes_PCT_scatterplot.png")
> Lymphocytes_PCT_scatterplot <- scatterplot(Lymphocytes_PCT ~ IBS.subtype, data = IBS, main="Lymphocytes_PCT by IBS subtype", xlab = "IBS.subtype", ylab = "Lymphocytes_PCT")
> print(Lymphocytes_PCT_scatterplot)

Call:
lm(formula = BMI ~ Lymphocytes_PCT, data = IBS1)

Coefficients:
    (Intercept)  Lymphocytes_PCT  
       25.57843          0.03652  


```

![](/fig_output/Lymphocytes_PCT_scatterplot.png)