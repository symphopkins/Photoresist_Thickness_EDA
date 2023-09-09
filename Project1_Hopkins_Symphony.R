#Create a data frame that contains the dataset for this project in R and apply the 
#R code you’ve learned this week to answer the following questions.
temp_95_C <- c(11.176, 7.089, 8.097, 11.739, 11.291, 10.759, 6.467, 8.315)
temp_100_C <- c(5.263, 6.748, 7.461, 7.015, 8.133, 7.418, 3.772, 8.963)

pt_df <- data.frame(temp_95_C, temp_100_C)



#1. Is there evidence to support the claim that the higher baking temperature results in 
#wafers with a lower mean photoresist thickness? Use α = 0.05.
pt_ttest <- t.test(pt_df$temp_95_C, pt_df$temp_100_C, var.equal=TRUE, conf.level=0.95)
pt_ttest$p.value < 0.05

#With a p-value < 0.05, there is evidence to support that.


#2. What is the P-value for the test conducted in part (2)?
pt_ttest$p.value



#3. Find a 95% confidence interval on the difference in means. 
#Provide a practical interpretation of this interval.
pt_ttest$conf.int

#There is a 95% chance that the confidence interval of
# [0.4995743, 4.5404257] contains the true difference in mean
#photoresist thickness. 



#4. Draw dot diagrams and Box-and-whisker plot to assist in interpreting the results 
#from this experiment.

#for this section we first need to import the necessary libraries
library(ggplot2)
library(reshape2)
library(lattice)

#then we need to reshape the data frame
melt_df <- melt(pt_df)

#Dot Diagram
dotplot(variable~value, data=melt_df, xlab="Photoresist Thickness (in KA)")

#Boxplot
ggplot(data=melt_df, aes(x=variable, y=value)) +geom_boxplot(aes(fill=variable)) +
  labs(x="Temperature (C)",y="Photoresist Thickness (in KA)",
       title="Photoresist Thickness by Temperature")
