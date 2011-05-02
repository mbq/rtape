rtape_apply<-function(fNames,FUN,...){
 for(fName in fNames){
  file(fName,open="rb")->con
  while(!"try-error"%in%class(try(unserialize(con),silent=TRUE)->x))
   FUN(x,...);
  close(con)
 }
 invisible(NULL)
}

