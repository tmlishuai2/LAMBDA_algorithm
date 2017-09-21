function [ L, D, a, Z ] = PERMUTE( L, D, k, delta, a, Z )
% PERMUTE���������б任��ʹ�öԽǾ���D�ĵ�k��Ԫ�ظ����ҵ�k+1��Ԫ�ظ�С
% 
% ���룺
% L��ԭ��λ��������
% D��ԭ�Խ���
% k��Ҫ���е��±�
% delta��D(k,k)+L(k+1,k)^2*D(k+1,k+1)
% a��ԭ������
% Z��ԭת������
% �����
% L���µĵ�λ��������
% D���µĶԽ���
% a���µ�������
% Z���µ�ת������
%
% ���ߣ���˧
% �汾�ţ�1.0
% ���ڣ�2016/8/7
global n;
eita=D(k,k)/delta;
lambda=D(k+1,k+1)*L(k+1,k)/delta;
D(k,k)=eita*D(k+1,k+1);
D(k+1,k+1)=delta;
L(k:k+1,1:k-1)=[-L(k+1,k) 1; eita lambda]*L(k:k+1,1:k-1);
L(k+1,k)=lambda;
%����L������
p=L(k+2:n,k);
L(k+2:n,k)=L(k+2:n,k+1);
L(k+2:n,k+1)=p;
%����Z������
p=Z(1:n,k);
Z(1:n,k)=Z(1:n,k+1);
Z(1:n,k+1)=p;
%����a������Ԫ��
q=a(k);
a(k)=a(k+1);
a(k+1)=q;
end

