format compact
%% June 2017

%% 5) Hallar sesgo, curtosis y coeficiente de variacion de los datos:
X = [5.2,6.7,6.3,7.0,4.3,5.7,6.8,7.1,5.3,6.4,5.3,4.9,7.1];
N = length(X);

% Puesto que no existe n podemos aplicar las fórmulas que nos proporciona Matlab
SesgoMatlab = skewness(X)
CurtosisMatlab = kurtosis(X)
% Coef_Corr= corrcoef(X) # No estoy seguro como funciona este

% De todos modos se puede calcular mediante momentos de igual forma que haríamos en papel
% Calculamos los momentos de X
Mx = sum(X)/N;
M2x = sum(X.^2)/N;
M3x = sum(X.^3)/N;
M4x = sum(X.^4)/N;

% Calculamos la varianza y desviación tipica
VX = M2x - Mx^2;
sx = sqrt(VX);

% Calculamos mu
mu3 = M3x - 3*M2x*Mx + 2*Mx^3;
mu4 = M4x - 4*M3x*Mx + 6*M2x*Mx^2 - 3*Mx^4;

% Finalmente obtenemos el sesgo y curtosis
Sesgo = mu3/sx^3
Curtosis = mu4/sx^4-3


%% 6) Producción por arbol sigue Normal de media 1.1 y varianza 4

%% a) Probabilidad coger 5 arboles y todos produzcan más de 1 quintal
% Primero obtenemos la probabilidad de que 1 solo produzca más de 1 quintal
% x = 1; media = 1.1; sigma = sqrt(4)
P1 = 1-normcdf(1, 1.1, sqrt(4));
% Para que sean 5 árboles deberá de cumplirse 5 veces, por tanto elevarse a la 5
P5 = P1^5;

%% b) Contraste de varianza, muestra 26 árboles aleatoriamente, conclusiones al 90%
Xnew = [0, 0.0254, 1.6903, 3.7775, 0.6115, 2.1252, 1.2810, 3.1802, 0.0598, 1.6460, 2.3814, 3.1565, 3.7838, 1.7215, 0, 0.5502, 0.0987, 4.9240, 0.7294, 2.7579, 1.3279, 2.8567, 0.5183, 0, 0, 2.2904];

% Como las conclusiones son al 90% tomamos un alpha de 0.10
[H, P] = vartest(Xnew, 4, 0.1, 'both');

% Para saber si la producción ha aumentado usamos la media
% Como queremos saber si ha aumentado quedará a la derecha de la gráfica por tanto usamos 'right'
[H, P] = ttest(Xnew, 1.1, 0.1, 'right');
