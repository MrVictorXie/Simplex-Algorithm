function[as, cs, s] = revisedfindenter(A, pivalues ,c,isbasic,phase)
% Revisedfindenter finds the entering variable either in phase 1 or phase
% 2 to the A matrix.
% Inputs:
%   A, the constraint co-effecient matrix
%   pi, the vector used to calculate reduced cost of size m 
%   c, the cost coeffecients vector of the objective funtion of size n
%   isbasic, a column vector of either 1 for basic or 0 for nonbasic
%   phase, 1 for phase 1, 2 for phase 2 of algorithm
% Outputs:
%   as, the s-th column of Amatrix 
%   cs, is the s-th cost of c
%   s, the index of the A column entering which is the entering variable
% Author: Victor Xie


n = size(A,2);
reducedcost = zeros(1,n);
position = zeros(1,n);
for i = 1:n
    if isbasic(i) == 0
        reducedcost(i) = c(i) - pivalues' * A(:,i);   
        position(i) = i;
    end
end

minvalue = min(reducedcost);
p = 0;
x = 0;
for i = 1:length(reducedcost)
    if reducedcost(i) == minvalue
        if x == 0
            p = i;
        end
        x = x + 1;
    end
end

% if rc is less than tolerance
tolerance = -1E-6;
if minvalue <  tolerance
    % Bland's rule
    s = position(p);
    as = A(:,s);
    cs = c(s);
else
    s = 0;
    as = 0;
    cs = 0;
end
end


