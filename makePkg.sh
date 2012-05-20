#!/bin/bash

rm -rf readyPkg/
mkdir readyPkg
mkdir readyPkg/rtape/
cp rtape/DESCRIPTION readyPkg/rtape/.
mkdir readyPkg/rtape/R
cp rtape/R/*.R readyPkg/rtape/R/.
mkdir readyPkg/rtape/inst
cp rtape/inst/NEWS readyPkg/rtape/inst/NEWS
cd readyPkg
Rscript -e "require(roxygen);roxygenize('rtape','rtape',copy=FALSE,use.Rd2=TRUE)"
cp ../rtape/NAMESPACE rtape/.
R CMD build rtape
R CMD check rtape*.tar.gz
cd ..

