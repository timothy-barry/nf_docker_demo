library(magrittr)
args <- commandArgs(trailingOnly = TRUE)

beta_0 <- as.integer(args[1L])
beta_1 <- 3
n <- 1000
x <- runif(n = n, min = 0, max = 10)
ep <- rnorm(n = n)
y <- beta_0 + beta_1 * x + ep

fit <- lm(y ~ x)
out <- broom::tidy(fit) %>% dplyr::mutate(beta_0 = beta_0)
saveRDS(out, file = "fitted_model.rds")