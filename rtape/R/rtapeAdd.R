#' Add object to the tape.
#'
#' This function serializes and appends a given object on the end of the tape file. If the tape file does not exists, it is created.
#'
#' @param fName Name of the tape file.
#' @param what Object to be stored.
#' @param skipNULLs If true and \code{what} is \code{NULL}, nothing is written to the tape. 
#' @param fileFormat File format; normally should be left default. See \code{\link{makeFileFormat}} for details.
#' @note Remember to use the same \code{fileFormat} value to all writes to a certain tape; in not, the tape will become unreadable. 
#' This function is NOT thread/process safe; you must ensure that \code{rtapeAdd} writes to the same tape will never co-occur. The safe version is planned for the next release.
#' @author Miron B. Kursa \email{M.Kursa@@icm.edu.pl}
#' @examples
#' if(file.exists('tmp.tape')) unlink('tmp.tape')
#' #Record something on the tape
#' rtapeAdd('tmp.tape',iris)
#' rtapeAdd('tmp.tape',sin(1:10))
#' #Read whole tape to the list, so we could examine it
#' rtapeAsList('tmp.tape')->stored
#' print(stored)
#' unlink('tmp.tape')

rtapeAdd <-function(fName,what,skipNULLs=FALSE,fileFormat=makeFileFormat()){
 if(skipNULLs & is.null(what)) return(invisible(NULL))
 fileFormat(fName,open="ab")->con
 serialize(what,con,ascii=FALSE)
 close(con)
}

