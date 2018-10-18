function [DELTA]=DeltaBFGS(U,V,W)

Q = (1+(transpose(V)*W*V)/(transpose(V)*U));
  
R = Q*(U*transpose(U))/(transpose(V)*U);

S = ((W*V*transpose(U)) + transpose(W*V*transpose(U)))/(transpose(V)*U);

DELTA = R - S ;
 
end
