function [as, cs, s] = findenter(m,n, Amatrix, pi ,c)
% Inputs:
%   m, the number of rows of Amatrix 
%   n, the number of columns of Amatrix
%   Amatrix, the constraint co-effecient
%   pi, the vector  used to calculate reduced cost of size m 
%   c, the cost coeffecients vector of the objective funtion of size n
% 
% Outputs:
%   as, the s-th column of Amatrix 
%   cs, is the s-th cost of c
%   s, the index which is the entering variable
% Author: Victor Xie


reducedcost = zeros(1,n);

for i = 1:n
    reducedcost(i) = c(i) - pi' * Amatrix(:,i);     
end

% check if positive
position = [];
negativevars = [];
for i = 1:n
    if reducedcost(i) < 0
        position = [position, i];
        negativevars = [negativevars, reducedcost(i)];
    end
end

rc = dictionary(negativevars,position);
minvalue = min(negativevars);

% if rc is less than tolerance
tolerance = -1E-6;
if minvalue <  tolerance
    s = rc(minvalue);
    as = Amatrix(:,s);
    cs = c(s);
else
    s = 0;
    as = 0;
    cs = 0;
end
end


