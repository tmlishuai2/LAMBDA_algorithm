%%
global n;
n=25;
p=2;
for k =1:10
L=diag(ones(1,n));
for i=2:n
    for j=1:i-1
        L(i,j)=randn;
    end
end
D1=diag(rand(1,n));


for i=n:-1:1
    x(n+1-i)=1/i;
end
D2=diag(x);

for i=1:n
    x(i)=1/i;
end
D3=diag(x);

x(1)=200; x(2)=200; x(3)=200;
x(4:n)=0.1;
D4=diag(x);

Q1=L'*D1*L;
Q2=L'*D2*L;
Q3=L'*D3*L;
Q4=L'*D4*L;

a=100*randn(n,1);
tic
[ Z, L, D, a ] = MREDUCTION( Q1, a );
t{1}(k,1)=toc;
tic
Optis = MSEARCH( L, D, a, p );
t{1}(k,2)=toc;

a=100*randn(n,1);
tic
[ Z, L, D, a ] = MREDUCTION( Q2, a );
t{2}(k,1)=toc;
tic
Optis = MSEARCH( L, D, a, p );
t{2}(k,2)=toc;

a=100*randn(n,1);
tic
[ Z, L, D, a ] = MREDUCTION( Q3, a );
t{3}(k,1)=toc;
tic
Optis = MSEARCH( L, D, a, p );
t{3}(k,2)=toc;

a=100*randn(n,1);
tic
[ Z, L, D, a ] = MREDUCTION( Q4, a );
t{4}(k,1)=toc;
tic
Optis = MSEARCH( L, D, a, p );
t{4}(k,2)=toc;

end
%%

U=qr(randn(n,n));
D=diag(rand(1,n));
Q5=U*D*U';

U=qr(randn(n,n));
d1=2^(-n/4);
d2=2^(n/4);
D=diag((d2-d1)*rand(1,n)+d1);
D(1,1)=d1;
D(n,n)=d2;
Q6=U*D*U';

A=randn(n,n);
Q7=A'*A;

U=qr(randn(n,n));
d1=2^(-k/4);
d2=2^(k/4);
D=diag((d2-d1)*rand(1,n)+d1);
D(1,1)=d1;
D(n,n)=d2;
Q8=U*D*U';

%%
%test
a = [5.45, 3.10, 2.97]';
Q = [6.290,  5.978,  0.544;
    5.978, 6.292, 2.340;
     0.544, 2.340, 6.288];
p = 2;
n = size(a, 1);
[ Z, L, D, a ] = MREDUCTION( Q, a );
Optis = MSEARCH( L, D, a, p );
