#' Add object to the tape.
#'
#' This function serializes and appends a given object on the end of the tape file. If the tape file does not exists, it is created.
#'
#' @param fName Name of the tape file.
#' @param what Object to be stored.
#' @param skipNULLs If true and \code{what} is \code{NULL}, nothing is written to the tape. 
#' @param fileFormat File format; should be left default. See \code{\link{guessFileFormat}} and \code{\link{makeFileFormat}} for details.
#' @note Remember to use the same \code{fileFormat} value to all writes to a certain tape (or use default format guesser to guarantee this); if not, the tape will become unreadable. For the same reason, don't try to put custom headers/footers or append other data inside tape stream.
#' This function is NOT thread/process safe; you must ensure that \code{rtapeAdd} writes to the same tape will never co-occur. The safe version is planned for the next release.
#' @author Miron B. Kursa \email{M.Kursa@@icm.edu.pl}
#' @examples
#' unlink('tmp.tape')
#' #Record something on the tape
#' rtapeAdd('tmp.tape',iris)
#' rtapeAdd('tmp.tape',sin(1:10))
#' #Read whole tape to the list, so we could examine it
#' rtapeAsList('tmp.tape')->stored
#' print(stored)
#' unlink('tmp.tape')

rtapeAdd <-function(fName,what,skipNULLs=FALSE,fileFormat=guessFileFormat(fName)){
 if(skipNULLs & is.null(what)) return(invisible(NULL))
 fileFormat(fName,open="ab")->con
 serialize(what,con,ascii=FALSE)
 close(con)
}

