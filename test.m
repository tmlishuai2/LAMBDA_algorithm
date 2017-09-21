global n
n = 3;
a = [5.45, 3.10, 2.97]';
Q = [6.290,  5.978,  0.544;
    5.978, 6.292, 2.340;
     0.544, 2.340, 6.288];
p = 2;

[ Z, L, D, a ] = MREDUCTION( Q, a );
Optis = MSEARCH( L, D, a, p );
x = Z'\Optis;

N = 1:8;
N = N';
x0 = randn(3,1);
xN = [x0;N];
v = 0.005*randn(size(Aall,1),1);
lL = Aall*xN + v;
