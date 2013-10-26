wd <- '~/Dropbox/code/measuring-the-news/'
setwd(wd)
rm(list=ls())

options(scipen=999)
library(ggplot2)
library(plyr)
library(reshape2)
library(scales)

df <- read.csv('data/reduced-nyt/reduced-nyt.csv', as.is=T)

# correlation heat map of social media and visits
cor_data <- subset(df, select=c("pageviews", "ext_twitter", "ext_fb_total"))
cor_data <- melt(cor(cor_data))
cor_data$Correlation <- cor_data$value

ggplot(cor_data, aes(x=Var1, y=Var2, fill=Correlation)) + 
  geom_tile() +
  scale_fill_continuous(high="tomato", low="#f3f0df") + 
  xlab("") +
  ylab("") + 
  theme_minimal() + 
  labs(title="Correlation of Twitter, Facebook, and Pageviews") + 
  theme(
    text=element_text(family="Helvetica Neue"),
    plot.title=element_text(size=15)
  )

# life of the data
avg_pageviews <- ddply(df, "pub_date", function(x) { 
  data.frame(avg_pageviews = mean(x$pageviews))
})
df <- join(avg_pageviews, df, by="pub_date", type="right")


       
ggplot(df,
       aes(x=ext_twitter+1, y=pageviews)) + 
      geom_point(
        position=position_jitter(width=0.3),
        color="steelblue",
        alpha=0.5
      ) +
       scale_y_log10() +
       scale_x_log10() + 
       stat_smooth(method="lm", color="tomato") + 
       xlab('Shares on Twitter') + 
       ylab('Pageviews') + 
       labs(title="Pageviews vs. shares on Twitter") + 
       theme_minimal() +
       theme(
         text=element_text(family="Helvetica Neue"),
         plot.title=element_text(size=15)
       )
  
# Visits by Time On HP and social
ggplot(df,
  aes(x=time_on_hp + 10, y=pageviews) # add ten to include zero counts on graph
  ) +
  scale_y_log10() + 
  scale_x_log10(breaks = c(10, 110, 510, 1010)) +
  stat_smooth(
    method="lm", 
    se=FALSE, 
    color="grey50", 
    size=0.5, 
    alpha=0.5,
    linetype=2
  ) +
  xlab('Time on homepage (min)') + 
  ylab('Pageviews') + 
  labs(title='Time on homepage vs. pageviews and NYT-tweets') + 
  geom_point(
    aes(
      colour = factor(nyt_main),  
      size = nyt_twt_tweets
    ), 
    alpha = 0.5,
    position=position_jitter(width=0.15)
  ) + 
  scale_color_manual(values=c("steelblue", "tomato")) + 
  scale_size_continuous(range = c(1, 10)) + 
  scale_alpha_continuous(range=c(0.15, 1)) +  
  theme(
    text=element_text(family="Helvetica Neue"),
    plot.title=element_text(size=15)
  ) + 
  theme_minimal()
