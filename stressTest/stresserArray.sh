#!/bin/bash

for e in {1..30};
do Rscript stresser.R &
done;
