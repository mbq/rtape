#!/bin/bash

rm -rf readyPkg/
mkdir readyPkg
mkdir readyPkg/rtape/
cp rtape/DESCRIPTION readyPkg/rtape/.
cp rtape/NAMESPACE readyPkg/rtape/.
mkdir readyPkg/rtape/R
cp rtape/R/*.R readyPkg/rtape/R/.
cd readyPkg
R CMD roxygen -d rtape
R CMD build rtape
cd ..

