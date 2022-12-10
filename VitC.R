# libraries
library(ggplot2)
library(tidyverse)
library(dplyr)
library(interactions)
library(jtools)

jakob = "C:/Users/pertl/Desktop/Studium Mathematik/7. Barcelona/Linear and Generalized Models/Practical Exercise/VitCGroup7.csv"
ema = "your path"
df = read.csv2(jakob)
rm(jakob,ema)
# 1
# outcome

#test
#--------------------------------------------------------------------#
# 2

#add a column for the log of vitamin C
df$pred = log(df$VitaminaC)

#summary
summary(df)
df %>% count(Tractament)
df %>% count(Setmana)

#simple point plot of data
ggplot(data = df) +
  aes(x = Setmana, y = VitaminaC, color = Tractament) +
    geom_point()

# simple point plot of predictor value
ggplot(data = df) +
  aes(x = Setmana, y = pred, color = Tractament) +
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





# 5
mod2 = lm( pred ~ Setmana * Tractament, data = df)
summary(mod2)
interact_plot(mod2, pred = Setmana, modx = Tractament, plot.points = T)
anova(mod2)
Anova(mod2)

A = mod2[["coefficients"]][["(Intercept)"]]
B = A + mod2[["coefficients"]][["Tractamentb"]]
C = A + mod2[["coefficients"]][["Tractamentc"]]
A = exp(A)
B = exp(B)
C = exp(C)
print("Expected VitC Concentration at packaging for different treatments")
cbind(A,B,C)


