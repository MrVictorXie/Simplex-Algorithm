%% Unit test for fullsimplex function
clear
clc
%% Test 1: Infeasible

A = [1 1;
     1 1];
b = [1; 3];
c = [1; 1];

m = 2;  % Number of constraints
n = 2;  % Number of variables


% Run simplex
[z, x, pi_vals, final_indices, exitflag] = fullsimplex(A, b, c, m, n);

% Display result
disp("Test 1: Infeasible")
disp(['Optimal value z: ', num2str(z)]);
disp('Optimal solution x:');
disp(x);
disp(['Exit flag: ', num2str(exitflag)]);
disp('Final basis indices:');
disp(final_indices);
disp('Final pi values:');
disp(pi_vals);


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
[z, x, pi_vals, final_indices, exitflag] = fullsimplex(A, b, c, m, n);


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
[z, x, pi_vals, final_indices, exitflag] = fullsimplex(A, b, c, m, n);

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

%% Degenerate LP Test in Standard Computational Form

% LP:
% Minimize z = 0*x1 + 0*x2 + 0*x3 + 0*x4 + 0*x5
% Subject to:
%   x1 + x2 + x3 = 1
%   x3 + x4 + x5 = 1
%   x1, x2, x3, x4, x5 >= 0

A = [1 1 1 0 0;
     0 0 1 1 1];
b = [1; 1];
c = [0; 0; 0; 0; 0];

m = 2;  % number of constraints
n = 5;  % number of variables

% Choose an initial basis, e.g., x3 and x5 (columns 3 and 5)
Bmatrix = A(:, [3, 5]);
indices = [3; 5];

% Run the simplex algorithm
[z, x, pi_vals, final_indices, exitflag] = fullsimplex(A, b, c, m, n);

% Display the results
disp('Degenerate LP Test');
disp(['Optimal value z: ', num2str(z)]);
disp('Optimal solution x:');
disp(x');
disp(['Exit flag: ', num2str(exitflag)]);
disp('Final basis indices:');
disp(final_indices');
disp('Final reduced cost vector pi:');
disp(pi_vals);

%% Unbounded LP Test

A = [0.08 0.06 -1 0 0;
     1 0 0 -1 0;
     0 1 0 0 -1];

b = [12; 60; 60];
c = [-2; -1.25; 0; 0; 0];

m = 3; % number of constraints
n = 5; % number of variables (including slack)

% Initial basis (identity matrix part)
indices = [3; 4; 5]; % indices of slack variables initially in the basis
Bmatrix = A(:,indices);


% Run simplex
[z, x, pi_vals, final_indices, exitflag] = fullsimplex(A, b, c, m, n);

% Display results
disp('Unbounded Test');
disp(['Optimal value z: ', num2str(z)]);
disp('Optimal solution x:');
disp(x);
disp(['Exit flag: ', num2str(exitflag)]);
disp('Final basis indices:');
disp(final_indices);
disp('Final pi values:');
disp(pi_vals);
%% Test Degenerate Basic Feasible solution

A = [0.08 0.06 1 0 0;
     1 0 0 1 0;
     0 1 0 0 1];

b = [10; 125; 120];
c = [-7; -6; 0; 0; 0];

m = 3; % number of constraints
n = 5; % number of variables (including slack)

% Initial basis (identity matrix part)
Bmatrix = eye(m);
indices = [3; 4; 5]; % indices of slack variables initially in the basis

% Run simplex
[z, x, pi_vals, final_indices, exitflag] = fullsimplex(A, b, c, m, n);

% Display results
disp('Test Degenerate BFSStudent');
disp(['Optimal value z: ', num2str(z)]);
disp('Optimal solution x:');
disp(x);
disp(['Exit flag: ', num2str(exitflag)]);
disp('Final basis indices:');
disp(final_indices);
disp('Final pi values:');
disp(pi_vals);


