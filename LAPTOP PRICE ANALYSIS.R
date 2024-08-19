library(dplyr)
library(tidyverse)
library(ggplot2)


#loading the dataset
laptop <- read.csv("laptops_train.csv")
head(laptop)

#checking for null value
# Identify and convert non-standard missing value representations to NA in Operating.System.Version
laptop$Operating.System.Version[laptop$Operating.System.Version == "" | laptop$Operating.System.Version == "NA"] <- NA
# Check for missing values in Operating.System.Version column
missing_values_count <- sum(is.na(laptop$Operating.System.Version))
# Print the count of missing values in Operating.System.Version
print(missing_values_count)

colSums(is.na(laptop))
summary(laptop)

# Get the counts of unique values in the 'Model Name' column
model_name_counts <- table(laptop$`Model.Name`)
# Print the counts
print(model_name_counts)


# Remove 'Model Name' column from the laptop dataframe
laptop <- laptop[, !names(laptop) %in% "Model.Name"]

dim(laptop)
str(laptop)
summary(laptop)
lapply(laptop,class)


laptop$`Screen.Size` <- as.factor(laptop$`Screen.Size`)
# Get unique values as an array
unique_screen_sizes <- levels(laptop$`Screen.Size`)
# Print the unique values
print(unique_screen_sizes)

laptop$`Screen Size` <- gsub('"', '', laptop$`Screen.Size`)
# Print the updated 'Screen Size' column
print(laptop$`Screen.Size`)

head(laptop)


table(laptop$Screen)

fun <- function(display) {
  ifelse(grepl("Touchscreen", display), "Touch", "Non Touch")
}

# Apply the function to 'Screen' column
laptop <- laptop %>%
  mutate(Screen = sapply(Screen, fun))

# Print the updated dataframe
print(laptop)

# Get the counts of unique values in the 'Screen' column
screen_touch <- table(laptop$Screen)
print(screen_touch)
# Create a bar plot using ggplot2
ggplot(data, aes(x = screen_touch, y = count, fill = screen_touch)) +
  geom_bar(stat = "identity") +
  labs(x = "Screen Type", y = "Count", title = "Screen Counts") +
  theme_minimal()


laptop$`CPU` <- as.factor(laptop$`CPU`)
# Get unique values as an array
unique_CPU <- levels(laptop$`CPU`)
# Print the unique values
print(unique_CPU)


cpu_fun<-function(CPU){
  
  if (grepl('i3',CPU)){
    return("i3")}
   else if (grepl('i5', CPU)){
    return("i5")}
   else if(grepl('i7',CPU)){
    return ("i7")}
  else{
    return("others")
  }
}

laptop <- laptop %>%
  mutate(CPU = sapply(CPU, cpu_fun))

laptop_cpu <- table(sapply(laptop$CPU,cpu_fun))
laptop_cpu

CPU_TYPE <- data.frame(laptop_cpu = factor(names(laptop_cpu)), count = as.numeric(laptop_cpu))

# Create a bar plot using ggplot2
ggplot(CPU_TYPE, aes(x = laptop_cpu, y = count, fill = laptop_cpu)) +
  geom_bar(stat = "identity") +
  labs(x = "CPU Type", y = "Count", title = "CPU Counts") +
  theme_minimal()

head(laptop)
laptop <- laptop[, !names(laptop) %in% "Storage"]
head(laptop)



laptop$`RAM` <- as.factor(laptop$`RAM`)
# Get unique values as an array
unique_ram <- levels(laptop$`RAM`)
# Print the unique values
print(unique_ram)


# Split 'RAM' column by 'GB' and extract the first part
laptop$RAM <- sapply(strsplit(as.character(laptop$RAM), 'GB'), function(x) sub("\\D+", "", x[[1]]))
# Print the updated 'RAM' column
print(laptop$RAM)


# Split 'RAM' column by 'GB' and extract the first part
laptop$RAM <- sapply(strsplit(as.character(laptop$RAM), 'GB'), function(x) x[[1]])
# Print the updated 'RAM' column
print(laptop$RAM)

unique_ram <- unique(laptop$RAM)
# Print the unique values
print(unique_ram)

head(laptop)

laptop$`GPU` <- as.factor(laptop$`GPU`)
# Get unique values as an array
unique_GPU <- levels(laptop$`GPU`)
# Print the unique values
print(unique_GPU)


Gpu_fun<-function(GPU){
  
  if (grepl('Nvidia',GPU)){
    return("Nvidia")}
  else if (grepl('AMD', GPU)){
    return("AMD")}
  else if(grepl('Intel',GPU)){
    return ("Intel")}
  else{
    return("others")
  }
}

laptop <- laptop %>%
  mutate(GPU = sapply(GPU, Gpu_fun))

laptop_Gpu <- table(sapply(laptop$GPU,Gpu_fun))
laptop_Gpu
GPU_TYPE <- data.frame(laptop_Gpu = factor(names(laptop_Gpu)), count = as.numeric(laptop_Gpu))

