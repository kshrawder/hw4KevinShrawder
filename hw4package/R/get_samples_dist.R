#' Function 1
#'
#' Generates random samples from 4 different distributions
#' @param dname name of the distribution (normal, t, F, Binomial)
#' @param n number of samples
#' @param mean vector of means for normal distribution
#' @param sd vector of standard deviations for normal distribution
#' @param df degrees of freedom for t distribution (> 0, maybe non-integer). df = Inf is allowed
#' @param dfn degrees of freedom for the numerator of the f distribution (> 0, maybe non-integer). df = Inf is allowed
#' @param dfd degrees of freedom for the denominator of the f distribution (> 0, maybe non-integer). df = Inf is allowed
#' @param size number of trials for the Binomial distribution (zero or more)
#' @param p probability of success on each trial for Binomial distribution
#' @param seed integer vector for the random number generation in R
#'
#' @return
#' @export
#'
#' @examples
#'
get_samples_dist <- function(dname, n, mean = 0, sd = 1, df = n - 2, dfn = 2, dfd = n - 2, size = 10, p = .1, seed = FALSE) {
  if (n %% 1 == 0) {
    if ((dname == "Normal") | (dname == "normal")) {
      out <- rnorm(n, mean, sd)
      return(out)
    } else if ((dname == "T") | (dname == "t")) {
      out <- rt(n, df)
      return(out)
    } else if ((dname == "F") | (dname == "f")) {
      out <- rf(n, dfn, dfd)
      return(out)
    } else if ((dname == "Binomial") | (dname == "binomial") | (dname == "binom")) {
      if (seed != FALSE) {
        if (seed %% 1 == 0) {
          set.seed(seed)
          out <- rbinom(n, size, p)
          return(out)
        } else {
          stop("seed must be an integer")
        }
      } else {
        out <- rbinom(n, size, p)
        return(out)
      }
    } else {
      stop("Distribution name not recognized")
    }
  } else {
    stop("n must be an integer")
  }
}
