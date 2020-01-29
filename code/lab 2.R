# Clear workspace & load packages ----
rm(list=ls(all=TRUE))
library(tidyverse)

body <- read.table("body.txt", header = TRUE)
summary(body)


new.data <- data.frame(height = 180)

slr1 <- lm(data = body, weight ~ height)

predict(slr1, interval = "prediction", newdata = new.data, level = .95)
predict(slr1, interval = "confidence", newdata = new.data, level = .95)

body$weight2 <- body$weight * 2.2
body$height2 <- body$height/ 2.54

summary(body)


enzyme <- read.table("enzyme.txt", header = TRUE)
summary(enzyme)

plot(x = enzyme$conc, y = enzyme$count,
     xlab = "Concentration",
     ylab =  "Count")

slr2 <- lm(data = enzyme, count ~ conc)
abline(slr2)

resid(slr2)
fitted(slr2)
plot(x = fitted(slr2), y = resid(slr2),
     xlab = "Fitted Values",
     ylab = " Residuals")
abline(h = 0, lty = 2)

qqnorm(y = resid(slr2))
qqline(y = resid(slr2))


slr3 <- lm(log(count)~conc, data = enzyme)


plot(x = fitted(slr3), y = resid(slr3) 
     ,xlab = "Fitted values",
     ylab = "Residuals") 
abline(h=0, lty ="dashed")









