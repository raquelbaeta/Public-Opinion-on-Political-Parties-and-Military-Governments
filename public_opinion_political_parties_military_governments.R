# Start

# title: Examining the relationship of public opinion on political parties and military governments
# author: "Raquel Baeta"
# date: "2022-05-12"

# load packages
library(haven) 

# load data set
bfo <- read_spss("bfo_r7_data_eng.sav")  # tibble

# clean tibble
names(bfo)  # the column names
names(bfo) <- tolower(names(bfo))
names(bfo) # check the columns are lower case

# q27b: There are many ways to govern a country. Would you disapprove or approve of the following alternatives: The army comes in to govern the country?

###
# Burkina Faso
###

# values from the questionnaire
table(bfo$q27b)
table(as_factor(bfo$q27b)) # shows labels

# un-coded levels for q27a
bfo.q27b.labels <- c("strongly disapprove", 
                     "dispprove",
                     "neutral",
                     "approve", 
                     "strongly approve",
                     "don't know")

# factor Labels
bfo$q27b.f <- factor(bfo$q27b,
                     levels=c(1:5, 9),
                     labels=bfo.q27b.labels)

# view un-coded responses
table(bfo$q27b.f)

# plot un-coded variable
bfo.q27b.plot1 <- plot(bfo$q27b.f, 
                       main="Burkina Faso: Opinions on military government", 
                       ylab="Number of respondents")

# re-coding labels 
bfo$q27b.rc <- factor(bfo$q27b)
levels(bfo$q27b.rc) <- list("disapprove" = c(1, 2),
                            "approve" = c(4, 5))
table(bfo$q27b.rc) # check

# plotting re-coded data
bfo.q27b.plot2 <- plot(bfo$q27b.rc, 
                       main = "Burkina Faso: Opinions on military government (recoded)", 
                       ylab = "Number of respondents")

# respondent's gender 
table(bfo$thisint)  # the values from the questionnaire

# un-coded answered for gender
bfo.gender.labels <- c("male", "female")
bfo$gender <- factor(bfo$thisint,
                     levels = 1:2,
                     labels = bfo.gender.labels)

# view un-coded answers
table(bfo$gender) # shows labels

# plot
bfo.q27b.plot3 <- plot(bfo$gender, 
                       main = "Overview of gender in Burkina Faso", 
                       ylab = "Number of respondents")

###
# Burkina Faso: Bivariate analysis
###

###
# Burkina Faso: un-coded bivariate analysis
###

# proportions table
bfo.q27b.tab <- table(bfo$q27b.f) # assign table

# relative frequencies
proportions(bfo.q27b.tab) 

# percentage frequencies 
proportions(bfo.q27b.tab) * 100 

# rounding percentages 
round(proportions(bfo.q27b.tab) * 100, digits = 0)

# contingency table 
table(bfo$q27b.f, bfo$gender)

# marginal totals
addmargins(table(bfo$q27b.f, bfo$gender))

# proportions and margin totals
proportions(table(bfo$q27b.f, bfo$gender), margin = 2)

# creating percentages for mosaic plot 
bfo.twoway.tab <- table(bfo$q27b.f, bfo$gender) |>
  proportions(margin = 2) |>
  round(digits = 2)

# mosaic plot 
bfo.mosaic <- mosaicplot(t(bfo.twoway.tab),
                         main = "Burkina Faso: Opinions towards military government, by gender", 
                         las = 1,)

chisq.test(bfo.q27b.tab)

###
# Burkina Faso: coded bivariate analysis 
###

# assign table
bfo.q27b.tab1 <- table(bfo$q27b.rc)

# relative frequencies
proportions(bfo.q27b.tab1)

# percentage frequencies
proportions(bfo.q27b.tab1) * 100

# rounding percentages 
round(proportions(bfo.q27b.tab1) * 100, digits=0)

# contingency table 
table(bfo$q27b.rc, bfo$gender)

# marginal totals
addmargins(table(bfo$q27b.rc, bfo$gender))

# proportions and margin totals
proportions(table(bfo$q27b.rc, bfo$gender), margin=2)

# creating percentages for mosaic plot 
bfo.twoway.tab1 <- table(bfo$q27b.rc, bfo$gender) |>
  proportions(margin = 2) |>
  round(digits = 2)

# mosaic plot 
bfo.mosaic1 <- mosaicplot(t(bfo.twoway.tab1),
                          main = "Burkina Faso: Opinions towards military government, by gender (recoded)", 
                          las = 1)

chisq.test(bfo.q27b.tab1)

###
# Burkina Faso: Proportions of means 
###

# re-coded for calculations
bfo$bad <- vector(length = 1200)
bfo$bad[bfo$q27b %in% 1:2] <- 1 # disapprove
bfo$bad[bfo$q27b %in% 3:5] <- 2 # don't disapprove
bfo$bad[bfo$q27b == 9] <- NA # exclude "don't know"
bfo.bad.labs <- c("disapprove", "don't disapprove")
bfo$bad.f <- factor(bfo$bad, levels = 1:2,
                    labels = bfo.bad.labs)

# column props
bfo.tab <- table(bfo$bad.f, bfo$gender)
proportions(bfo.tab, margin = 2)

# proportion difference (d)
bfo.prop.tab <- proportions(bfo.tab, margin = 2)
bfo.d <- bfo.prop.tab[1, 1] - bfo.prop.tab[1, 2]
bfo.d

