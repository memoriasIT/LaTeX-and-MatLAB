%% Recordatorio
%% 1)
% X --> N(7,3)
% P[X<= 5]
normcdf(5, 7, 3);

% P[2<= x <= 5]
normcdf(5,7,3) - normcdf(2,7,3);

% P[X>2 ]
1-normcdf(2,7,3);

%% 2)
% X --> P(3)
% P[X=7]
% Como es probabilidad necesitamos pdf
poisspdf(7,3);

poisspdf(0:7,3); %Probabilidad de sacar 1, 2, 3... 7.

% F(7)
%Como es funcion de distribucion igual pero cdf
poisscdf(7,3);

%% 3) Generar 10 nº aleatorios de:
%% E(5)
%Exponencial de parametro 5, 10 elementos en array de 1x10
exprnd(5, 1,10);

%% N(3,2)
normrnd(3, 2, 1, 10);

%% B(7, 0.43)
binornd(7, 0.43, 1, 10);

%% 4)
% P[X<= a] = 0.003
% X  --> N(3,5)
%Tenemos que calcular la funcion de distribucion que es desde el menos inf.
% hasta el valor a, y esto debe de valer a, como es la inversa de lo
% anterior (F(a) = 0.003) debemos de calcular la funcion cuantil
norminv(0.003,3,5);

% P [X>=b] = 0.75
% X --> B(8, 0.35)
% Calculamos lo contrario es decir que:
% P[X <= b] = 1 - 0.75 = 0.25 y esto ya esta según la función de
% distribución

chi2inv(0.25, 8);




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Ej 6
%% a)

% Misma probabilidad en un rectangulo son numeros aleatorios en un
% intervalo y todas tienen la misma probabilidad

% x sera uniforme de 0 a 20
% y sera uniforme de 0 a 10

% Calculamos la distancia entre dos puntos con la raiz cuadrada
% Distancia entre antena y punto, si es <= 3 entonces estará dentro del
% rango si no no.

% Tendremos array (1x10k) de 10k elementos con 1 o 0 según si está dentro o no del
% intervalo

% Tendremos un array para cada antena y podremos calcular una proporción
% con todo esto.

NIT = 10000;
% Para generar valores en intervalo debe de ser continua usamos unifrnd
% Desde 0 hasta 20, tamaño del array 1x10k
x = unifrnd(0, 20, 1, NIT);
y = unifrnd(0, 10, 1, NIT);

% Calculamos raiz cuadrada para distancia hasta primera antena
d1 = sqrt((x-(-1)).^2+(y-5).^2);
% Array lógico 1s y 0s segun si se cumple la condición
c1 = (d1<=3);

%2a antena: 5, 4
d2 = sqrt((x-(5)).^2+(y-4).^2);
c2 = (d2<=3);

%3a antena: 15, 7
d3 = sqrt((x-(15)).^2+(y-7).^2);
c3 = (d3<=3);

%4a antena: 10, 1
d4 = sqrt((x-(10)).^2+(y-1).^2);
c4 = (d4<=3);

%5a antena: 12, 2
d5 = sqrt((x-(12)).^2+(y-2).^2);
c5 = (d5<=3);

%6a antena: 19, 1
d6 = sqrt((x-(19)).^2+(y-1).^2);
c6 = (d6<=3);

%7a antena: 15, 2
d7 = sqrt((x-(15)).^2+(y-2).^2);
c7 = (d7<=3);

% Suma total nos va a dar si esta en la cobertura de alguna antena
Sumtot = c1+c2+c3+c4+c5+c6+c7;
% Creamos un array para saber si se cumple o no, despues sumamos el total
Cond = sum(Sumtot>0);

% Calculamos proporcion
p = Cond/NIT;

% Para calcular area que se cubre usamos la base por altura y multiplicamos
% por la proporcion
S = p * 20* 10;


%% b)
Condb = sum(Sumtot>1);
pb = Condb/NIT;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Ej 7)
% Proporcion de R pero que sea de la poblacion y que este en los puntos de
% las antenas

% De entre los puntos que estan en la cobertura de una antena cuales estan
% en r

% (Nr _interseccion_ Cobertura de antena) / Nr

% Como los puntos son una variable aleatoria bidimensional x e y siguen
% distintas normales pero hay un comando que permite hacer normal
% multivariable

% NIT permanece constante al anterior (10k)
% primero medias, despues vector varianzas y covarianzas por filas y crear
% 10 filas con 2 columnas, solo acepta 1 parametro porque no hay mas
% posibilidades
v = mvnrnd([12,6], [3 0.5; 0.5 2], NIT);

% Cuantos de esos puntos estan en r --> x >= 0 , x <= 20 , y >= 0 , y <= 10
% Utilizamos la multiplicacion como union ya que debe de cumplirse ambas
% condiciones

x = v(:,1);
y = v(:, 2);

Condicion = (x>= 0).*(x <= 20).*(y >= 0).*(y <= 10);
% Obtener los puntos que cumplen la condicion
NR= sum(Condicion);

%%IGUAL QUE EL EJ ANTERIOR PERO USANDO UNA NORMAL ES DECIR CON OTRA X E Y
% Con lo de abajo conseguimos la cobertura de alguna antena
% Calculamos raiz cuadrada para distancia hasta primera antena
d1 = sqrt((x-(-1)).^2+(y-5).^2);
% Array lógico 1s y 0s segun si se cumple la condición
c1 = (d1<=3);

%2a antena: 5, 4
d2 = sqrt((x-(5)).^2+(y-4).^2);
c2 = (d2<=3);

%3a antena: 15, 7
d3 = sqrt((x-(15)).^2+(y-7).^2);
c3 = (d3<=3);

%4a antena: 10, 1
d4 = sqrt((x-(10)).^2+(y-1).^2);
c4 = (d4<=3);

%5a antena: 12, 2
d5 = sqrt((x-(12)).^2+(y-2).^2);
c5 = (d5<=3);

%6a antena: 19, 1
d6 = sqrt((x-(19)).^2+(y-1).^2);
c6 = (d6<=3);

%7a antena: 15, 2
d7 = sqrt((x-(15)).^2+(y-2).^2);
c7 = (d7<=3);

% Suma total nos va a dar si esta en la cobertura de alguna antena
Sumtot2 = c1+c2+c3+c4+c5+c6+c7;

% Que cumpla R y alguna antena
AlgAnt = sum((Sumtot2.*Condicion)>0);
p = Na/NR;

%Poblacion afectada
Pobl = 25000*p;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SEPTIEMBRE 2015
%% 6)
% Te dan la probabilidad y calculas el T0
%Numero de iteraciones
Nit=1e5;
% Calculamos 10k numeros con distribución de Poisson, parametro te lo dan
n1=poissrnd(7.77,Nit,1);
n2=poissrnd(2.13,Nit,1);
n=n1+n2;

%Calculamos media con comando mean de valores rechazados
med=mean(n);
V=var(n); % Cuasivarianza (mejor estimador del valor correcto)

% Para calcular que sean mayor de 10 hacemos una condición esto creará un
% array con 0s y 1s según si se cumple la condicición
c=(n>10);

P=sum(c)/Nit; %Estimador puntual

%Calculamos la inversa 1- proporcion
Q=1-P;

%% ?????????????????????
I=[P-1.96*sqrt(P*Q/Nit), P+1.96*sqrt(P*Q/Nit)]
