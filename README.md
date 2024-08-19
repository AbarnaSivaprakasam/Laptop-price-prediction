# Laptop-price-Analysis
This repository contains the analysis of the latest available laptops in the market as of October 2023. The analysis aims to uncover patterns, trends, and insights regarding the specifications, pricing, and preferences for different laptop categories.

### Dataset
Source: Kaggle - Laptop Prices Dataset October 2023
Name: Laptops.csv
Records: 977 Observations
Attributes:
Manufacturer
Category
Screen
CPU
RAM
Storage
Operating System
Operating System Version
Weight
Price
### Questions Addressed
Screen Types: What screen types are most commonly manufactured, and by which manufacturers?
CPU and GPU Popularity: Which GPU and CPU types are the most popular among the latest laptops?
Screen Sizes by Brand: What are the most common screen sizes preferred by different brands?
Operating Systems: Which operating systems are widely used, and how do they correlate with laptop prices?
Brand Pricing: Which laptop brands tend to be more expensive?
### Data Cleaning
Removed Columns: The Model Name and Storage columns were removed as they did not provide significant insights.
Handling Missing Values: The Operating System Version column had 136 missing values, which were replaced with the mode value.
Grouping: Laptops were categorized based on Manufacturer, CPU types, and Screen types for a more structured analysis.
Data Type Conversion: Necessary conversions were made to columns like RAM, GPU, Operating System Version, and Weight for accurate analysis.
### Key Insights
Screen Type: Non-touchscreen laptops are more commonly manufactured. Major brands like Apple, Dell, Microsoft, and HP produce both touchscreen and non-touchscreen models.
Screen Size: The most common screen sizes are 13.3’’, 14.0’’, and 15.6’’, with major brands covering all these sizes.
Price Distribution: Chinese brands like Chuwi, Huawei, Xiaomi, and Vero tend to be less expensive, with prices typically under 8,500,000, while major brands offer laptops across a wide price range.
RAM: 8GB RAM is the most common, followed by 4GB. Major brands offer laptops with a variety of RAM sizes, whereas Chinese brands tend to offer lower RAM options.
Operating Systems: Windows is the most widely used operating system across all brands, with Android being the least common, mainly supported by major brands.
CPU and GPU: The Intel i7 CPU and Intel GPUs are the most popular choices among consumers.
### Recommendations
Manufacturers aiming to cater to the education sector should focus on producing laptops that align with the preferences identified in this analysis, such as 13.0’’ screens, 8GB RAM, Windows OS, and Intel i7 CPUs. Consumers looking for reliable laptops for educational purposes can consider major brands offering these specifications.

## Code Overview
The analysis was conducted using R, utilizing libraries such as dplyr, tidyverse, and ggplot2. Key steps include:
1. Loading and inspecting the dataset
2. Handling missing values and performing data cleaning
3. Grouping and categorizing data for analysis
4. Visualizing key insights through various plots


### Visualizations
The analysis includes various visualizations, such as bar plots, scatter plots, and box plots, to illustrate key findings. These visualizations are generated using ggplot2 and provide insights into screen distribution, CPU/GPU popularity, and more.

### Conclusion
This project provides an in-depth analysis of the latest laptop trends, offering valuable insights for both manufacturers and consumers in the market for new laptops.
