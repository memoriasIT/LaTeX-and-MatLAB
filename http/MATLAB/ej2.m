%Borrar datos
clear all
% Iicializar documento y abrir datos
format long
format compact
load Temp_16a.mat

%datos:
TMA(1,:);

% meses en la segunda columna
L = find(TMA(:,2) ==2);
length(L);

% Temperatura min en la 5a columna (pero solo dentro de L que es el mes de
% febrero por tanto solo obtenemos las temperaturas minimas de febrero)
X = TMA(L,5);
N = length(X);

% Construimos vector de 0 que va a recorrer los valores y va a guardarlos
% por intervalos
% [0,3) [3,6) [6,8) [8,10) [10,13) [13, 16)
% zeros 1 fila 6 columnas
n = zeros(1,6);
for k = 1:N,
    if X(k) <= 3, n(1) = n(1) +1;
    elseif X(k) <= 6, n(2) =n(2) +1;
    elseif X(k) <= 8, n(3) = n(3)+1;
    elseif X(k) <= 10, n(4) =n(4) +1;
    elseif X(k) <= 13, n(5) =n(5) +1;
    else n(6) = n(6)+1;
    end
end, 
%Frecuencias
n;

%Q1 -> Ni > 1/4 N
% X (c) = Li-1 + a* (Nc-Ni-1)/ni
%Li extremos intervalos
Li = [0, 3, 6, 8, 10, 13, 16];
%amp
a= diff(Li);
%frec acumuladas
nac = cumsum(n);

n1 = N/4;
n2 = N/2;
n3 = N * 3/4;

%Calculo de Q1
L = find(n1 < nac);
ind = L(1);

Q1 = Li(ind) + a(ind)*(n1-nac(ind-1))/(n(ind));

%CALCULO DE Q2
%ind es el primer valor que encuentra L
L = find(n2 < nac);
ind = L(1);
Me = Li(ind) + a(ind)*(n2-nac(ind-1))/(n(ind));

%CALCULO DE Q3
%ind es el primer valor que encuentra L
L = find(n3 < nac);
ind = L(1);
Q3 = Li(ind) + a(ind)*(n3-nac(ind-1))/(n(ind));

% Moda
% Mo = Li-1 + ai (hi - hi-1)/(hi- hi-1 + hi - hi+1)
% vector altura
h = n./a;
%mayor altura
%en que puesto esta la altura
[val, ind] = max(h);
%h1 y h2 para calcular moda hi
h1 = h(ind) - h(ind-1);
h2 = h(ind) - h(ind+1);
Mo = Li(ind) + a(ind)*(h1)/(h1+h2);

%No podemos usar comando de media porque son intervalos y necesitamos
%marcas de clase
x = [1.5, 4.5, 7, 9, 11.5, 14.5];
N = sum(n);
Sx = sum(n.*x);
mediaX = Sx/N;

%Hay que calcular curtosis, varianza, etc.

%Desviación media
%desviacion de cada valor con respecto a la media y ....
%valor absoluto de x - m1
absd = abs(x - mediaX);
DM = sum(absd.*n)/N;

%Media Cuadrati a
MCdesv= sqrt(sum(absd.^2.*n)/N);
