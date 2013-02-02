#!/bin/env Rscript

library(rtape);
Sys.getpid()->w;

for(e in 1:100){
 message(sprintf("%s %s",w,e));
 Sys.time()->t;
 k<-list(pid=w,e=e,t=t);
 rtapeAdd('stress.tape',k,safe="retry");
}

