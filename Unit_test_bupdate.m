%% Tests for bupdate function
clc
clear

%% test 1
% Initial basis matrix
B = [1 0; 
    0 1];
indices = [2; 4];         % Assume x2 and x4 are in the basis
cb = [5; 2];              % Cost coefficients for x2 and x4

% Entering variable (x3)
cs = 3;                   % Cost of entering variable x3
s = 3;                    % Index of entering variable (x3)
as = [0.5; 1.5];          % Column of entering variable

% Leaving variable is in position 1 of basis (x2)
leave = 1;

% Call the function
[newB, newind, newcb] = bupdate(B, indices, cb, cs, s, as, leave);

% Display results
disp('Updated Basis Matrix:');
disp(newB);

disp('Updated Indices:');
disp(newind);

disp('Updated Costs:');
disp(newcb);

%% test 2

% Initial basis matrix
Bmatrix = [0.08, 0.06, 0; 
            1, 0, 1; 
            0, 1, 0];

indices = [2; 4; 6];         
cb = [5; 2; 6];              

% Entering variable (x3)
cs = 3;                   
s = 3;                    
as = [1; 2; 3];       

% Leaving variable is in position 1 of basis (x2)
leave = 2;

% Call the function
[newB, newind, newcb] = bupdate(Bmatrix, indices, cb, cs, s, as, leave);

% Display results
disp('Updated Basis Matrix:');
disp(newB);

disp('Updated Indices:');
disp(newind);

disp('Updated Costs:');
disp(newcb);