set.seed(1)
x1 <- 1:100
x2 <- rnorm(100)
x3 <- rnorm(100)
y <- x1 + rnorm(100)
data <- data.frame(y, x1, x2, x3)