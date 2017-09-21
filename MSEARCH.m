function Optis = MSEARCH( L, D, zpoint, p )
% MSEARCH：改进的搜索算法
% 
% 输入：
% L：单位下三角阵
% D：对角阵
% zpoint：转换后的模糊度，列向量
% p：要求最优解的个数
% 
% 输出：
% Optis：p个最优解组成的矩阵，解为每个列向量
% 
% 作者：李帅
% 版本号：1.0
% 日期：2016/8/7
global n;
maxDist=100000000000;   %足够大即可
k=n; dist(k)=0;
endSearch=false;
count=0;
Optis = zeros(n, p);
fun = zeros(1, p);
S=zeros(n,n);
zbar(n)=zpoint(n);
z(n)=round(zbar(n)); y=zbar(n)-z(n); step(n)=sign(y); imax=p;
while endSearch==false
    newDist=dist(k)+y^2/D(k,k);
    if newDist<maxDist
        if k~=1
            k=k-1;
            dist(k)=newDist;
            S(k,1:k)=S(k+1,1:k)+(z(k+1)-zbar(k+1))*L(k+1,1:k);
            zbar(k)=zpoint(k)+S(k,k);
            z(k)=round(zbar(k)); y=zbar(k)-z(k); step(k)=sign(y);
        else
            if count<p-1
                count=count+1;
                Optis(:,count)=z(1:n);
                fun(count)=newDist;
            else
                Optis(:,imax)=z(1:n);
                fun(imax)=newDist;
                for i=1:p
                    if fun(imax)<fun(i)
                        imax=i;
                    end
                end
                maxDist=fun(imax);
            end
            z(1)=z(1)+step(1);
            y=zbar(1)-z(1);
            step(1)=-step(1)-sign(step(1));
        end
    else
        if k==n
            endSearch=true;
        else
            k=k+1;
            z(k)=z(k)+step(k);
            y=zbar(k)-z(k);
            step(k)=-step(k)-sign(step(k));
        end
    end
end


end

