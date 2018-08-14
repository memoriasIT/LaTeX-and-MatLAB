clc
format compact
%% June 2015

%% 5) Ajustar parabola a los datos de la tabla y hallar razón de determinación
% Parábola tiene forma x = a + by + cy^2
% Para la x hallamos marcas de clase
x = [-2.5, -2.5, 2.5,2.5,2.5,2.5, 7.5,7.5,7.5, 15,15,15];
y= [2 3 1 2 3 4 1 2 3 1 2 3];
n = [315, 350, 105 75 45 90, 110 200 50,222 102 140];

Nx = length(x);
Ny = length(y);
N = sum(n);

% Mediante el método de la pseudoinversa obtenemos las matrices para solucionar el sistema
B = [sum(n.*x); sum(n.*x.*y); sum(n.*x.*y^2)];
A = [N, sum(n.*y), sum(n.*y.^2); sum(n.*y) sum(n.*y.^2) sum(n.*y.^3); sum(n.*y.^2) sum(n.*y.^3) sum(n.*y.^4)] ;

% Solución del sistema
sol = A\B;
a = sol(1)
b = sol(2)
c = sol(3)

% Calculamos el error con los valores estimados
xest = a+b*y + c*y.^2;
error = x - xest;

% Obtenemos varianzas y razon de determinación
Vr = sum(n.*error.^2)/N - (sum(n.*res)/N)^2;
Vx = sum(n.*x.^2)/N - (sum(n.*x)/N)^2;
R2 = 1- Vr/Vx;

%% b) Hallar media y varianza de Y/x <= 5
% Calculamos primero la nueva tabla con las condiciones dadas
ynew = [1, 2, 3, 4];
nnew = [105, 380, 395, 90];
Nnew = sum(nnew);

% Aplicamos las fórmulas de media y varianza a los datos
media2 = sum(y.*nnew)/Nnew;
var2 = (y.*nnew.^2)/Nnew - media2^2;

%% 6) T duración producto media exponencial 8 años, T produccion hasta venta normal media 1 desv tipica 0.2. Son independientes
%% a) Vendedor compra 30% del valor de venta. Cuanto tiempo hasta que venda el 30% del producto y comience a ganar
% Es decir nos está pidiendo que P(x<To) = 0.3

x6 = norminv(0.3, 1, 0.2);

%% b) 100k iteraciones estimar articulos reparación antes de 2 años (P(t <= 2)

nit = 100000;
P6 = exprnd(8, 1, nit);
cond = (P6 <= 2);
Prop = sum(cond)/nit;

%% c) 100K iteraciones, hallar media y varianza del t desde fabric hasta avería
nit = 100000;
P62 = normrnd(1, 0.2, 1, nit);
Tot = P6 + P62;
media = mean(Tot);
varianza = var(Tot);


%% 7) Investigador algoritmo resolver tarea. Distinción 2 posibles Alg1 y Alg2, resultados:
Alg1 =[44 40 38 36 50 44 56 38 36 46 43 ]
Alg2 =[46 40 36 36 56 42 58 42 38 50]

%% a) Contraste de medias alpha 0.02 primero mejor que 2o
alpha = 0.02;
[Ha, Pa] = ttest2(Alg1, Alg2, alpha, 'left');

%% b) Contraste 2o es igual a 41 minutos

[Hb, Pb] = ttest(Alg2, 41, alpha, 'both');
