clc
clear
format compact

%% June 2014

%% 6) Ajustar funcion a los datos:
X=[0 0 pi/4 pi/4 pi/4 pi/2 pi/2 3*pi/4 3*pi/4 pi pi];
Y=[14 20 10 14 20 4 10 10 14 14 20];
n=[50 75 71 51 12 36 41 49 44 25 18] ;
N = sum(n);
%  Y = a + b cos(X') 
% Para linealizar la ecuación realizamos un cambio de variable 
x = cos(X);

% Por el método de la pseudoinversa obtenemos las ecuaciones:
A = [sum(n.*Y); sum(n.*Y)];
B = [N, sum(x.*n);
    sum(x.*n), sum(n.*x^2)];

% Despejamos la ecuación:
sol = A\B;
a = sol(1);
b = sol(2);

% Calculamos y estimada y el error:
yest = a + b*x;
error = y-yest;

% Ya solo flata aplicar las formulas de matlab para obtener el resultado que nos piden
Verror = var(yerror, 1);
Vy =  var(Y, 1);
R2 = 1 - Verror/Vy;

%% b) Hallar media, varianza y sesgo de Y/X >= 3pi/4
% Calculamos las nuevas tablas siguiendo las nuevas condiciones
Ynew2=[10 14 20];
Nnew2=[49 44+25 18];
NNew=sum(Nnew2);

% Sus respectivos momentos para hallar la varianza y sesgo
m1=sum(Nnew2.*Ynew2)/NNew;
m2=sum(Nnew2.*Ynew2.^2)/NNew;
m3=sum(Nnew2.*Ynew2.^3)/NNew;

% Con los momentos hallamos facilmente los resultados que nos piden
media=m1;
varianza=m2-m1^2;

mu3=m3-3*m2*m1+2*m1^3;
s=sqrt(varianza);
sesgo=mu3/(s^3);

%% 7) Circuito tiene pila y resistencia, margenes fabricacion valor pila en voltios sigue distrib. normal media 1.5, desviación 0.2
%% pila resistnecia interna sigue normal media 0.3 desviación tipica 0.01
%% La resistencia sigue normal N(1.2, 0.02); Aplicar la ley de ohm con nit 10k iteraciones

%% a) Media y varianza de I
% Como siempre generamos los valores con los que vamos a trabajar:
nit = 10000;
V =  normrnd(1.5, 0.2,  1, nit);
R1 = normrnd(0.3, 0.01, 1, nit);
R2 = normrnd(1.2, 0.02, 1, nit);
% Ley de Ohm: I = V/(R1+R2)
I = V/(R1+R2);

% Media y varianza puede ser calculada con los comandos de Matlab pues no tenemos frec. (mean y var):
media = mean(I);
varianza = var(I);

%% b) Probabilida dde que la intensidad sea mayor que 1.1
% Solamente colocamos la condición y hallamos la proporción:
cond = (I > 1.1);
prop = sum(cond)/nit;


%% 8) Contraste resistencias tienen una media de 1.2 y desv. 0.02. Se toma muestra aleatoria con datos:
x = [1.23, 1.21, 1.17, 1.11, 1.3, 1.28, 1.19, 1.18, 1.31, 1.12, 1.19, 1.24, 1.22];
%% a) Puede considerarse que es desv. 0.02
% Como no nos dicen nada suponemos alpha = 0.05
alpha = 0.05;
[Ha, Pa] = vartest(x, 0.02^2, alpha, 'both');

%% b) Podemos considerar media 1.2
% Nos dicen que rechazamos la hipótesis nula, por tanto usamos ttest con varianza desconocida en vez de ztest con varianza conocida
[Hb, Pb] = ttest(x, 1.2, alpha, 'both');
