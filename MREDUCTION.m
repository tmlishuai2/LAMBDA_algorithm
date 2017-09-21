function [ Z, L, D, a ] = MREDUCTION( Q, a )
% MREDUCTION���Ľ���Լ���㷨
% 
%���룺
%Q���Գ�������
%a��ԭ������
%�����
% L���µĵ�λ��������
% D���µĶԽ���
% a���µ�������
% 
% ���ߣ���˧
% �汾�ţ�1.0
% ���ڣ�2016/8/7
global n;
[L,D,P] = LTDL_PIVOT(Q);
Z = P;
ChangeFlag = ones(1,n+1);
while true
    minratio = 1;
    for k = 1:n-1
        if D(k,k)/D(k+1,k+1) < 1
            if ChangeFlag(k+1) == 1
                [L,a,Z] = GAUSS(L,k+1,k,a,Z);
                E(k+1,k+1) = D(k,k) + L(k+1,k)^2*D(k+1,k+1);
                ChangeFlag(k+1) = 0;
            end
            tmp = E(k+1,k+1)/D(k+1,k+1);
            if tmp<minratio
                i = k;
                minratio = tmp;
            end
        end
    end
    if minratio == 1
        break;
    end
    [L,D,a,Z] = PERMUTE(L,D,i,E(i+1,i+1),a,Z);
    ChangeFlag(i:i+2) = 1;
end
for k = 1:n-1
    for i = k+1:n
        [L,a,Z] = GAUSS(L,i,k,a,Z);
    end
end


end