# proportion difference (d) test
prop.test(bfo.tab, conf.level = 0.90)

# linear regression
bfo.lm.out <- lm(bfo$q27b.rc ~ bfo$gender, data = bfo)
bfo.lm.out

###
# Comparative Analysis with Botswana
###

# load data set
bot <- read_spss("bot_r7_data_eng.sav")  # a tibble

# clean tibble
names(bot)  # the column names
names(bot) <- tolower(names(bot))
names(bot) # check the columns are lower case

# q27b: There are many ways to govern a country. Would you disapprove or approve of the following alternatives: The army comes in to govern the country?

# the values from the questionnaire
table(bot$q27b)  
table(as_factor(bot$q27b)) # shows labels

# un-coded levels for q27a
bot.q27b.labels <- c("strongly disapprove", 
                     "dispprove",
                     "neutral",
                     "approve", 
                     "strongly approve",
                     "don't know")

# uncoded factors
bot$q27b.f <- factor(bot$q27b,
                     levels = c(1:5, 9),
                     labels = bot.q27b.labels)

# view un-coded responses
table(bot$q27b.f)

# plot un-coded variable
bot.q27b.plot <- plot(bot$q27b.f, 
                      main = "Botswana: Opinions on military government", 
                      ylab = "Number of respondents")

# re-coding labels 
bot$q27b.rc <- factor(bot$q27b)
levels(bot$q27b.rc) <- list("disapprove" = c(1, 2),
                            "approve" = c(4, 5))

table(bot$q27b.rc) # check

# plotting re-coded data
bot.q27b1.plot1 <- plot(bot$q27b.rc, 
                        main = "Botswana: Opinions on military government (recoded)", 
                        ylab = "Number of respondents")

###
# Variable 2: Gender
###

# respondent's gender 
table(bot$thisint)  # the values from the questionnaire

# un-coded answered for gender
bot.gender.labels <- c("male", "female")
bot$gender <- factor(bot$thisint,
                     levels = 1:2,
                     labels = bot.gender.labels)

# view un-coded answers
table(bot$gender) # shows labels

bot.q27b1 <- plot(bot$gender, 
                  main = "Overview of gender in Botswana", 
                  ylab = "Number of respondents")

###
# Botswana: Bivariate analysis
###

###
# Botswana: Un-coded bivariate analysis 
###

# proportions table
bot.q27b.tab <- table(bot$q27b.f) # assign table

# relative frequencies
proportions(bot.q27b.tab)

# percentage frequencies 
proportions(bot.q27b.tab) * 10

# rounding percentages 
round(proportions(bot.q27b.tab) * 100, digits = 0)

# contingency table 
table(bot$q27b.f, bot$gender)

# marginal totals
addmargins(table(bot$q27b.f, bot$gender))

# proportions and margin totals
proportions(table(bot$q27b.f, bot$gender), margin = 2)

# creating percentages for mosaic plot 
bot.twoway.tab <- table(bot$q27b.f, bot$gender) |>
  proportions(margin = 2) |>
  round(digits = 2)

# mosaic plot 
bot.mosaic <- mosaicplot(t(bot.twoway.tab),
                         main = "Botswana: Opinions towards military government, by gender", 
                         las = 1)

chisq.test(bot.q27b.tab)

###
# Botswana: re-coded bivariate analysis 
###

bot.q27b.tab1 <- table(bot$q27b.rc) # assign table

# relative frequencies
proportions(bot.q27b.tab1) 

# percentage frequencies
proportions(bot.q27b.tab1) * 100 

# rounding percentages 
round(proportions(bot.q27b.tab1) * 100, digits=0)

# contingency table 
table(bot$q27b.rc, bot$gender)

# marginal totals
addmargins(table(bot$q27b.rc, bot$gender))

# proportions and margin totals
proportions(table(bot$q27b.rc, bot$gender), margin = 2)

# creating percentages for mosaic plot 
bot.twoway.tab1 <- table(bot$q27b.rc, bot$gender) |>
  proportions(margin = 2) |>
  round(digits = 2)

# mosaic plot 
bot.mosaic1 <- mosaicplot(t(bot.twoway.tab1),
                          main = "Botswana: Opinions towards military government, by gender (recoded)", 
                          las = 1)

chisq.test(bot.q27b.tab1)

###
# Botswana: proportions of means 
###

# re-coded for calculations
bot$bad <- vector(length = 1198)
bot$bad[bot$q27b %in% 1:2] <- 1 # disapprove
bot$bad[bot$q27b %in% 3:5] <- 2 # don't disapprove
bot$bad[bot$q27b == 9] <- NA # exclude "don't know"
bot.bad.labs <- c("disapprove", "don't disapprove")
bot$bad.f <- factor(bot$bad, levels = 1:2,
                    labels = bot.bad.labs)

# column props
bot.tab <- table(bot$bad.f, bot$gender)
proportions(bot.tab, margin = 2)

# proportion difference (d)
bot.prop.tab <- proportions(bot.tab, margin = 2)
bot.d <- bot.prop.tab[1, 1] - bot.prop.tab[1, 2]
bot.d

# proportion difference (d) test
prop.test(bot.tab, conf.level = 0.90)

# linear regression 
bot.lm.out <- lm(bot$q27b.rc ~ bot$gender, data = bot)
bot.lm.out

# end