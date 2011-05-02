rtapeLapply<-function(fNames,FUN,...){
 ans<-list()
 for(fName in fNames){
  file(fName,open="rb")->con
  while(!"try-error"%in%class(try(unserialize(con),silent=TRUE)->x))
   ans<-c(ans,list(FUN(x,...)))
  close(con)
 }
 ans
}
