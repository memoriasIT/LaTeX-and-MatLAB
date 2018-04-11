% 
% v = [2, -4, 1];
% sort(v);
% cumsum(v);
% diff(v);
% abs(-3);
% floor(3.867);
% floor(4);
% find(u > 0);

load Datospr1_16a.mat
XX = sort(X);
N = length(X);

% Para calculr los cuartiles depende de si es decimal o no, usamos la
% funcion floor()
n1 = N/4;
n2 = N/2;
n3 = N* 3/4;

nn1 = floor(n1);
nn2 = floor(n2);
nn3 = floor(n3);

%Comparamos nn1 con n1 que son los cuartiles
if n1 == nn1, Q1 = (XX(nn1)+ XX(nn1+1))/(2), else Q1 = XX(nn1+1), end;
if n2 == nn2, Me = (XX(nn2)+ XX(nn2+1))/(2), else Me = XX(nn2+1), end;
if n3 == nn3, Q3 = (XX(nn3)+ XX(nn3+1))/(2), else Q3 = XX(nn3+1), end;

Lmin = Me - 3*(Me-Q1);
Lmax = Me + 3*(Q3-Me);

%Valores anomalos

La = find((XX>Lmax) |(XX < Lmin)); 
length(La);

%Valores no anomalos
L = find ((XX > Lmin) & (XX < Lmax));
length(L);
Y = XX(L);

%Gráfica con los elementos no anomalos
%figure(1), plot(Y);

% Calcular media y varianza sin funciones
% .^ primer elemento por primero, segundo por segundo, etc...
Sx = sum(X), mediaX = Sx/N, Sx2 = sum(X.^2), mx2 = Sx2/N, varX = mx2 -  mediaX^2,
Sy = sum(Y), mediaY = Sy/N, Sy2 = sum(Y.^2), my2 = Sy2/N, varY = my2 -  mediaY^2,




