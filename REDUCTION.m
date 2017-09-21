function [ Z, L, D, a ] = REDUCTION( Q, a )
% REDUCTION����������ת����Q����Լ��ʹ��Q��LTDL�ֽ���L�ķǶԽ�Ԫ�ؾ�����С�� D�ĶԽ�Ԫ�ؾ����ܰ��Ӵ�С����
% 
% ���룺
% Q���Գ�������
% a��ԭ������
% �����
% Z������ת������
% L����λ��������
% D���Խ���
% a���µ�������
% 
% ���ߣ���˧
% �汾�ţ�1.0
% ���ڣ�2016/8/7
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

