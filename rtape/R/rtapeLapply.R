#' Iterate over tape, gathering results.
#'
#' This function read the tape from the oldest to the newest writes and executes the callback function on each read object. Logically, it is an equivalent to \code{lapply(rtapeAsList(fName),FUN,...)}, but it is optimized to store only the currently processed object in the memory.
#'
#' @param fNames Name of the tape file to read; if this argument is a vector of several names, function behaves as reading a single tape made of all those tapes joined in a given order.
#' @param FUN Callback function.
#' @param ... Additional parameters to \code{FUN}.
#' @param HEAD Only process \code{HEAD} first objects on the tape.
#' @return A list containing results of \code{FUN} calls; converted objects will have names if given when via \code{rtapeAdd} when appending to tape.
#' @author Miron B. Kursa \email{M.Kursa@@icm.edu.pl}
#' @examples
#' unlink('tmp.tape')
#' #Record something on the tape
#' rtapeAdd('tmp.tape',runif(3))
#' rtapeAdd('tmp.tape',runif(4))
#' rtapeAdd('tmp.tape',rnorm(7))
#'
#' #Print tape objects' lengths
#' rtapeLapply('tmp.tape',length)
#' unlink('tmp.tape')

rtapeLapply<-function(fNames,FUN,...,HEAD=Inf){
 match.fun(FUN)->FUN
 processed<-0
 ans<-list()
 for(fName in fNames){
  guessFileFormat(fName)(fName,open="rb")->con
  while(!.ckErr(try(unserialize(con),silent=TRUE)->x)){
   xN<-as.character(attr(x,".rtape.name"));
   NULL->attr(x,".rtape.name")
   list(FUN(x,...))->xx;
   if(!is.null(xN) || !is.na(xN)){
    names(xx)<-xN;
   }else{
    ans<-c(ans,list())
   }
   processed<-processed+1
   if(processed==HEAD){
    close(con)
    return(ans)
   }
  }
  close(con)
 }
 ans
}
