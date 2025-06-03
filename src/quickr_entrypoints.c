#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>


extern void convolve(
  const double* const a__,
  const double* const b__,
  double* const ab__,
  const R_len_t a__len_,
  const R_len_t b__len_);

SEXP convolve_(SEXP _args) {
  // a
  _args = CDR(_args);
  SEXP a = CAR(_args);
  if (TYPEOF(a) != REALSXP) {
    Rf_error("typeof(a) must be 'double', not '%s'", R_typeToChar(a));
  }
  const double* const a__ = REAL(a);
  const R_xlen_t a__len_ = Rf_xlength(a);

  // b
  _args = CDR(_args);
  SEXP b = CAR(_args);
  if (TYPEOF(b) != REALSXP) {
    Rf_error("typeof(b) must be 'double', not '%s'", R_typeToChar(b));
  }
  const double* const b__ = REAL(b);
  const R_xlen_t b__len_ = Rf_xlength(b);

  const R_xlen_t ab__len_ = ((a__len_ + b__len_) - 1);
  SEXP ab = PROTECT(Rf_allocVector(REALSXP, ab__len_));
  double* ab__ = REAL(ab);

  convolve(
    a__,
    b__,
    ab__,
    a__len_,
    b__len_);

  UNPROTECT(1);
  return ab;
}

static const R_ExternalMethodDef QuickrEntries[] = {
  {"convolve_", (DL_FUNC) &convolve_, -1}
};

#include <R_ext/Rdynload.h>

void R_init_quickrtest_quick_functions(DllInfo *dll) {
  R_registerRoutines(dll, NULL, NULL, NULL, QuickrEntries);
}
