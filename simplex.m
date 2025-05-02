function [z,x,pivalues,indices,exitflag] = simplex(A,b,c,m,n,Bmatrix,indices)
% simplex uses the simplex method from an initial basic feasible solution
% to find the optimal solution to a linear program in standard
% computational form. Returns the last basic feasible solution if problem
% is unbounded.
% Inputs:
%   A, is the constraint matrix
%   b, right-hand sides of the constraints as a column vector
%   c, is the cost coefficients of the variables
%   m, is the number of rows of our A matrix
%   n, is the number of columns of our A matrix
%   Bmatrix, is the basis matrix of A with basic variables
%   indices, is the indices of the basis matrix as a vector.
% Outputs
%   z, is the optimal value of the linear program
%   x, is the optimal solution
%   pivalues, the reduce cost of the feasible basic solutions
%   indices, of the basic soltuions as a vector
%   exitflag, is 0 when optimal solution is found. 1 if the problem is
%   unbounded.
% Author: Victor Xie

s = 1; % some arbitrary value to start the while loop
cb= c(indices);

% default exit flag is zero
exitflag = 0;

while s ~= 0
    pi = cb' *  Bmatrix^(-1);
    pi = pi';
    xb = Bmatrix^(-1) * b;

    % check if solution is BFS
    %if ~all(xb > 0)
    %    exitflag = -1;
    %    break
    %end

    [as, cs, s] = findenter(m,n, A, pi ,c);
    % check if optimal solution was found
    if s == 0
        break
    end
    
    leave = findleave(m, Bmatrix, as, xb);
    % check if problem is unbounded
    if leave == 0 && s ~= 0
        exitflag = -1;
        break
    end

    [Bmatrix, indices, cb] = bupdate(Bmatrix, indices, cb, cs, s, as, leave);
end

% return the values of the solution
pivalues = pi;
z = cb' * xb;
x =  zeros(1,n);
x(indices) = xb;
x = x';


