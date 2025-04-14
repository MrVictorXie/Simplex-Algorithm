function [newBmatrix, newindices, newcb] = bupdate(Bmatrix, indices, cb, cs, s, as, leave)
% bupdate updates the Basis matrix of the current iteration by replacing
% the leaving variable with the entering variable.
% Inputs:
%   Bmatrix, is the current Basis matrix
%   indices, is a column vector of the current identifiers for the basic
%   variables in the current basis matrix.
%   cb, is the cost of the basic varaibles in the basis matrix in a column
%   vector.
%   cs, is the cost of the entering variable.
%   s, is the index of the entering variable.
%   as, is the entering column
%   leave, is the column (pth position) of the basis matrix which leaves
% Outputs:
%   newBmatrix, is the new basis matrix which has the leaving column
%   replaced with the entering column
%   newindices, is the new column vector of identifiers for the basis
%   matrix.
%   newcb, is the new updated costs of the basic variables.
% Author: Victor Xie





