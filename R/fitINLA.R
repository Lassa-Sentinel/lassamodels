#' Fit data to a linear predictor model using `[inla()]`
#'
#' @description
#' `fitINLA` fits data to a linear predictor model using "`inla`"
#'
#' @param formula An R formula object defining the linear predictor model, _e.g._ `y ~ 1 + z + f()`
#' @param family A string showing the likelihood family, _e.g._ "binomial", "poisson" and other likelihoods available in `[inla.models()]`
#' @param data A data frame with data corresponding to the variables (response and covariates) in the `formula`
#'
#' @param verbose If `TRUE` then `inla` runs in verbose mode
#'
#' @param control_compute_cpo If `TRUE` then
#' @param control_compute_waic If `TRUE` then
#' @param control_compute_dic If `TRUE` then
#' @param control_compute_config If `TRUE` then enables computation of samples from the approximate posterior distribution of `y`.
#' @param control_compute_return_marginals If `TRUE`
#' @param
#'
#' @returns An object of class "`inla`", a list containing xxx
#' @examples
#'
fitINLA <- function(formula, family, data, verbose = FALSE,
                    control_compute_return_marginals = FALSE, control_compute_dic = TRUE, control_compute_cpo = TRUE, control_compute_waic = TRUE, control_compute_config = FALSE,
                    control_predictor_compute = TRUE, control_predictor_link = 1,
                    control_inla_strategy = 'adaptive', control_inla_cmin = 0, control_inla_control_vb = TRUE, control_inla_inla_mode = "experimental",
                    control_fixed_mean_intercept=0, control_fixed_prec_intercept=1, control_fixed_mean=0, control_fixed_prec=1) {

  inla(
    formula = formula,
    family = family,
    data = data,
    verbose = verbose,
    control.compute = list(
      return.marginals = control_compute_return_marginals,
      dic = control_compute_dic,
      cpo = control_compute_cpo,
      waic = control_compute_waic,
      config = control_compute_config
    ),
    control.predictor =  list(
      compute = control_predictor_compute,
      link = control_predictor_link
    ),
    control.inla = list(
      strategy = control_inla_strategy,
      cmin = control_inla_cmin,
      control.vb = list(enable=control_inla_control_vb),
      inla.mode = control_inla_inla_mode
    ),
  control.fixed = list(
    mean.intercept = control_fixed_mean_intercept,
    prec.intercept = control_fixed_prec_intercept,
    mean = control_fixed_mean,
    prec = control_fixed_prec
  ),
  )

}
