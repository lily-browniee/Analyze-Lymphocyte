### Results of single regression, BMI x Lymphocytes scatterplot
```
> ggplot(IBS, aes(x = BMI, y = Lymphocytes)) + geom_point() + geom_smooth(method = lm) 
> png("fig_output/Lymphocytes_scatterplot.png")
> Lymphocytes_scatterplot <- ggplot(IBS, aes(x = BMI, y = Lymphocytes)) + geom_point() + geom_smooth(method = lm) 
> print(Lymphocytes_scatterplot)

Call:
lm(formula = BMI ~ Lymphocytes, data = IBS1)

Coefficients:
(Intercept)  Lymphocytes  
     21.869        2.458 

```

![](/fig_output/Lymphocytes_scatterplot.png)