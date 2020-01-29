# Clear workspace & load packages ----
rm(list=ls(all=TRUE))
library(tidyverse)

body <- read.table("body.txt", header = TRUE)
summary(body)

# question 4 -----
new.data <- data.frame(height = 175)

slr1 <- lm(data = body, weight ~ height)

predict(slr1, interval = "prediction", newdata = new.data, level = .90)
predict(slr1, interval = "confidence", newdata = new.data, level = .90)

body$weight2 <- body$weight * 2.2
body$height2 <- body$height/ 2.54

# question 5 ----
summary(slr1)
slr2 <- lm(data = body, weight2~height2)
summary(slr2)
