## Test environments
* OS X         (on travis-ci), R 3.3.2
* ubuntu 12.04 (on travis-ci & r-hub), R 3.3.2  
* win-builder (devel and release)

## Fourth attempt at initial submit

* Kurt Hornik writes "DOI processing does not handle embedded < and >."
* recommends I try percent-encoding for angle brackets in DOI, so I've made that change. 

R CMD check results
0 errors | 0 warnings | 1 note (from win-build)

* checking CRAN incoming feasibility ... NOTE
Maintainer: 'Ben Marwick <benmarwick@gmail.com>'

New submission

Possibly mis-spelled words in DESCRIPTION:
  Feltz (8:126)
  Krishnamoorthy (8:247)

## Third attempt at initial submit

* Kurt Hornik writes "pls provide DOIs for the references in the Description"
* Added DOIs in Description like so: Author (date) <DOI:xxx/xxx>

R CMD check results
0 errors | 0 warnings | 1 note (from win-build)

Possibly mis-spelled words in DESCRIPTION:
  Feltz (8:126)
  Krishnamoorthy (8:243)

Found the following (possibly) invalid DOIs:
  DOI: 10.1002/(SICI)1097-0258(19960330)15:6<647::AID-SIM184
    From: DESCRIPTION
    Status: Not Found
    Message: 404

## Second attempt at initial submit

* Received feedback from Uwe Ligges
* Corrected misspellings of 'coefficient'
* Added DOIs to references cited, using \doi{} rather than <doi:>, because that's what the win-builder logs say to do

R CMD check results

0 errors | 0 warnings | 1 note

* The note is that this is a new release:

    #> Maintainer: 'Ben Marwick '
 243#> New submission
 244#> License components with restrictions and base license permitting such:
 245#> MIT + file LICENSE
 246#> File 'LICENSE':
 247#> YEAR: 2016
 248#> COPYRIGHT HOLDER: Ben Marwick & Kalimuthu Krishnamoorthy

## Initial submit

R CMD check results

0 errors | 0 warnings | 1 note

* The note is that this is a new release:

    #> Maintainer: 'Ben Marwick '
 243#> New submission
 244#> License components with restrictions and base license permitting such:
 245#> MIT + file LICENSE
 246#> File 'LICENSE':
 247#> YEAR: 2016
 248#> COPYRIGHT HOLDER: Ben Marwick & Kalimuthu Krishnamoorthy

## Reverse dependencies

This is a new release, so there are no reverse dependencies.

# -------------------------------------------------------------------

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

