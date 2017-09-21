function [ L, D, a, Z ] = PERMUTE( L, D, k, delta, a, Z )
% PERMUTE：进行排列变换，使得对角矩阵D的第k个元素更大且第k+1个元素更小
% 
% 输入：
% L：原单位下三角阵
% D：原对角阵
% k：要排列的下标
% delta：D(k,k)+L(k+1,k)^2*D(k+1,k+1)
% a：原列向量
% Z：原转换矩阵
% 输出：
% L：新的单位下三角阵
% D：新的对角阵
% a：新的列向量
% Z：新的转换矩阵
%
% 作者：李帅
% 版本号：1.0
% 日期：2016/8/7
global n;
eita=D(k,k)/delta;
lambda=D(k+1,k+1)*L(k+1,k)/delta;
D(k,k)=eita*D(k+1,k+1);
D(k+1,k+1)=delta;
L(k:k+1,1:k-1)=[-L(k+1,k) 1; eita lambda]*L(k:k+1,1:k-1);
L(k+1,k)=lambda;
%交换L的两列
p=L(k+2:n,k);
L(k+2:n,k)=L(k+2:n,k+1);
L(k+2:n,k+1)=p;
%交换Z的两列
p=Z(1:n,k);
Z(1:n,k)=Z(1:n,k+1);
Z(1:n,k+1)=p;
%交换a的两个元素
q=a(k);
a(k)=a(k+1);
a(k+1)=q;
end

