renv::install("usethis")
renv::install("roxygen2")
renv::install("devtools")


usethis::use_package("quickr")

usethis::use_namespace(roxygen = TRUE)

fs::dir_delete("src")

quickr::compile_package()

devtools::document()

devtools::install()

a <- runif (100000); b <- runif (100)
quickrtest::convolve(a, b)
