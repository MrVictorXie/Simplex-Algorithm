clc; 
clear;
A = [5,2,1,2,3;2,1,2,6,1];
b = [5;4];
c = [20;7;8;23;10];
m = 2;
n = 5;

[z, x, pivalues, final_indices, exitflag] = fullsimplex(A, b, c, m, n);

disp("z: "); disp(z);
disp("x: "); disp(x);
disp("pivalues: "); disp(pivalues);
disp("indices:"); disp(final_indices);
disp("exitflag:"); disp(exitflag);
