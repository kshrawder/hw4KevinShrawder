
#' Function 2
#'
#' Generates histograms for random samples from 4 different distributions
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
#' @param bins one of:
#'
#'1. a vector giving the breakpoints between histogram cells,
#'
#'2. a function to compute the vector of breakpoints,
#'
#'3. a single number giving the number of cells for the histogram,
#'
#'4. a character string naming an algorithm to compute the number of cells (see ‘Details’),
#'
#'5. a function to compute the number of cells
#'
#'In the last three cases the number is a suggestion only; as the breakpoints will be set to pretty values, the number is limited to 1e6 (with a warning if it was larger). If breaks is a function, the x vector is supplied to it as the only argument (and the number of breaks is only limited by the amount of available memory). freq
#'logical; if TRUE, the histogram graphic is a representation of frequencies, the counts component of the result; if FALSE, probability densities, component density, are plotted (so that the histogram has a total area of one). Defaults to TRUE if and only if breaks are equidistant (and probability is not specified)
#'
#' @return
#' @export
#'
#' @examples
get_plots_dist <- function(dname, n, mean = 0, sd = 1, df = n - 2, dfn = 2, dfd = n - 2, size = 10, p = .1, seed = FALSE, bins = 10) {
  if (n %% 1 == 0) {
    if ((dname == "Normal") | (dname == "normal")) {
      out <- rnorm(n, mean, sd)
      hist(out, breaks = bins, xlab = "Normal Distribution Output", main = "Histogram of Normal Distribution", col = "#003366", border = "#ff6600")
    } else if ((dname == "T") | (dname == "t")) {
      out <- rt(n, df)
      hist(out, breaks = bins, xlab = "T Distribution Output", main = "Histogram of T Distribution", col = "#003366", border = "#ff6600")
    } else if ((dname == "F") | (dname == "f")) {
      out <- rf(n, dfn, dfd)
      hist(out, breaks = bins, xlab = "F Distribution Output", main = "Histogram of F Distribution", col = "#003366", border = "#ff6600")
    } else if ((dname == "Binomial") | (dname == "binomial") | (dname == "binom")) {
      if (seed != FALSE) {
        if (seed %% 1 == 0) {
          set.seed(seed)
          out <- rbinom(n, size, p)
          hist(out, breaks = bins, xlab = "Binomial Distribution Output", main = "Histogram of Binomial Distribution", col = "#003366", border = "#ff6600")
        }else {
          stop("seed must be an integer")
        }
      } else {
        out <- rbinom(n, size, p)
        hist(out, breaks = bins, xlab = "Binomial Distribution Output", main = "Histogram of Binomial Distribution", col = "#003366", border = "#ff6600")
      }
    } else {
      stop("Distribution name not recognized")
    }
  } else {
    stop("n must be an integer")
  }
}
