format compact
%% September 2017

%% 4) Cantidad recogida por el barco por año y Tm fue:

T = [2008:2010, 2012:2016]
C = [17, 23 23 28 30 35 37 44];

%% a) ajustar recta de tendencia C/T y hallar coef. correlación lineal.

% Puesto que no tenemos frecuencia podemos utilizar el comando de Matlab "Polyfit"
% Como nos dicen ajustarlo a una recta el grado es 1

pol = polyfit(T, C, 1);
b = pol(1)
a = pol(2)

% Para calcular el coeficiente de correlación lineal
corr = corrcoef(T, C)

% O bien con la formula:
% r = cov/sigmax * sigmay
% Calculamos varianzas de X e Y mediante momentos 1 y 2
N = 8;
mx = sum(T)/N;
m2x = sum(T.^2)/N;
Vx = m2x - mx^2;

my = sum(C)/N;
m2y = sum(C.^2)/N;
Vy = m2y - my^2;

% Obtenemos covarianza y correlación lineal
Cov = sum(x.*y)/N - mx*my;
r = Cov / sqrt(Vx*Vy);

%% Cantidad prevee en t = 2017
% Para hayar la cantidad que se prevee en un año sustituimos en la ecuación
% Siendo x = 2017
Cant2017 = a + b*2017;


%% 5) La demora D en la llegada de un metro desde la parada X (con hora de paso a las 8:00) a Madrid 
%% (llegada a 8:00+D), se compone del tiempo de retraso (ξ1) en llegar el tren a la parada X, m´as el que 
%% invierte en el recorrido ξ2. (D = ξ1 + ξ2) La variable ξ1 = max{0,ξ0} donde ξ0 sigue una normal N(2,1.5), 
%% (en minutos) esto es, si el metro llega adelantado a su hora de salida se espera para salir puntual, mientras 
%% que ξ2 sigue una normal de media 21 minutos y 3 de desviaci´on.

%% a) Estimar mediante simulación (nit = 5) la prob de llegar pasadas las 8:30

T0 = normrnd(2, 1.5, 1, nit);
T1 = max(0, T0);
T2 = normrnd(21, 3, 1, nit);

cond = (T1 + T2 > 30);
prop = sum(cond)/N;
%%% INTERVALO DE CONFIANZA%%%

%% b) T2 > 21 de media sin fiarnos de la desviación sea 3. Medidas 14 dias tiempos:
Tnew = [22 21 20 24 27 25 25 26 21 20 27 26 21 25];
%% Contraste de 5%
alpha = 0.05;
N = length(Tnew);
% Contraste de la media Varianza desconocida
% variable Tnew
% Media 21
% 95% --> 0.05 alpha
% Mayor que 21 --> right
[H, p] = ttest(Tnew, 21, alpha, 'right');

%% c) Contrastar con desviación tipica 3
% Contraste de varianzas, variable Tnew, varianza 9 (desviacion tipica^2), alpha = 0.05, igual --> both
[H, p] = vartest(Tnew, 3^2, alpha, 'both')