# Create a bar plot using ggplot2
ggplot(GPU_TYPE, aes(x = laptop_Gpu, y = count, fill = laptop_Gpu)) +
  geom_bar(stat = "identity") +
  labs(x = "GPU Type", y = "Count", title = "GPU Counts") +
  theme_minimal()

head(laptop)

laptop$`Operating.System` <- as.factor(laptop$`Operating.System`)
# Get unique values as an array
unique_Operating.System <- levels(laptop$`Operating.System`)
# Print the unique values
print(unique_Operating.System)


table(laptop$Operating.System)


laptop$`Operating.System` <- gsub("macOS", "Mac OS", laptop$`Operating.System`)
# Get the counts of unique values in the updated 'Operating System' column
table(laptop$`Operating.System`)


table(laptop$Operating.System.Version)
sum(is.na(laptop$`Operating.System.Version`))
laptop$`Operating.System.Version` <- as.factor(laptop$`Operating.System.Version`)
# Get unique values as an array
unique_Operating.System.Version <- levels(laptop$`Operating.System.Version`)
# Print the unique values
print(unique_Operating.System.Version)




# Calculate the mode of a numeric vector (custom function)
calculate_mode <- function(x) {
  unique_x <- unique(x)
  unique_x[which.max(tabulate(match(x, unique_x)))]
}
# Calculate the mode of 'Operating System Version' column
os_version_mode <- calculate_mode(laptop$`Operating.System.Version`)
# Fill missing values with the mode
laptop$`Operating.System.Version`[is.na(laptop$`Operating.System.Version`)] <- os_version_mode
# Print the updated dataframe
print(laptop$`Operating.System.Version`)


laptop$`Operating.System.Version` <- as.factor(laptop$`Operating.System.Version`)
# Get unique values as an array
unique_Operating.System.Version <- levels(laptop$`Operating.System.Version`)
# Print the unique values
print(unique_Operating.System.Version)


laptop$`Operating.System.Version` <- gsub("10", "X", laptop$`Operating.System.Version`)
# Get the counts of unique values in the updated 'Operating System' column
table(laptop$`Operating.System.Version`)


# Get unique values from the updated 'Operating System Version' column
unique(laptop$`Operating.System.Version`)



 # Get the counts of unique values in the 'Operating System Version' column
 os_version_counts <- table(laptop$`Operating.System.Version`)
 version_count <- data.frame(os_version_counts = factor(names(os_version_counts)), count = as.numeric(os_version_counts))
 
 
 ggplot(version_count, aes(x = os_version_counts, y = count, fill =os_version_counts)) +
   geom_bar(stat = "identity") +
   labs(x = "Operating System Version", y = "count", title = "Operating System Version Counts") +
   theme_minimal()
 
 head(laptop)

 
 laptop$`Weight` <- as.factor(laptop$`Weight`)
 # Get unique values as an array
 unique_weight <- levels(laptop$`Weight`)
 # Print the unique values
 print(unique_weight)
 
 
 # Split 'RAM' column by 'GB' and extract the first part
 laptop$Weight <- sapply(strsplit(as.character(laptop$Weight), 'kg'), function(x) sub("\\D+", "", x[[1]]))
 # Print the updated 'RAM' column
 print(laptop$Weight)
 
 
 # Split 'RAM' column by 'GB' and extract the first part
 laptop$Weight <- sapply(strsplit(as.character(laptop$Weight), 'kg'), function(x) x[[1]])
 # Print the updated 'RAM' column
 print(laptop$Weight)
 
 unique_weight <- unique(laptop$Weight)
 # Print the unique values
 print(unique_weight)
 
 head(laptop)
 
 
 
 laptop$`Price` <- as.factor(laptop$`Price`)
 # Get unique values as an array
 unique_Price <- levels(laptop$`Price`)
 # Print the unique values
 print(unique_Price)
 
 
 laptop$Price <- substr(as.character(laptop$Price), 1, 7)
 
 # Print the updated 'Price' column
 print(laptop$Price)
 
 
 head(laptop)
 
 
 unique(laptop$Manufacturer)
 
 

man_fun <- function(manu) {
   if (manu %in% c('Apple', 'HP', 'Dell', 'Lenovo', 'Microsoft')) {
     return('Major Brands')
   } else if (manu %in% c('Acer', 'Asus', 'MSI', 'Razer')) {
     return('Gaming Laptops')
   } else if (manu %in% c('Chuwi', 'Huawei', 'Xiaomi', 'Vero')) {
     return('Chinese Brands')
   } else {
     return('Other Brands')
   }
 }
 
 # Apply the function to 'Manufacturer' column
 laptop$Category <- sapply(laptop$Manufacturer, man_fun)
 # Print the updated dataframe with the 'Category' column
 print(laptop)
 # Get the counts of unique values in the 'Manufacturer' column
 manufacturer_counts <- table(laptop$Category)
 lap_manufacturer_counts <- data.frame(Category = factor(names(manufacturer_counts)), count = as.numeric(manufacturer_counts))
 # Create a bar plot using ggplot2
 ggplot(lap_manufacturer_counts, aes(x = Category, y = count, fill = Category)) +
   geom_bar(stat = "identity") +
   labs(x = "category", y = "Count", title = "Manufacturer Counts") +
   theme_minimal()
 
 
