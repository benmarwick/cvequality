## Test environments
* local OS X install, R 3.3.1
* ubuntu 12.04 (on travis-ci), R 3.3.1
* win-builder (devel and release)

# Notes to self about testing

# Windows on CRAN
devtools::build_win()

# r-hub multiple systems
devtools::install_github("r-hub/rhub")
rhub::validate_email()
rhub::list_validated_emails()
rhub::check_on_linux()
rhub::check_on_windows()
rhub::check_for_cran()

## R CMD check results

0 errors | 0 warnings | 0 note

* This is a new release.

## Reverse dependencies

This is a new release, so there are no reverse dependencies.

