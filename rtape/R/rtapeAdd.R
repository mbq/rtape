rtapeAdd <-function(fName,what,skipNULLs=FALSE){
 if(skipNULLs & is.null(what)) return(invisible(NULL))
 file(fName,open="ab")->con
 serialize(what,con,ascii=FALSE)
 close(con)
}

