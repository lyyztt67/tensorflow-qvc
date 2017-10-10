## 准备数据
library(tfestimators)
# library(tidyverse)
indices <- sample(1:nrow(mtcars), size = 0.80 * nrow(mtcars))
train <- mtcars[indices, ]
test  <- mtcars[-indices, ]

## 模型构建
# return an input_fn for a given subset of data
mtcars_input_fn <- function(data) {
  input_fn(data, 
           features = c("disp", "cyl"), 
           response = "mpg")
}
cols <- feature_columns( 
  column_numeric("disp", "cyl")
)
model <- linear_regressor(feature_columns = cols)




## 运行模型
# train the model
model %>% train(mtcars_input_fn(train))

model %>% evaluate(mtcars_input_fn(test))
obs <- mtcars[1:3, ]
model %>% predict(mtcars_input_fn(obs))

