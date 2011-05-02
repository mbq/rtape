rtapeRerecord<-function(fNamesIn,fNameOut,FUN,...,skipNULLs=FALSE){
 stopifnot(length(fNameOut)==1);
 if(fNameOut%in%fNamesIn){
  fNameOut->fNameOverwrite;fNameOut<-tempfile();
 }
 file(fNameOut,open="ab")->conOut
 rtape_apply(fNamesIn,function(x){
  what<-FUN(x,...)
  if(!(skipNULLs & !is.null(what))) serialize(what,conOut,ascii=FALSE)
  NULL
 })
 close(conOut)
 if(exists(fNameOverwrite)){
  file.remove(fNameOverwrite)
  file.rename(fNameOut,fNameOverwrite)
 }
 return(invisible(NULL))
}

