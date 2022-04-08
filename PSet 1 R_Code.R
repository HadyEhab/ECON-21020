## Question 8

library(ggplot2)

## a)

n <- 10000
mu <- 0
sigma <- 1
x <- rnorm (n, mu , sigma)

# Plot a histogram of the draws using ggplot2

ggplot(data.frame(x)) +
  geom_histogram(aes(x))

## b)


# Generate a vector of n draws from a uniform(-1, 1) rv
n <- 10000
min_y <- -1
max_y <- 1
y <- runif (n, min_y, max_y)

# Plot a histogram of the draws using ggplot2

ggplot(data.frame(y)) +
  geom_histogram(aes(y))


## Question 9

# b)

my_rbernoulli <- function (n, p) {
  x <- 1*(runif(n)<=p)
  return (x)
}

# Test the custom Bernoulli generator function

x <- my_rbernoulli (10000 , 0.5)
length(x) == 10000 # should return TRUE
mean(x) # should a number near 0.5


# c)


# Define a custom function that returns draws from a Binomial rv
my_rbinomial <- function (n, p, m) {
  h <- replicate(n,sum(my_rbernoulli(m,p)))
}

# Test the custom Binomial generator function
x <- my_rbinomial (10000 , 0.5 , 10)
length(x) == 10000 # should return TRUE
mean(x) # should a number near 5


