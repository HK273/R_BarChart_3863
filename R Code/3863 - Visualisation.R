#Install releveant packages
install.packages("ggplot")
install.packages("readxl")
library(ggplot2)
library(readxl)

#Remove objects if neccesary
rm(list = ls()) # Remove all data frames / Objects

#Read Data In
FamIntR <- read_excel("G:/Reports/1. Adhocs/Adhoc Requests Completed/3863 - Family Intervention Appts/FamIntRNew.xlsx")
View(FamIntR)

#Create data frame
df <- data.frame(FamIntR)
str(df)

#Create stacked view of data and add colour scheme
df_base <- ggplot(data = df, aes(x =Ward, y=OutcomePercentage,
                                fill=Outcome)) +scale_fill_brewer(palette="Set1") #Colour scheme

df_base + geom_bar(stat = "identity") 


df_base +
  geom_bar(stat = "identity", #confusing subject, when plotting pivoted data, always leave "identity"
           width = 0.6,      # how wide (0-1) the bars are
           alpha = 0.7) +    # the opaqueness of the fill colors
  theme_grey()+  # the background          
  
  theme(legend.position = "right") +  # legend position
  labs(x= "Ward", y = "Percentage", title = "Form recording and 'Family Intervention' appointments",
       fill = "Category")  # axis labels and footnote
  
  
  
  
  
  
  
  
  
  