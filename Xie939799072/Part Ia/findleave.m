function [leave] = findleave(m, Bmatrix, as, xb)
% Inputs:
%   m, is the size of a m by m basis matrix
%   Bmatrix, is the m by m sized basis matrix of our constraints matrix A.
%   as, is the entering nonbasic column from matrix A.
%   xb, is the vector of basic variables
% Outputs:
%   leave, is the column leaving the basis matrix.
% Author: Victor Xie

leave = 0; 

% compute B_inverse for ratio test
I = eye(m);
B_inverse = Bmatrix^(-1);
position = [];
p = [];
for i = 1:m
    if (I(:,i)' * B_inverse * as) > 0
        p = [p,(I(:,i)' * xb)/(I(:,i)' * B_inverse * as)];
        position = [position, i];
    end
end

lambda = dictionary(p,position);
minvalue = min(p);
% test for unbounded problem
for i = 1:length(xb)
    if (I(:,i)' * B_inverse * as > 0)
        leave = lambda(minvalue);
    end
end
