# libraries
library(ggplot2)
library(tidyverse)
library(dplyr)

jakob = "C:/Users/pertl/Desktop/Studium Mathematik/7. Barcelona/Linear and Generalized Models/Practical Exercise/VitCGroup7.csv"
ema = "your path"
df = read.csv2(jakob)
rm(jakob,ema)
# 1
# outcome


#--------------------------------------------------------------------#
# 2

#summary
summary(df)

#simple point plot of data
ggplot(data = df) +
  aes(x = Setmana, y = VitaminaC, color = Tractament) +
    geom_point()

# Correlation between Vitamin and Week
cor(x = df$VitaminaC, y = df$Setmana)

#summary of the data grouped by treatment
summary(df %>% filter(Tractament == "a"))
summary(df %>% filter(Tractament == "b"))
summary(df %>% filter(Tractament == "c"))


# thoughts

# simple summary shows: Vitamin C concentration varies a lot,
# max is 5 times the min, also IQR is 17.22

# plot of data shows: VitC concentration decreases over time,
# treatment a and b appear similar while c seems to have higher concentration

# Correlation of weeks and concentration is -0.86, very strong correlation

# summary of each treatment: treatment a and b are quite similar, c seems to differ

#--------------------------------------------------------------------#

# 3
# possible questions
# Is any treatment significantly better than the others?
# By how much does Vitamin C concentration decrease per week?
#--------------------------------------------------------------------#

#4

# (1)
mod1 = glm( VitaminaC ~ Setmana, data = df, family = "poisson" )
summary(mod1)

# (2)
mod2 = glm( VitaminaC ~ Setmana*Tractament, data = df, family = "poisson" )
summary(mod2)
