#' Setting tape file format/compression.
#'
#' \code{rtape} uses R connections to store data; this function creates a function that is used to create a conenction by the other \code{rtape}'s functions. Changing its parameters allows advanced user to change compression format/level and thus control the speed/file size tradeoff. The default values should give performance similar to this of \code{\link{save}}.
#'
#' @param compression Name of the compression algorithm; should be one of the \code{"none"}, \code{"gz"}, \code{"bz"}, \code{"xz"}. Exact name should be given. See \code{\link{connections}} for details.
#' @param compressionLevel \code{compression} parameter passed to \code{\link{gzfile}}, \code{\link{bzfile}} or \code{\link{xzfile}}. Ignored for \code{compression} equal to \code{"none"}.
#' @return The function to be passed to the \code{fileFormat*} arguments of other \code{rtape}'s functions.
#' @note \code{rtape} uses native R file operations, so cannot store the type of file format inside the tape files; this way, the burden of ensuring the use of the same algorithm for writes and reads lays on the user. Thus, it is strongly advised to use the default values.
#' @author Miron B. Kursa \email{M.Kursa@@icm.edu.pl}

makeFileFormat<-function(compression="gz",compressionLevel=ifelse(compression=="bz",9,6)){
 if(identical(compression,"none")) return(function(f,open) file(f,open=open))
 if(identical(compression,"gz")) return(function(f,open) gzfile(f,open=open,compression=compressionLevel))
 if(identical(compression,"bz")) return(function(f,open) bzfile(f,open=open,compression=compressionLevel))
 if(identical(compression,"xz")) return(function(f,open) xzfile(f,open=open,compression=compressionLevel))
 stop(sprintf("Unknown compression type %s; try one of `none`, `gz`, `bz` or `xz`",compression))
}
