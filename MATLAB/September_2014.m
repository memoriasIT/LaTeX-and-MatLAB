clc
clear
format compact

%% September 2014

%% 4) Ajustar la recta de tendencia
x = [ 2006 2007 2008 2009 2010 2011 2012 2013];
y = [ 1017 1043 1066 1100 1098 1110 1141 1150];
N = length(x);
% Puede hacerse de forma sencilla con polyfit tomando x = ano; y = Uds
% La recta tiene la forma: r = bx + a;
recta = polyfit(x, y, 1);
a = recta(2);
b = recta(1);
% Podría haberse utilizado el método de la pseudo inversa, pero siempre que no tengamos frecuencias con dos variables podemos
% utilizar polyfit y ahorrarnos el meter las matrices

%% b) Coef. de Corr. Lineal
% Podemos hacerlo de dos formas, con el comando de MATLAB corr o manualmente
% r1 = corr(x', y');
% Yo prefiero hacerlo manualmente porque no estoy seguro de ese comando
mx = sum(x)/N;
m2x = sum(x.^2)/N;

my = sum(y)/N;
m2y = sum(y.^2)/N;

Vx = m2x - mx^2;
Vy = m2y - my^2;

covar = sum(x.*y)/N - mx*my;
r = covar/sqrt(Vy*Vx);

%% c) Estimar las ventas para los años 2014 y 2015
% Se trata unicamente de sustituir en las estimaciones
est2014 = a+b*2014;
est2015 = a+b*2015;

%% 5) tiempo metro llegada T1 + T2. T1 uniforme [0, 15]. T2 normal media 15 y desv 3. Hallar nit 10k
nit = 10000;
%% a) prob tiempo mayor que 25min
% Primero generamos los datos que vamos a usar posteriormente con la condición
T1 = unifrnd(0, 15, 1, nit);
T2 = normrnd(15, 3, 1, nit);
Cond = (T1 + T2 > 25);
prop = sum(Cond)/nit;

%% b) Prob tardar mas que un autobus con distrib normal, media 26 desv 5
T3 = normrnd(26, 5, 1, nit);
Cond2 = (T3 < (T1+T2));
prop2 = sum(Cond2)/nit;

%% c) Duracion del trayecto superior a 15 minutos sin fiarnos de desv 3. Tomamos 14 muestras tiempos:
xnew = [ 14, 16, 18, 14, 17, 15, 15, 16, 14, 19, 17, 16, 16, 15];
alpha = 0.05;
% Como la varianza es desconocida usamos ttest
[H, P] = ttest(xnew, 15, alpha, 'right');
% H = 1; P = 0.0268;
% Como H = 1 sabemos que tarda más de 15 minutos.
