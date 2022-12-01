# libraries
library(ggplot2)
library(tidyverse)
library(dplyr)


# 1
# outcome


#--------------------------------------------------------------------#
# 2

#summary
summary(VitCGroup7)

#simple point plot of data
ggplot(data = VitCGroup7) +
  aes(x = Setmana, y = VitaminaC, color = Tractament) +
    geom_point()

# Correlation between Vitamin and Week
cor(x = VitCGroup7$VitaminaC, y = VitCGroup7$Setmana)

#summary of the data grouped by treatment
summary(VitCGroup7 %>% filter(Tractament == "a"))
summary(VitCGroup7 %>% filter(Tractament == "b"))
summary(VitCGroup7 %>% filter(Tractament == "c"))


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
mod1 = glm( VitaminaC ~ Setmana, data = VitCGroup7, family = "poisson" )
summary(mod1)

# (2)
mod2 = glm( VitaminaC ~ Setmana*Tractament, data = VitCGroup7, family = "poisson" )
summary(mod2)
