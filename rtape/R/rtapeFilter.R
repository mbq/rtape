rtapeFilter<-function(fNameIn,fNameOut,FUN,...){
 rtapeRerecord(fNameIn,fNameOut,function(x){
  if(FUN(x,...)) x else NULL
 },skipNULLs=TRUE)
}

