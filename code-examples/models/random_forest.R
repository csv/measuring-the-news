wd = '~/Dropbox/code/measuring-the-news/'  # change this to your directory
setwd(wd)

library(randomForest)
library(ggplot2)

# helper fx
split_data <- function(data, model_vars, id='url', per=0.75) {
  # split data into training and test set,
  # usage:
  # split(data=df, model_vars=c('y1', 'y2', ...) id='url', per=0.5)
  # retuns:
  # a list of two dataframes, one the training test 'train'
  # and one the test set 'test'
  # as well as the  corresponding id columns for each set
  
  n <- nrow(data)
  samp <- sample(1:n, n*per)
  train <- data[samp, ]
  train_id <- train[,id]
  test <- data[-samp,]
  test_id <- test[,id]
  list(
    train = train[,model_vars],
    train_id = train_id,
    test = test[,model_vars],
    test_id = test_id
  )
}

# calculate real mean squared error
rmse <- function(error) { 
  sqrt(mean(error^2)) 
}

# calculute mean absolute error
mae <- function(error) { 
  mean(abs(error)) 
}


# fit a random forest model to the data!

# read in data
df <- read.csv('data/reduced-nyt/reduced-nyt.csv', as.is=TRUE)

fread(df)

# variable selection
bin_vars <- names(df)[grep("is_", names(df))]
num_vars = c(
  'time_on_hp', 'nyt_twt_tweets', 'nyt_twt_followers',
  'fb_posts', 'nyt_fb_page_likes', "pub_wknd", 
  "word_count", "flesh_readability", 'n_section_front_links', 
  'n_section_fronts', 'nyt_main', 'liwc_sexual', 'liwc_quant',
  'neg_word_count', 'pos_word_count', 'liwc_neg',
  'number_of_grafs', 'max_hp_rank', 'pageviews'
)
model_vars = c(bin_vars, num_vars)

# split train and test set
dat_list <- split_data(data=df, model_vars=model_vars)

# fit model
rf <- randomForest(log(pageviews) ~ ., data=dat_list$train, importance=TRUE,
                   proximity=TRUE, do.trace=TRUE,
                   ntree=150)

# print Rsquared
cat("R^2:", max(rf$rsq), "\n")

# print variable importance
imp_df <- as.data.frame(rf$importance)
names(imp_df) <- c('per_mse', 'node_purity')
print(imp_df[order(imp_df$per_mse, decreasing=T),])

# fit model to test data
p <- predict(rf, dat_list$test, type = "response", se.fit = TRUE)

# assess actual versus predicted
predicted = as.numeric(p)
actual = log(dat_list$test$pageviews)
error = actual - predicted

# print rmse and mse
print(rmse(error))
print(mae(error))

# plot actual versus predicted
plot_data <- data.frame(actual, predicted)
ggplot(plot_data, aes(x=actual, y=predicted)) + geom_point()