clc
format compact
%% December 2015
%% 6) Dados los puntos:
x = [1 2 3 4 5]
y = [2 2 4 5 9]

%% a) Ajustar recta
% y = dx + c
recta = polyfit(x, y, 1);
c = recta(2);
d = recta(1);

%% b) ajuste funcion de la forma:  y = 1 + a·b^x
% Debemos de linealizar primero todo tomando:
% y-1 = a*b^x
% log(y-1) = log(a*b^x)
% Cambiando de variable Y = log(y-1)
% Y = log(a)+x*log(b)
apartB = polyfit(x, Y, 1);
% Debemos revertir el cambio del logaritmo con el exponente
a = exp(apartB(2));
b = exp(apartB(1));

%% c) Predecir el valor dado por el modelo para x = 3.25
% No se trata de otra cosa que sustituir x en la ecuación con los valores a y b obtenidos
yest1 = c + d*3.25;
yest2 = 1 + a*b^3.25;

%% 7) Contenido de zinc, muestras porporcion:
x=[8.9699, 9.6203, 9.6129, 8.2467, 9.2151, 9.0587, 9.9781, 10.5182, 10.5368, 8.2482, 9.3397, 7.8416, 7.9583, 9.2421, 11.0279, 8.3572, 9.6808, 8.9883, 10.5461, 7.9867, 9.2878, 9.8909, 10.5267, 11.0413, 9.3497, 7.5198, 8.3889, 8.0186, 11.9765, 8.5359, 10.1178, 9.0268, 10.2808, 8.3628, 7.6234, 7.6000, 9.8163, 9.0442, 9.0226, 10.8964, 9.5882];
%% a) Contrastar media es 8.5 significación alpha = 1%

alpha = 0.01;
[H, P] = ttest(x, 8.5, alpha, 'both');

%% Dar intervalo confianza al 99% para el contenido del zinc
m = mean(x);
[H, P, I] = ttest(x, m, alpha);
