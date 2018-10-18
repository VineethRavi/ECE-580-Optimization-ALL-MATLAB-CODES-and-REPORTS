function [DELTA]=DeltaDFP(U,V,W)

DELTA = (U*transpose(U))/(transpose(V)*U) - ((W*V)*transpose(W*V))/(transpose(V)*W*V) ;

end