function [z,x,pivalues,indices,exitflag] = fullsimplex(A,b,c,m,n)
% fullsimplex uses a phase 1-phase 2 approach to find a solution to a
% linear program in standard computational form.
% Inputs:
%   A, the constraint matrix of the problem
%   b, a column vector of the right hand sides
%   c, the cost coefficients as a column vector
%   m, the number of rows in A
%   n, the number of columns in A
% Outputs:
%   z, the optimal value
%   x, the optimal solution
%   pivalues, the reduce cost of the feasible basic solutions
%   indices, of the basic soltuions as a vector
%   exitflag, is 0 when optimal solution is found. -1 if the problem is
%   unbounded. 1 if problem is infeasible.
% Notes:
%   if problem is infeasible or unbounded the function will return the last
%   BFS and pi-values associated with it.
% Author: Victor Xie

% phase 1 set up
B_initial = eye(m);
A_phase1 = [A, B_initial];
c_phase1 = [zeros(n,1);ones(m,1)];
indices  = (n+1):(n+m);
phase = 1;

[z,x,pivalues,indices,exitflag] = revisedsimplex(A_phase1,b,c_phase1,m,n,B_initial,indices,phase);

% Check for feasibility
if exitflag == 0 && z == 0
    % DO phase 2
    phase = 2;
    Bmatrix = A(:,indices);
    [z,x,pivalues,indices,exitflag] = revisedsimplex(A,b,c,m,n,Bmatrix,indices,phase);
 
elseif exitflag == -1
    % Return unbounded
    return
else
    % Return infeasible (z ~= 0)
    exitflag = 1;
    return
end


