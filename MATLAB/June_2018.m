format compact
%% 2018 June
%% 6) Ajustar curva forma: Y = bX + cX^3

x = [0, 1, 1, -1, -1, 2, -2];
y = [0, 0 , 1, -1, 0, 2, 2];
n = [2, 5, 4, 2, 6, 4, 5];
N = sum(n);


% Mediante el método de la pseudo inversa obtenemos la expresión:
% Xt*X*B = Xt*Y

% Aplicando la expresión a nuestro problema:
A = [sum(n.*x.^2), sum(n.*x.^4); sum(n.*x.^4), sum(n.*x.^6)];
B = [sum(n.*x.*y); sum(n.*x.^3.*y)];

% La solución se obtiene despejando la ecuación:
sol = A\B;
b = sol(1)
c = sol(2)

%% b ) Hallar coeficiente de determinación del ajuste realizado
%%% CALCULO DE COEF. DETERMINACIÓN CON MOMENTOS %%%

% Coef. det. = R^2 = 1- Vres/V(y)
% Necesitamos calcular el error para la varianza residual.
% Obtenemos la y estimada:

yest = b.*x + c.*x.^3;
res = y-yest;

mres = sum(n.*res)/N;
m2res = sum(n.*res.^2)/N;
Vres = m2res - mres^2;

my = sum(n.*y)/N;
my2 = sum(n.*y.^2)/N;
Vy = my2-my.^2;

R2 = 1- Vres/Vy

%% 7) Si T --> N(3,0.5) , calcular P(T pertenece (3,4)) si supera la media
% Nos piden:
% P(T pertenece (3,4)/T > 3)
% Por el Teorema de Bayes:
% A = P(T pertenece (3,4))
% B = P(T > 3)
% P = P(A ^ B)/ P(B)

% P(A ^ B) = F(4) - F(3)
% Siendo F la función de distribución de la normal

Pa = (normcdf(4, 3, 0.5) - normcdf(3, 3, 0.5))/ (1 - normcdf(3, 3, 0.5));
% En el denominador hemos utilizado 1- P(x < 3) puesto que la función de distribución trabaja con la acumulada

% Como en este caso nos hablaban de por encima de la media podríamos haberlo hecho de este modo:
Pa = (normcdf(4, 3, 0.5) - 0.5)/0.5;

%% b) Si T2 --> P(4.3) (Poisson con lambda 4.3). Calcular P de valor entre 2 y 5
% Es decir, calcular: P(2<= T2 <= 5)

% En este caso en vez de trabajar con acumuladas podemos hacerlo con la funcion de densidad y trabar con x con intervalo 2:5
% x = 2:5
% Lambda = 4.3
% Puesto que se trata de un intervalo en x obtendremos un array del cual obtendremos su sumatorio
Pb = sum(poisspdf(2:5, 4.3));

%% Hallar mediante 100k iteraciones la probabilidad de que T1 y T2 sea mayor que 9

% Este método es usualmente denominado método de Montecarlo
nit = 100000;
% Calculamos T1 con numeros aleatorios de media 3, sigma 0.5 y una matriz de 1:nit
x1 = normrnd(3, 0.5, 1, nit);
% Del mismo modo con T2 pero usando una distribución de Poisson (lambda 4.3, matriz 1:nit)
x2 = poissrnd(4.3, 1, nit);

% Imponemos la condición, los que la cumplan tendrán un 1, el resto un 0
cond = (x1 + x2 > 9);
% De este modo podemos calcular una proporción:
p = sum(cond)/nit;
q = 1-p;

%% 8) Mecanismo 3 componentes A, B y C que funcionan de forma independiente. Los tiempos siguen una exponencial de media
%% 10, 6 y 7. F = A ^ ( B v C )
%% a) Calcular con 10000 iteraciones la probabilidad de que funcione en 8 años

% Del mismo modo que antes buscaremos generar valores aleatorios que someteremos a una condición:
nit = 10000;
A = exprnd(10, 1, nit);
B = exprnd(6, 1, nit);
C = exprnd(7, 1, nit);

% Todas deben de ser mayor de 8 años 
condA = (A > 8);
condB = (B > 8);
condC = (C > 8);

% Aplicando la condición del problema:
CondFin = (CondA & CondB)|(CondA&CondC);

% Calculamos la proporción del mismo modo que antes:
prop = sum(CondFin)/nit;

%% b) Calculo de la media y varianza del tiempo de funcionamiento del mecanismo
TAB=min([A;B]); 
TAC=min([A;C]); 
T=max([TAB;TAC]); 

media =mean(T) 
Var =var(T)

