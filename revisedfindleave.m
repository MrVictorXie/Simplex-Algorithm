function [leave] = revisedfindleave(Bmatrix,as,xb,phase,n,indices)
% revisedfindleave finds the leaving variable of a basis matrix in phase 1
% or phase 2.
% Inputs:
%   Bmatrix, is the m by m sized basis matrix of our constraints matrix A.
%   as, is the entering nonbasic column from matrix A.
%   xb, is the vector of basic variables.
%   phase, is 1 for phase 1, or 2 for phase 2.
%   n, is the number of columns in Bmatrix
%   indices, is the indices of the basis matrix as a vector.
% Outputs:
%   leave, is the column leaving the basis matrix.
% Author: Victor Xie

B_inv_as = inv(Bmatrix) * as;
leave = 0;
minratio = 10000000000000000; % stupidly large number to start
for i = 1:n
    if (phase == 2) && xb(i) == 0
        if B_inv_as(i) ~= 0
            minratio = 0;
            leave = i;
        end
    else
        if B_inv_as(i) > 0
            ratio = xb(i) / B_inv_as(i);
            if (ratio < minratio)
                minratio = ratio;
                leave = i;
            end
        end
    end
end

