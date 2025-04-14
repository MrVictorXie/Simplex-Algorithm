function [z,x,pivalues,indices,exitflag] = simplex(A,b,c,m,n,Bmatrix,indices)
% simplex uses the simplex method from an initial basic feasible solution
% to find the optimal solution to a linear program in standard
% computational form.
% Inputs:
%   A, is the constraint matrix
%   b, right-hand sides of the constraints as a column vector
%   c, is the cost coefficients of the variables
%   m, is the number of rows of our A matrix
%   n, is the number of columns
%   Bmatrix, is the basis matrix of A with basic variables
%   indices, 