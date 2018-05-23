% Apartado 1
clear all
load TempMalaga
whos %Columnas: Y/M/D Max/Min/Med
L=find(TMA(:,2)==2) %En L estan los valores que son febrero
X=TMA(L,5) %Y aqui las minimas de los febreros
N=length(X)
n=zeros(1,6); %Intervalos mal cerrados
for k=1:N
    if X(k)<= 3, n(1)=n(1)+1;
    elseif X(k)<= 6, n(2)=n(2)+1;
    elseif X(k)<= 8, n(3)=n(3)+1;
    elseif X(k)<= 10, n(4)=n(4)+1;
    elseif X(k)<= 13, n(5)=n(5)+1;
    else n(6)=n(6)+1;
    end
end, n
n=zeros(1,6); %Intervalos bien cerrados
for k=1:N 
    if X(k)< 3, n(1)=n(1)+1;
    elseif X(k)< 6, n(2)=n(2)+1;
    elseif X(k)< 8, n(3)=n(3)+1;
    elseif X(k)< 10, n(4)=n(4)+1;
    elseif X(k)< 13, n(5)=n(5)+1;
    else n(6)=n(6)+1;
    end
end, n
%Si los cierras bien puedes usar histc
n = histc(X,[-inf 3 6 8 10 13 inf])'; n(end) = []
% Apartado 2a
Li=[0,3,6,8,10,13,16], x=[1.5 4.5 7 9 11.5 14.5] %x en este caso
x=(Li(1:end-1)+Li(2:end))/2 %x en cualquier caso
a=diff(Li), h=n./a
[val,ind]=max(h)
h1=h(ind)-h(ind-1), h2=h(ind)-h(ind+1)
Mo=Li(ind)+a(ind)*h1/(h1+h2)
n1=N/4, n2=N/2, n3=3*N/4
nac=cumsum(n) %Frecuencias acumuladas
L=find(n1<nac),ind=L(1);
Q1=Li(ind)+a(ind)*(n1-nac(ind-1))/n(ind)
L=find(n2<nac),ind=L(1);
Me=Li(ind)+a(ind)*(n2-nac(ind-1))/n(ind)
L=find(n3<nac),ind=L(1);
Q3=Li(ind)+a(ind)*(n3-nac(ind-1))/n(ind)
% Apartado 2b
m1=sum(n.*x)/N, m2=sum(n.*x.^2)/N, m3=sum(n.*x.^3)/N, m4=sum(n.*x.^4)/N %Momentos ordinarios agrupados
mu3=m3-3*m2*m1+2*m1^3, mu4=m4-4*m3*m1+6*m2*m1^2-3*m1^4
media=m1, varianza=m2-m1^2, s=sqrt(varianza), sesgo=mu3/s^3, curtosis=mu4/s^4-3
% Apartado 2c
absd=abs(x-m1), DM=sum(n.*abs(d))/N, MCdesv=sqrt(sum(n.*absd.^2)/N)
% Apartado 3
nn1=floor(n1), nn2=floor(n2), nn3=floor(n3) %Ahora hacemos el mismo calculo con datos sin agrupar
XX=sort(X);
if n1==nn1, Q1X=(XX(nn1)+XX(nn1+1))/2, else Q1X=XX(nn1+1),end
if n2==nn2, MeX=(XX(nn2)+XX(nn2+1))/2, else MeX=XX(nn2+1),end
if n3==nn3, Q3X=(XX(nn3)+XX(nn3+1))/2, else Q3X=XX(nn3+1),end
m1X=sum(X)/N, m2X=sum(X.^2)/N, m3X=sum(X.^3)/N, m4X=sum(X.^4)/N %Momentos ordinarios sin agrupar
mu3X=m3X-3*m2X*m1X+2*m1X^3
mu4X=m4X-4*m3X*m1X+6*m2X*m1X^2-3*m1X^4
mediaX=m1X, varX=m2X-m1X^2
sX=sqrt(varX), sesgoX=mu3X/sX^3, curtosisX=mu4X/sX^4-3
absdX=abs(X-m1X); DMX=sum(absdX)/N, MCdesvX=sqrt(sum(absdX.^2)/N)
% Alternativa al apartado 3
MeX=median(X)
m1X=momentm(X,1), m2X=momentm(X,2), m3X=momentm(X,3), m4X=momentm(X,4)
mediaX=mean(X), varX=var(X,1), sesgoX=skewnessm(X), curtosisX=kurtosism(X)-3 %Recordar restar 3