function [ Z, L, D, a ] = REDUCTION( Q, a )
% REDUCTION：利用整数转换对Q进行约简，使得Q的LTDL分解后的L的非对角元素尽可能小， D的对角元素尽可能按从大到小排列
% 
% 输入：
% Q：对称正定阵
% a：原列向量
% 输出：
% Z：整数转换矩阵
% L：单位下三角阵
% D：对角阵
% a：新的列向量
% 
% 作者：李帅
% 版本号：1.0
% 日期：2016/8/7
global n;
[L,D]=ldl(inv(Q));
L=inv(L);
D=inv(D);
Z=diag(ones(1,n));
k=n-1; k1=n-1;
E=zeros(n);
while k>0
    if k<=k1
        for i=k+1:n
            [L,a,Z]=GAUSS(L,i,k,a,Z);
        end
    end
    E(k+1,k+1)=D(k,k)+L(k+1,k)^2*D(k+1,k+1);
    if E(k+1,k+1)<D(k+1,k+1)
        [L,D,a,Z]=PERMUTE(L,D,k,E(k+1,k+1),a,Z);
        k1=k; k=n-1;
    else
        k=k-1;
    end
end
end

