function [ L, a, Z ] = GAUSS( L, i, j, a, Z )
%GAUSS: 此函数通过高斯变换，使得L(i, j)的绝对值小于0.5
%
%输入：
% L：原单位下三角阵
% i，j：需要变换的下标(要求i>j)
% a：原列向量
% Z：原转换矩阵
% 输出：
% L：新的单位下三角阵
% a：新的列向量
% Z：新的转换矩阵
% 
% 作者：李帅
% 版本号：1.0
% 日期：2016/8/7
global n;
mu = round(L(i,j));
if mu ~= 0
    L(i:n,j) = L(i:n,j) - mu*L(i:n,i);
    Z(1:n,j) = Z(1:n,j) - mu*Z(1:n,i);
    a(j) = a(j) - mu*a(i);
end


end

