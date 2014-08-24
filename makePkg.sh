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
echo "require(roxygen2);roxygenize('rtape')" | R --vanilla
cp ../rtape/NAMESPACE rtape/.
R CMD build rtape
R CMD check rtape*.tar.gz
cd ..
