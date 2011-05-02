#rtape#

rtape is an [R](http://r-project.org) package for storing huge data in a bit more comfy way than the standard RData format.

Storing huge data in RData format causes problems because of the nessesity to load the whole file to the memory in order to access and manipulate objects inside such file; rtape is a simple solution to this problem. The package contains serveral wrappers of R built-in serialize/unserialize mechanism allowing user to quickly append objects to a tape-like file and later iterate over them requiring only one copy of each stored object to reside in memory a time. 
