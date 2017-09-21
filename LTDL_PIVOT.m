function [ L, D, P ] = LTDL_PIVOT( Q )
% LTDL_PIVOT：对Q进行带对称旋转的LTDL分解，使得D的对角元素尽可能按从大到小排列
% 
% 输入：
% Q：对称正定阵
% 输出：
% L：单位下三角阵
% D：对角阵
% P：旋转矩阵
% 
% 作者：李帅
% 版本号：1.0
% 日期：2016/8/7
global n;
P=diag(ones(1,n));
for k=n:-1:1
    %找Q（1,1）到Q（k,k）中最小的
    q=1;
    for j=2:k
        if Q(q,q)<Q(j,j)
            q=j;
        end
    end
    
    x=P(:,k);
    P(:,k)=P(:,q);
    P(:,q)=x;
    
    x=Q(:,k);
    Q(:,k)=Q(:,q);
    Q(:,q)=x;
    
    x=Q(k,:);
    Q(k,:)=Q(q,:);
    Q(q,:)=x;
    
    Q(k,1:k-1)=Q(k,1:k-1)/Q(k,k);
    Q(1:k-1,1:k-1)=Q(1:k-1,1:k-1)-Q(k,1:k-1)'*Q(k,k)*Q(k,1:k-1);
end

%得到L
L=diag(ones(1,n));
for i=2:n
    for j=1:i-1
        L(i,j)=Q(i,j);
    end
end
%得到D
D=diag(diag(Q));

end


