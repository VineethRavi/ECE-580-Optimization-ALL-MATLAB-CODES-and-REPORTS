function [DELTA]=DeltaRankone(U,V,W)

DELTA = ((U-W*V)*transpose(U-W*V))/(transpose(V)*(U-W*V));

end