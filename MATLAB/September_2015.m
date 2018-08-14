clc
format compact

%% Septiember 2015

%% 5) Tabla bidimensional ajustar funcion a datos de la tabla y hallar su razon de determinación
% y = a + bx^2 + cx^4

% Pasamos la tabla a matlab utilizando marcas de clase en la Y
% Para aclararme uso las comas para acordarme que he hecho un "salto de linea" de la tabla 
% bidimensional, en MATLAB el espacio y la coma son separadores iguales
y = [ -2.5 -2.5 -2.5, 2.5 2.5 2.5, 7.5 7.5 7.5 7.5, 15 15 15 15];
x = [-1 0 1, -2 -1 0, -2 -1 0 1, 0 1 2 3];
n = [215 135 65, 84 17 5, 10 986 115 32, 140 220, 145 25];
N=sum(n); 

% Podemos comprobar si son de igual medida con este pequeño script:
if isequal(size(y),size(x), size(n))
    %disp('Son de igual medida')
end

% Aplicando el método de la pseudoinversa obtenemos 
A=[N sum(n.*x.^2) sum(n.*x.^4); sum(n.*x.^2) sum(n.*x.^4) sum(n.*x.^6); sum(n.*x.^4) sum(n.*x.^6) sum(n.*x.^8)];
B=[sum(n.*y);sum(n.*y.*x.^2); sum(n.*y.*x.^4)];
sol = A\B;
a = sol(1); b = sol(2); c = sol(3);

% Calculamos ahora el error mediante los valores obtenidos (a, b y c)
yest = a + b.*x.^2 + c.*x.^4;
error = y - yest;


% Para la razón de determinación(R2) necesitamos calcular las varianzas
Verror = sum(n.*error.^2)/N - (sum(n.*error)/N)^2;
Vy = sum(n.*y.^2)/N-(sum(n.*y)/N)^2; 

R2 = 1- Verror/Vy;

%% b) Hallar media y varianza de Y/X>= 0
% Calculamos la nueva tabla según la condición del enunciado:
ynew = [-2.5 -2.5, 2.5, 7.5 7.5, 15 15 15 15];
xnew = [-1 0    ,  0, 0 1, 0 1 2 3];
nnew = [135+65, 5, 115+32, 140+220+145+25];
Nnew=sum(nnew); 

% Calculo de media y varianza con las fórmulas
media = sum(ynew.*nnew)/nnew;
var = sum(nnew.*ynew.^2)/Nnew - (media^2);

%% 6) Articulos desechados n1 distrib. Poisson par 7.77, articulos diarios en venta N2 poisson par 2.13. Estimar con 100k simulaciones
%% a) Media y varianza de articulos rechazados N = N1 + N2
nit = 100000;
% Se tratan de dos distribuciones poisson que generan nit valores cada uno
N1 = poissrnd(7.77, 1, nit);
N2 = poissrnd(2.13, 1, nit);
N = N1 + N2;

% Media y varianza de forma tradicional
Media = sum(N)/nit;
Varianza = sum(N.^2)/N - media^2;

% En este caso como no tenemos frecuencia podríamos haber usado los comandos de MATLAB mean y var:
media = mean(N);
varianza = var(N);

%% Prob que en un determinado día deshechados más de 10 articulos P(N>10)
% Como siempre ponemos la condición y hallamos la proporción
cond = (N > 10);
prop = sum(cond)/N;

%% 7) Estudio Carbono 14. 32 muestras con datos:
Lab1 = [44 40 38 36 50 44 56 38 36 46 43 44 42 40 46 44 ];
Lab2 = [46 40 36 36 56 42 58 42 38 50 48 48 45 42 45 46 ];

%% Contraste al 3% primero concntraciones inferiores al otro
% Se trata de contraste de dos medias por tanto usamos el ttest2
alpha = 0.003;
[H, P] = ttest2(Lab1, Lab2, alpha,'left');

%% b) contrastar al mismo nivel que la media del primer recorrido es 44

[H2, P2] = ttest(Lab1, 33, alpha, 'both');
