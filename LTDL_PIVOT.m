function [ L, D, P ] = LTDL_PIVOT( Q )
% LTDL_PIVOT����Q���д��Գ���ת��LTDL�ֽ⣬ʹ��D�ĶԽ�Ԫ�ؾ����ܰ��Ӵ�С����
% 
% ���룺
% Q���Գ�������
% �����
% L����λ��������
% D���Խ���
% P����ת����
% 
% ���ߣ���˧
% �汾�ţ�1.0
% ���ڣ�2016/8/7
global n;
P=diag(ones(1,n));
for k=n:-1:1
    %��Q��1,1����Q��k,k������С��
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

%�õ�L
L=diag(ones(1,n));
for i=2:n
    for j=1:i-1
        L(i,j)=Q(i,j);
    end
end
%�õ�D
D=diag(diag(Q));

end


