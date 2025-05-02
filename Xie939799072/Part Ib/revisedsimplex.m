function [z,x,pivalues,indices,exitflag] = revisedsimplex(A,b,c,m,n,Bmatrix,indices,phase)
% revisedsimplex uses the revised simplex method from an initial solution
% to find the optimal solution to a linear program in standard
% computational form. Returns the last basic feasible solution if problem
% is unbounded.
% Inputs:
%   A, is the constraint matrix
%   b, right-hand sides of the constraints as a column vector
%   c, is the cost coefficients of the variables as column vector
%   m, is the number of rows of our A matrix
%   n, is the number of columns of our A matrix
%   Bmatrix, is the basis matrix of A with basic variables
%   indices, is the indices of the basis matrix as a vector.
%   phase, is 1 or 2 to determine phase of algorithm we are in.
% Outputs
%   z, is the optimal value of the linear program
%   x, is the optimal solution
%   pivalues, the reduce cost of the feasible basic solutions
%   indices, of the basic soltuions as a vector
%   exitflag, is 0 when optimal solution is found. -1 if the problem is
%   unbounded. 1 if problem is infeasible.
% Author: Victor Xie


s = 1; % some arbitrary value to start the while loop
cb= c(indices);

% default exit flag is zero
exitflag = 0;
isbasic = zeros(n,1);
isbasic(indices) = 1;

while s ~= 0
    pi = cb' *  Bmatrix^(-1);
    pi = pi';
    xb = Bmatrix^(-1) * b;
    

    [as, cs, s] = revisedfindenter(A, pi ,c,isbasic,phase);
    leave = revisedfindleave(Bmatrix,as,xb,phase,m,indices);
    % test for unbounded
    if leave == 0 && s ~= 0
        exitflag = -1;
        break
    end
    % test for optimal solution
    if s == 0
        break
    end
    
    % update is basic with new entering variable
    if leave > n && phase == 2
        % Remove artifical from basis
        isbasic(indices(leave)) = [];
        isbasic(s) = 1;
    else
        isbasic(indices(leave)) = 0;
        isbasic(s) = 1;
    end
    [Bmatrix, indices, cb] = revisedbupdate(Bmatrix, indices, cb, cs, s, as, leave);
end

% return the values of the solution
pivalues = pi;
z = cb' * xb;
x = zeros(n,1);
x(indices) = xb;
% if all(indices <= n)
%     x(indices) = xb;
% else
%     x(indices) = xb;
%     x = x(1:n);
%     x(n+1) = xb(end);
% end
