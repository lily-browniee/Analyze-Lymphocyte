### Results of single regression, BMI x Lymphocytes boxplot
```
> ggplot(IBS, aes(x = BMI, y = Lymphocytes)) + geom_point() + geom_smooth(method = lm) 
> png("fig_output/Lymphocytes_boxplot.png")
> Lymphocytes_boxplot <- ggplot(IBS, aes(x = BMI, y = Lymphocytes)) + geom_point() + geom_smooth(method = lm) 
> print(Lymphocytes_boxplot)

Call:
lm(formula = BMI ~ Lymphocytes, data = IBS1)

Coefficients:
(Intercept)  Lymphocytes  
     21.869        2.458

```

![](/fig_output/Lymphocytes_boxplot.png)