category_vs_screen_size <- ggplot(laptop, aes(x = Screen.Size, y = Category)) +
   geom_point(color = "skyblue") +
   labs(title = "category - Screen Size", x = "Screen Size", y = "category") +
   theme_minimal()
category_vs_screen_size



# Convert 'Price' column to numeric (if it's a character or factor)
laptop$Price <- as.numeric(as.character(laptop$Price))

# Calculate average price
avg_price <- mean(laptop$Price, na.rm = TRUE)  # na.rm = TRUE removes NA values while calculating mean

# Create scatter plot
scatter_price_cat <- ggplot(laptop, aes(x = Category, y = Price, color = Category)) +
  geom_point() +
  labs(title = "Price vs. Category", x = "category", y = "Price") +
  theme_minimal() +
  scale_y_continuous(labels = scales::comma)  # Format y-axis labels as numeric without scientific notation

# Print the scatter plot
print(scatter_price_cat)

# Print the average price
print(paste("Average Price:", avg_price))


category_counts <- table(laptop$Category)

pie_chart_categories <- ggplot(data.frame(Category = names(category_counts), Count = as.numeric(category_counts)), 
                               aes(x = "", y = Count, fill = Category)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") +
  labs(title = "Laptop Categories Distribution") +
  theme_void() +
  theme(legend.position = "right")

# Print the pie chart
print(pie_chart_categories)



# Convert 'Price' column to numeric (if it's a character or factor)
laptop$Price <- as.numeric(as.character(laptop$Price))



# Calculate average price
avg_price <- mean(laptop$Price, na.rm = TRUE)  # na.rm = TRUE removes NA values while calculating mean

# Create scatter plot
scatter_price_OS <- ggplot(laptop, aes(x = Operating.System, y = Price, color = Category)) +
  geom_point() +
  labs(title = "Price vs. OS", x = "os", y = "Price") +
  theme_minimal() +
  scale_y_continuous(labels = scales::comma)  

# Print the scatter plot
print(scatter_price_OS)


custom_breaks <- seq(0, 64, by = 5)

# Create the histogram plot with custom x-axis breaks
ram_histogram <- ggplot(laptop, aes(x = as.numeric(as.character(RAM)))) +
  geom_histogram(fill = "skyblue", color = "black", bins = 30) +
  labs(title = "RAM Distribution", x = "RAM (GB)", y = "Frequency") +
  theme_minimal() +
  scale_x_continuous(breaks = custom_breaks)  # Set custom breaks for the x-axis

# Print the histogram
print(ram_histogram)


# Box plot for RAM by Category
ram_category_boxplot <- ggplot(laptop, aes(x = Category, y = as.numeric(as.character(RAM)), fill = Category)) +
  geom_boxplot() +
  labs(title = "RAM Distribution by Category", x = "Category", y = "RAM (GB)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Print the box plot
print(ram_category_boxplot)


# Count the occurrences of each combination of Screen and Category
screen_category_counts <- table(laptop$Screen, laptop$Category)

# Convert the table to a data frame
screen_category_df <- as.data.frame(as.table(screen_category_counts))
colnames(screen_category_df) <- c("Screen", "Category", "Count")

# Stacked bar plot for Screen and Category
screen_category_barplot <- ggplot(screen_category_df, aes(x = Screen, y = Count, fill = Category)) +
  geom_bar(stat = "identity") +
  labs(title = "Screen Distribution by Category", x = "Screen", y = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_manual(values = c("Major Brands" = "skyblue", "Gaming Laptops" = "orange", "Chinese Brands" = "lightgreen", "Other Brands" = "lightpink"))

# Print the stacked bar plot
print(screen_category_barplot)


# Count the occurrences of each combination of Screen and Category
screen_category_counts <- table(laptop$Screen, laptop$Category)

# Convert the table to a data frame
screen_category_df <- as.data.frame(as.table(screen_category_counts))
colnames(screen_category_df) <- c("Screen", "Category", "Count")

# Grouped bar plot for Screen and Category
screen_category_grouped_barplot <- ggplot(screen_category_df, aes(x = Screen, y = Count, fill = Category)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Screen Distribution by Category", x = "Screen", y = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_manual(values = c("Major Brands" = "skyblue", "Gaming Laptops" = "orange", "Chinese Brands" = "lightgreen", "Other Brands" = "lightpink"))

# Print the grouped bar plot
print(screen_category_grouped_barplot)


