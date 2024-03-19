###
## Examining Public Opinion on Military Governments in Burkina Faso and Botswana
##

### Overview

This script performs an exploratory data analysis on public opinion regarding military governments in Burkina Faso and Botswana. The analysis is based on survey data, and it examines the relationship between respondents' opinions and their gender. The script covers data cleaning, recoding, visualization, bivariate analysis, and linear regression.

### Requirements

To run this script, you'll need the following:

R packages: haven, dplyr, tidyr, ggplot2, mosaic, readr, knitr, kableExtra

### Data Sets

The script uses two data sets:

bfo_r7_data_eng.sav: Burkina Faso survey data (SPSS format)
bot_r7_data_eng.sav: Botswana survey data (SPSS format)
Both data sets should be saved in the same directory as the script.

### Script Structure

The script is divided into several sections:

1. Data Loading and Cleaning: Loads the data sets, converts them to tibbles, and cleans the column names.
2. Variable Recoding: Recodes the response options for the main question and the respondents' gender.
3. Data Visualization: Creates bar plots and mosaic plots to visualize the distribution of opinions by gender in both countries.
4. Bivariate Analysis: Performs chi-square tests and proportion tests to examine the relationship between opinions and gender in both countries.
5. Linear Regression: Estimates linear regression models to predict opinions based on gender in both countries.
6. Comparative Analysis: Compares the results of the analyses for Burkina Faso and Botswana.
7. Usage

### Install the required packages:

install.packages(c("haven", "dplyr", "tidyr", "ggplot2", "mosaic", "readr", "knitr", "kableExtra"))

### Load the required packages:
library(haven)
library(dplyr)
library(tidyr)
library(ggplot2)
library(mosaic)
library(readr)
library(knitr)
library(kableExtra)

The script generates several tables and plots to visualize and analyze the data. The main findings are presented in the "Comparative Analysis" section, which summarizes the results for both countries.

### Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

### Contact

For any questions or inquiries, please contact Raquel at raquelcbaeta.sa@gmail.com.

Last Updated: 2023-03-19
