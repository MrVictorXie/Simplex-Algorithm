clc;
clear;
pause(0.1);
fprintf("Running Full Simplex test cases...\n\n");

tolerance = 1e-8;

%% -------------------------
% Test 1 - Optimal BFS
%% -------------------------
fprintf("Test 1 - Optimal BFS:\n");

c = [1; 2; 3; 0; 0; 0];
b = [4; 0; 6];
A = [1 -1 1 1  0 0;
  1  1 0 0 -1 0;
  0  0 1 0  0 1];
m = 3;
n = 6;
[z, x, ~, final_indices, exitflag] = fullsimplex(A, b, c, m, n);

if abs(z - 0) < tolerance
  fprintf("✅ Objective value correct.\n");
else
  fprintf("❌ Objective value incorrect: z = %.6f\n", z);
end

expected_x = [0; 0; 0; 4; 0; 6];
if norm(x - expected_x) < tolerance
  fprintf("✅ Solution vector x correct.\n");
else
  fprintf("❌ Solution x incorrect: x = [%s].T\n", num2str(x'));
end

if isequal(final_indices, [4; 6; 5])
  fprintf("✅ Indices correct.\n");
else
  fprintf("❌ Indices incorrect: [%s]\n", num2str(final_indices'));
end

if exitflag == 0
  fprintf("✅ Exitflag correct.\n");
else
  fprintf("❌ Exitflag incorrect: %d\n", exitflag);
end

fprintf("\n");

%% -------------------------
% Test 2 - Already Optimal
%% -------------------------
fprintf("Test 2 - Already Optimal:\n");

c = [0; 0; 0; 1];
A = [1 0 0 1;
  0 1 0 0;
  0 0 1 0];
b = [3; 2; 1];
m = 3;  % Number of constraints
n = size(A, 2);

[z, x, ~, ~, exitflag] = fullsimplex(A, b, c, m, n);

expected_x = [3; 2; 1; 0];

if abs(z) < tolerance
  fprintf("✅ Objective value correct.\n");
else
  fprintf("❌ Objective value incorrect: z = %.6f\n", z);
end

if norm(x - expected_x) < tolerance
  fprintf("✅ Solution vector x correct.\n");
else
  fprintf("❌ Solution x incorrect: x = [%s]\n", num2str(x'));
end

if exitflag == 0
  fprintf("✅ Exitflag correct.\n");
else
  fprintf("❌ Exitflag incorrect: %d\n", exitflag);
end

fprintf("\n");

%% -------------------------
% Test 3 - Unbounded
%% -------------------------
disp("Test 3 - Unbounded:");

A = [0.08 0.06 -1 0 0;
  1 0 0 -1 0;
  0 1 0 0 -1];

b = [12; 60; 60];
c = [-2; -1.25; 0; 0; 0];
m = 3;
n = 5;

[z, x, ~, final_indices, exitflag] = fullsimplex(A, b, c, m, n);

expected_z = -285;
expected_x = [105; 60; 0; 45; 0];
expected_indices = [4; 1; 2];
expected_flag = -1;

if abs(z - expected_z) < tolerance
  
  fprintf("✅ Objective value correct.\n");
  
else
  
  fprintf("❌ Objective value incorrect: z = %.6f\n", z);
  
end

if norm(x - expected_x) < tolerance
  fprintf("✅ Solution vector x correct.\n");
else
  fprintf("❌ Solution x incorrect: x = [%s]\n", num2str(x'));
end

if isequal(final_indices, expected_indices)
  fprintf("✅ Indices correct.\n");
else
  fprintf("❌ Indices incorrect: [%s]\n", num2str(final_indices'));
end

if exitflag == expected_flag
  fprintf("✅ Exitflag correct.\n");
else
  fprintf("❌ Exitflag incorrect: %d\n", exitflag);
end

fprintf("\n");

%% -------------------------
% Test 4 - Infeasible
%% -------------------------
disp("Test 4 - Infeasible:");

A = [1, 1; 1, 1];
b = [1;3];
c = [1;1];
m = 2; n = 2;

[z, x, ~, final_indices, exitflag] = fullsimplex(A, b, c, m, n);

expected_z = 2;
expected_x = [1; 0; 0; 2];
expected_indices = [1; 4];
expected_flag = 1;

if abs(z - expected_z) < tolerance
  fprintf("✅ Objective value correct.\n");
else
  fprintf("❌ Objective value incorrect: z = %.6f\n", z);
end

if norm(x - expected_x) < tolerance
  fprintf("✅ Solution vector x correct.\n");
else
  fprintf("❌ Solution x incorrect: x = [%s]\n", num2str(x'));
end

if isequal(final_indices, expected_indices)
  fprintf("✅ Indices correct.\n");
else
  fprintf("❌ Indices incorrect: [%s]\n", num2str(final_indices'));
end

if exitflag == expected_flag
  fprintf("✅ Exitflag correct.\n");
else
  fprintf("❌ Exitflag incorrect: %d\n", exitflag);
end

fprintf("\n");

%% -------------------------
% Test 5 - Tutorial 2, Question 4e (Degenerate)
%% -------------------------
disp("Test 5 - Tutorial 2, Question 4e (Degenerate):");

A = [1  1 1  1 0 ;
  0 -1 0 -1 1 ;
  1  0 1  0 1 ];
b = [4;4;8];
c = [15;10;-10;1;2];
m = 3; n = 5;

expected_z = -32;
expected_x = [0; 0; 4; 0; 4];
expected_pivalues = [-10; 2; 0];
expected_indices = [3; 5; 8];

[z, x, pivalues, final_indices, exitflag] = fullsimplex(A, b, c, m, n);
disp("DOUBLE CHECKING THIS TEST CASE DURING FRIDAY CLASS");
if abs(z - expected_z) < tolerance
  fprintf("✅ Objective value correct.\n");
else
  fprintf("❌ Objective value incorrect: z = %.6f\n", z);
end

if norm(x - expected_x) < tolerance
  fprintf("✅ Solution vector x correct.\n");
else
  fprintf("❌ Solution x incorrect: x = [%s]\n", num2str(x'));
end

if norm(pivalues - expected_pivalues) < tolerance
  fprintf("✅ Pi Values correct.\n");
else
  fprintf("❌ Pi Values incorrect: [%s]\n", num2str(pivalues'));
end

if isequal(final_indices, expected_indices)
  fprintf("✅ Indices correct.\n");
else
  fprintf("❌ Indices incorrect: [%s]\n", num2str(final_indices'));
end

if exitflag == 0
  fprintf("✅ Exitflag correct.\n");
else
  fprintf("❌ Exitflag incorrect: %d\n", exitflag);
end

fprintf("\n");

%% -------------------------
% Test 6 - All Zeros
%% -------------------------
disp("Test 6 - All Zeros:");

A = [0, 0, 0, 0;
  0, 0, 0, 0];
b = [0;0];
c = [0;0;0;0];
m = 2; n = 4;

[z, x, ~, final_indices, exitflag] = fullsimplex(A, b, c, m, n);

expected_z = 0;
expected_x = [0; 0; 0; 0];
expected_indices = [5; 6];
expected_flag = 0;

if abs(z - expected_z) < tolerance
  fprintf("✅ Objective value correct.\n");
else
  fprintf("❌ Objective value incorrect: z = %.6f\n", z);
end

if norm(x - expected_x) < tolerance
  fprintf("✅ Solution vector x correct.\n");
else
  fprintf("❌ Solution x incorrect: x = [%s]\n", num2str(x'));
end

if isequal(final_indices, expected_indices)
  fprintf("✅ Indices correct.\n");
else
  fprintf("❌ Indices incorrect: [%s]\n", num2str(final_indices'));
end

if exitflag == expected_flag
  fprintf("✅ Exitflag correct.\n");
else
  fprintf("❌ Exitflag incorrect: %d\n", exitflag);
end

fprintf("\n");


%% -------------------------
% Test 7 - Big Problem (35 variables, 11 constraints)
%% -------------------------
disp("Test 7 - Big Problem (35 variables, 11 constaints:");

A = [1,2,-1,1,1,3,-7,1,1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
  -1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
  2,-1,1,-1,2,0,0,0,0,0,1,-1,1,1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
  0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,1,-1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
  -1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,-1,1,1,1,1,0,0,0,0,0,0,0;
  0,0,1,1,1,1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,-1,1,0,0;
  1,-1,0,0,0,0,0,1,1,-1,1,1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1;
  0,0,0,0,0,0,0,0,0,0,0,0,0,-1,1,1,1,-1,1,1,1,1,-1,0,0,0,0,0,0,0,0,0,0,0,0;
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,-1,1,1,1,1,1,1,-1,1,0,0;
  1,1,-1,1,1,-1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,-1;
  2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2;];
b = [50;45;60;70;40;55;65;50;75;60;500];
c = [3;5;-2;7;-1;4;6;8;9;2;1;2;0;-4;5;3;-6;2;-1;4;5;-2;1;3;-1;2;1;3;-5;1;4;6;-3;2;1];
m = 11; n = 35;

[z, x, ~, final_indices, exitflag] = fullsimplex(A, b, c, m, n);

expected_z = -130.5;
expected_x = [2.5;0;0;0;8;0;0;39.5;0;0;13;0;0;26;0;0;15.5;0;46;0;0;14.5;0;0;0;0;28;0;47;0;0;0;0;10;0];
expected_indices = [5;34;27;14;17;22;11;8;29;1;19];
expected_flag = 0;

if abs(z - expected_z) < tolerance
  fprintf("✅ Objective value correct.\n");
else
  fprintf("❌ Objective value incorrect: z = %.6f\n", z);
end

if norm(x - expected_x) < tolerance
  fprintf("✅ Solution vector x correct.\n");
else
  fprintf("❌ Solution x incorrect: x = [%s]\n", num2str(x'));
end

if isequal(final_indices, expected_indices)
  fprintf("✅ Indices correct.\n");
else
  fprintf("❌ Indices incorrect: [%s]\n", num2str(final_indices'));
end

if exitflag == expected_flag
  fprintf("✅ Exitflag correct.\n");
else
  fprintf("❌ Exitflag incorrect: %d\n", exitflag);
end

fprintf("\n");

%% -------------------------
% Test 8 - 5 Vars, 2 Constraints
%% -------------------------
disp("Test 8 - 5 Vars, 2 Constraints:");

A = [10,20,14,1,-10;
  51,28,-65,51,50];
b = [12;65];
c = [-6;-8;-32;-5;-1];
m = 2; n = 5;

[z, x, pivalues, final_indices, exitflag] = fullsimplex(A, b, c, m, n);

expected_z = -833.8;
expected_x = [0;0;25;0;33.8];
expected_indices = [3;5];
expected_flag = 0;

if abs(z - expected_z) < tolerance
  fprintf("✅ Objective value correct.\n");
else
  fprintf("❌ Objective value incorrect: z = %.6f\n", z);
end

if norm(x - expected_x) < tolerance
  fprintf("✅ Solution vector x correct.\n");
else
  fprintf("❌ Solution x incorrect: x = [%s]\n", num2str(x'));
end

if isequal(final_indices, expected_indices)
  fprintf("✅ Indices correct.\n");
else
  fprintf("❌ Indices incorrect: [%s]\n", num2str(final_indices'));
end

if exitflag == expected_flag
  fprintf("✅ Exitflag correct.\n");
else
  fprintf("❌ Exitflag incorrect: %d\n", exitflag);
end

fprintf("\n");
