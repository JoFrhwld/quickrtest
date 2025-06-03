#' @export
#' @useDynLib quickrtest, .registration = TRUE
convolve <- quickr::quick(function(a, b) {
  declare(type(a = double(NA)),
          type(b = double(NA)))
  ab <- double(length(a) + length(b) - 1)
  for (i in seq_along(a)) {
    for (j in seq_along(b)) {
      ab[i+j-1] <- ab[i+j-1] + a[i] * b[j]
    }
  }
  ab
})
