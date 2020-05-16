## Analyze Lymphocytes:
 by Hana G Velecina

![doi](Images/zenodo.3373938.svg?sanitize=true)

## Introduction
This project is about comparing data sets of BMI and Lymphocytes vs BMI and Lymphocytes_PCT contained in a csv file to model the relationships between each other. 

### Table of Contents:

- [What is a Lymphocyte](document/what_is_lymphocyte.md)
- #### Results of statistical analysis

     - [High and Low Bounds](document/high_and_low_bound.md)

     - Single regression
          - [BMI x Lymphocytes scatterplot](document/bmi_lymphocyte_scatter.md)
          - [BMI x Lymphocytes boxplot](document/bmi_lymphocyte_boxplot.md)
          - [BMI x Lymphocytes_PCT scatterplot](document/bmi_lymphocyte_pct_scatter.md)
          - [BMI x Lymphocytes_PCT boxplot](document/bmi_lymphocyte_pct_boxplot.md)
          


### R Scripts

[Lymphocytes.R](scripts/Analyze-Lymphocytes.R) will allow you to load a comma-delimited .csv with various datapoints, perform single regressions of Body Mass Index (BMI) vs. Lymphocytes from the Complete Blood Count with Differential (CBC-D) results, and produce 2-D scatterplots, and boxplots for the results.


[Lymphocytes_PCT.R](scripts/Analyze-Lymphocytes_PCT.R) 
will allow you to load a comma-delimited .csv with various datapoints, perform single regressions of Body Mass Index (BMI) vs. Lymphocytes_PCT from the Complete Blood Count with Differential (CBC-D) results, and produce 2-D scatterplots, and boxplots for the results.


#### Input Data Set: 
[RobinsonEtAl_Sup1.csv](data/RobinsonEtAl_Sup1.csv)


## Project BTEC395
### Transformations and Volcano Plots

The following scripts were intended to make statistical significance (P value) versus magnitude of change (fold change) using R of Lymphocytes:

[Analyze-LymphocytesProjectFinalProject.R](scripts/Analyze-LymphocytesFinalProject.R)

[Analyze-Lymphocytes_PCTFinalProject.R](scripts/Analyze-Lymphocytes_PCTFinalProject.R)

#### Volcano Plots

![LymphocyteCountplot.png](fig_output/ LymphocyteCountplot.png)


![LymphocytePCTplot.png](fig_output/LymphocytePCTplot.png)









