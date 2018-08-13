clc
format compact
%% September 2016

%% 4) Ajustar una parábola a los datos
X = [1960 1984 1993 1999 2005 2007 2012 2015];
N = [5000 1100 1035 750 150 235 312 404];

Ajuste = polyfit(X, N, 2);

%% b) Estimar recta de regresión N = a + bT usando los datos del siglo XXI
Xnew = [2005 2007 2012 2015];
Nnew = [150 235 312 404];

Ajuste2 = polyfit(Xnew, Nnew, 1);
a = Ajuste2(2);
b = Ajuste2(1);

%% c) Estimar SSE

NnewEst1 = polyval(Ajuste, Nnew);
NnewEst2 = polyval(Ajuste2, Nnew);

SSE1 = sum((Xnew - NnewEst1).^2);
SSE2 = sum((Xnew - NnewEst2).^2);

%% 5) 2 Disparos de radar, tiempo entre disparos sigue normal de media 0.1, desviación 0.0002s.
%% Espacio recorrido uniforme continua de media 3.4 y amplitud 0.2m
%% a) Calcular Media y desviación tipica de v = 3600 km/h

nit = 10000;
% Normal media 0.1, desv. 0.0002
tgen = normrnd(0.1, 0.0002, 1, nit);

% Uniforme continua "amplitud" +- error
% a = 3.4 - 0.2 /2
% b = 3.4 + 0.2 /2
e = unifrnd(3.4-0.2/2,3.4+0.2/2,1,N);

% Aplicamos fórmula:
V = 3600*e/tgen;

media = mean(V);
Desv = sqrt(var(V));

%% b) Probabilidad que pase los 120km/h
Cond = (V > 120);
p = sum(Cond)/nit;

%% 6) Huesos distrib. normal.
%% A: media; 12. 1.1
x=[9.4010, 14.8865, 8.8196, 13.9024, 11.8101, 15.0917, 6.5978, 11.0058, 8.4804, 18.7700, 13.5630, 14.9474, 8.8545, 10.3285, 10.8188, 14.2461, 10.8053, 13.2539, 6.3705, 10.6154, 9.4410, 7.5574, 12.7699, 12.2050, 11.5837, 8.1658, 14.3187, 12.3754, 10.7523, 11.5572, 10.8450, 7.1245, 10.7859, 9.4216, 9.0520, 8.6090, 10.1661 ];

%% (a) Contrastar que pertenecen a la especie A al nivel de signiﬁcaci´on α = 0.025 en 2 fases: 
%% i. Contrastar que  la varianza es compatible con los valores conocidos para la especie A. 

[Ha, Pa] = vartest(x, 1.1^2, 0.025, 'both')

%% ii. Contrastar que la media es compatible con los valores conocidos para la especie A (suponer rechazado el 
%% contraste de la varianza). 
[Hb, Pb] = ttest(x, 12, 0.025, 'both')

%% (b) Suponiendo rechazada la hip´otesis de que los huesos encontrados pertenezcan a la especie A, estimar 
%% intervalos de conﬁanza con α = 0.025 para los valores de la media y varianza de la nueva especie.
%%% IMPORTANTE REVISAR, no terminado %%%
% Calculamos la media y varianza 
media= mean(x);
s = sqrt(var(x));
n = length(x);
z = norminv(1-0.025/2);
