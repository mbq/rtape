#!/bin/bash

rm -rf readyPkg/
mkdir readyPkg
mkdir readyPkg/rtape/
cp rtape/DESCRIPTION readyPkg/rtape/.
mkdir readyPkg/rtape/R
cp rtape/R/*.R readyPkg/rtape/R/.
cd readyPkg
Rscript -e "require(roxygen);roxygenize('rtape','rtape',copy=FALSE)"
cp ../rtape/NAMESPACE rtape/.
R CMD build rtape
cd ..

