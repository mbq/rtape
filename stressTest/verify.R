library(rtape);

rtapeAsList('stress.tape')->Q;

print(u<-table(sapply(Q,'[[','e')))

if(all(u==u[1])){
 message("Test passed!");
}else{
 message("Test failed!");
}

