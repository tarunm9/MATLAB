% Main

M = dlmread('M.txt');
B = dlmread('B.txt');
p = dlmread('p.txt');
v = dlmread('v.txt');

mismatch(M,p,B,v)
