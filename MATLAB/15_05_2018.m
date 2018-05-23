format compact
format long

binopdf(3,26,0.4)
binopdf(0:10,10,0.4)
binornd(10,0.4,15,1) %Saca sobre todo los numeros con más probabilidad 
                     %(3,4,5) sobre todo

%%% a)Calcular P[X=0], P[X=1]... p[X=30] en B(30,0.56) y comprobar que la suma vale 1
%%% b) Representar la funcion de probabilidad B(100, 0.3) con plot(x,y)
%%% c) P[X=3] y F(3) de una Poisson de parametro 5
%%% d) En una N(4,3), calcular P[X<= -2], P[X>=5], P[2<=X<=3]

% a)
PX = binopdf(0:30, 30, 0.56)
sum(binopdf(0:30, 30, 0.56))

% b)
%plot(0:100, binopdf(0:100,100, 0.3))

% c)
PX3=poisspdf(3,5)
poisscdf(3,5)

% d)
N=normcdf(-2,4,3)
N1=1-normcdf(5,4,3)
N2=normcdf(3,4,3)-normcdf(2,4,3)


%%% P[X<=b]=0.037
norminv(0.037,4,3)
normcdf(-1.3598,4,3)

%%%Calcular P[X>=a]=0.025
norminv(0.975,4,3)

%%%Hallar una matriz 5x10 de numeros aleatorios siguiendo la distribucion
%%% especificada:
%%% a) X->N(3,2)
%%% b) X-> t15
%%% c) Udiscreta {1-8}
%%% d) Ucontinua[-2,2]
%%% e) B(100,0.4)
%%% f) BN(13,0.3)
%%% g) X^2(20)
%%% h) P(9)
%%% i) E(3) -> media 1/3 es el parametro k hay que poner

MN= normrnd(3,2,5,10);
MT= trnd(15,5,10);
MUD= unidrnd(8,5,10);
MUC= unifrnd(-2,2,5,10);
MB= binornd(10,0.4,5,10);
MN= nbinrnd (13,0.3,5,10);
MX2= chi2rnd (20,5,10);
MP= poissrnd(9,5,10);
ME= exprnd(1/3,5,10);

%%%Comprobar por simulacion de 10000 tiradas de dos dados equilibrados
%%%que la probabilidad de que la suma de las caras de los dados sea 5 
%%%es 1/9

NIT=10000
x=unidrnd(6,2,NIT);
xx=sum(x);
xxx=(xx==5);
fa=sum(xxx)
p=fa/NIT,1/9

%otra forma
cont =0, NIT=10000
for k=1:NIT
    xi=sum(unidrnd(6,2,1));
    if xi==5, cont=cont+1;
    end
end
cont, p=cont/NIT

%%%SEPTIEMBRE 2014
%Ejercicio 5
X1=unifrnd(0,15,1,NIT);
X2=normrnd(15,3,1,NIT);
XN=X1+X2;
f=(XN>25);
fa=sum(f);
prob=fa/NIT


%cont =0;
%for k=1:NIT
 %   X1=unifrnd(0,15)
  %  X2=normrnd(15,3)
  %  xii=sum(X1+X2);
  % if xii>25, cont=cont+1;
  %  end
%end
%cont, prob=cont/NIT

%b
aut=normrnd(26,5,1,NIT);
fb=XN > aut;
fbb=sum(fb);
probb=fbb/NIT

%%%EJERCICIO 7 JUNIO 2012
X7=abs(normrnd(0,2,10,NIT));
X77=sum(X7);
X777=(X77>30);
prob7=sum(X777)
prob77=prob7/NIT

%%%EJERCICIO 6 SEPT 2013







