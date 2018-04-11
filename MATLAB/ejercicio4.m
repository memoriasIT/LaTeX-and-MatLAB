% z_x,y
% 
% z = a + bx + cxy
% Z* = a + bxi + cxiyi
% Pasar a matrices de forma
% Z* = M * A
% 
% Como no tenemos frecuencias absolutas sabemos que la ecuación normal es:
% M^tMA = M^tZ
% 
% M^t*M = C
% M^t*Z = B
% C * A = B
% sol = C\B

format long
format compact

X = P(:,1);
Y = P(:, 2);
Z = P(:,3);

N = length(X) % las longitudes de los 3 son iguales

unos = ones(N, 1)

%.* para multiplicarelemento por elemento
M = [unos, X, X.*Y]

%Calculamos C = M' * M
C = M' * M;
B = M' * Z;
%solucionamos sitema
sol = C\B;
%abc son los componentes de la ecuación
a = sol(1);
b = sol(2);
c = sol(3);

% R^2 = 1 - varianza error/ varianza variable dependiente (en este caso es
% Z)
% calculamos z estimada para calcular error que es de la forma de Z = a +
% b*X + c * X * Y
%x e y son las columnas de P calculadas previamente
% error es e = Z - Zestimada

Zest = a+b*X + c*X.*Y;
error = Z- Zest;
%Comando para calcular varianza var(datos)
% Como no tenemos frecuencia bsoluta Var(Z, 1)
% si tenemos frecuencia absoluta se pondría el vector donde el 1
VarZ = var(Z, 1);
Varesidual = var(error, 1);
R2 = 1 - Varesidual/VarZ;

% estimar el valor de Z para x = 22 e y = 1,7
% en ajuste sustituir por los valores dados
valorz= a+b * 22 + c * 22 * 1.7;

