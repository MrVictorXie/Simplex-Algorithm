clc; 
clear;
A = [10,20,14,1,-10;
  51,28,-65,51,50];
b = [12;65];
c = [-6;-8;-32;-5;-1];
m = 2;
n = 5;

[z, x, pivalues, final_indices, exitflag] = fullsimplex(A, b, c, m, n);

disp("z: "); disp(z);
disp("x: "); disp(x);
disp("pivalues: "); disp(pivalues);
disp("indices:"); disp(final_indices);
disp("exitflag:"); disp(exitflag);
