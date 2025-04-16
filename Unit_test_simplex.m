%% Unit test for simplex function
clear
clc
%% Test 1 Non basic feasible solution
% Define a simple LP:
% Maximize z = 3x1 + 2x2
% subject to:
% x1 + x2 <= 4
% x1 <= 2
% x2 <= 3
% x1, x2 >= 0

% Convert to standard form:
% Maximize: c = [3 2 0 0 0]
% Subject to:
% A = [1 1 1 0 0;
%      1 0 0 1 0;
%      0 1 0 0 1]
% b = [4; 2; 3]

A = [1 1 1 0 0;
     1 0 0 1 0;
     0 1 0 0 1];

b = [4; 2; 3];
c = [-3; -2; 0; 0; 0];

m = 3; % number of constraints
n = 5; % number of variables (including slack)

% Initial basis (identity matrix part)
Bmatrix = [1 1 1;
           1 0 0;
           0 1 0];
indices = [1; 2; 3]; % indices of slack variables initially in the basis

% Run simplex
[z, x, pi_vals, final_indices, exitflag] = simplex(A, b, c, m, n, Bmatrix, indices);

% Display results
disp('Test 1: non-feasible basic solution');
disp(['Exit flag: ', num2str(exitflag)]);


%% Test 2
% Define a simple LP:
% Maximize z = 3x1 + 2x2
% subject to:
% x1 + x2 <= 4
% x1 <= 2
% x2 <= 3
% x1, x2 >= 0

% Convert to standard form:
% Maximize: c = [3 2 0 0 0]
% Subject to:
% A = [1 1 1 0 0;
%      1 0 0 1 0;
%      0 1 0 0 1]
% b = [4; 2; 3]

A = [1 1 1 0 0;
     1 0 0 1 0;
     0 1 0 0 1];

b = [4; 2; 3];
c = [-3; -2; 0; 0; 0];

m = 3; % number of constraints
n = 5; % number of variables (including slack)

% Initial basis (identity matrix part)
Bmatrix = eye(m);
indices = [3; 4; 5]; % indices of slack variables initially in the basis

% Run simplex
[z, x, pi_vals, final_indices, exitflag] = simplex(A, b, c, m, n, Bmatrix, indices);

% Display results
disp('Test 2: Feasible basic solution');
disp(['Optimal value z: ', num2str(z)]);
disp('Optimal solution x:');
disp(x);
disp(['Exit flag: ', num2str(exitflag)]);
disp('Final basis indices:');
disp(final_indices);
disp('Final pi values:');
disp(pi_vals);

%% Test 3: BFSStudent

A = [0.08 0.06 1 0 0;
     1 0 0 1 0;
     0 1 0 0 1];

b = [12; 120; 120];
c = [-2; -1.25; 0; 0; 0];

m = 3; % number of constraints
n = 5; % number of variables (including slack)

% Initial basis (identity matrix part)
Bmatrix = eye(m);
indices = [3; 4; 5]; % indices of slack variables initially in the basis

% Run simplex
[z, x, pi_vals, final_indices, exitflag] = simplex(A, b, c, m, n, Bmatrix, indices);

% Display results
disp('Test 3: BFSStudentProblem');
disp(['Optimal value z: ', num2str(z)]);
disp('Optimal solution x:');
disp(x);
disp(['Exit flag: ', num2str(exitflag)]);
disp('Final basis indices:');
disp(final_indices);
disp('Final pi values:');
disp(pi_vals);

