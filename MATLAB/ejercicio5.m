% x\y      0  1   2   3   4
% -inf, 4  0  0   0   25  12
% -4, 0    0  0   7   50  5
% 0, 4     14 12  6   0   0
% 4, 8     23 7   2   0   0
% 8, inf   50 1   0   0   0

%19 marzo 2013

%para poder trabjar con esto en el matlab necesitamos pasar la tabla de
%doble entrada a una tabla tabular simple (es decir para abajo)

%primero ponemos la misma amplitud enlos elementos con infinito es decir 
%hasta el -8

% después ponemos las marcas de clase que usamos en vez de los intervalos
%elementos con 0 no ponemos
%_X_ _Y_ _N_
% -6  3   25
% -6  4   12
% -2  2   7
% -2  3   50
% -2  4   5
% -2  0   14
% -1 ... ...

X = [-6, -6, -2 -2 -2 2 2 2 6 6 6 10 10];
Y = [ 3 4 2 3 4 0 1 2 0 1 2 0 1];
n = [25 12 7 50 5 14 12 6 23 7 2 50 1];

% Polyfeed SOLO SE UTILIZA SI NO HAY FREC ABSOLUTAS
% si hay frec absolutas no se puede
% y/x --> y = a+bx
% la matriz en ecuaciones normales se calcula con
% y*i = a+bxi
% se pone de forma matricial donde es
% M^t * M * A = M^t * Y
% C = M^t * M
% hay que calcular C a mano 
% C = (N        sum(xi)     )
%     (sum(xni) sum(xi^2*ni))
% Se hace esto porque hay frecuencias absolutas y hay que poner cuantas
% veces pasa cada cosa
% B = M^t * Y
% B = (sum(n.*Y)   )
%     (sum(n.*x.*y))
% C       * A = B

N = sum(n);
C = [N sum(n.*X); sum(n.*X) sum(n.*X.^2)];
B = [sum(n.*Y); sum(n.*X.*Y)];
sol = C\B;
a = sol(1);
b = sol(2);

%calculamos varianza residual
Yest = a+b*X;
error = Y-Yest;
Varesidual = var(error, n);

% en el caso lineal r^2 = R^2
% r = *aquí signo de b (pendiente)* sqrt(R^2)

VarY = var(Y, n);
R2 = 1- Varesidual/VarY;
r = -sqrt(R2);
% el ajuste está bien porque es proximo a -1 o 1
% Si el r está fuera del intervalo [-1, 1] está mal
% 0 < R2 < 1 pero puede ser fuera del intervalo aunque es malo el ajsute

%Para calcular X/Y entonces hay que cambiar la matriz 
% C = (N        sum(yi)     )
%     (sum(y*ni) sum(yi^2*ni))

% B = (sum(n.*X)   )
%     (sum(n.*x.*y))

% Para calcular ajuste y =10*(a+ e(b+x)
% 1/y = a + exp(b+x)
% 10/y = a+ exp(b) * exp(x)
% y' = a + B * X
% y ' = 10/y
% x' = exp(x)
% y' = a + b * x'

% y' no se puede compilar porque es 0 y nos da error tendiendo a inf
% eliminamos los valores con 0 Y(6) = -1 Y(9) = -1 Y(12) = -1

Y(6) = -1; 
Y(9) = -1;
Y(12) = -1;
Ynueva = 10./Y;
Xnueva = exp(X);

C = [N, sum(n.*Xnueva); sum(n.*Xnueva) sum(n.*Xnueva.^2)];
B = [sum(n.*Ynueva); sum(n.*Xnueva.*Ynueva)];
sol = C\B;
a = sol(1);
b = sol(2);

% Para calcular el ajuste sustituimos
Yest = 10./(a+b*Xnueva);

%Calculamos el error 
error = Y- Yest;
Varesidual = var(error, n);
% NECESITAMOS LOS VALORES ORIGINALES PORQUE SI NO ESTAMOS ELIMINANDO LOS 0
VarY =  var(Y,n);

R2 = 1- Varesidual/VarY;

%en matlab log(x) = ln(x)
%log10(x)
%log2(x)
%para calcular logaritmo de base b hay que hacer log(x)/log(b)

% Hacer de nuevo el ejercicio pero con la restricción Y/x_>0
% Hacer la tabla de nuevo

% Y/X_>0      N
% 0           14+23+50
% 1           12+7+1
% 2           6+2

Ycondi = [0 1 2];
ncondi = [14+23+50 12+7+1 6+2,];
Ncondi = sum(ncondi);

%Se podría hacer con el comando mean() pero como tenemos frecuencias
%absolutas no podemos ahcerlo así sino que tenemos que hacer lo con
%sumatorio

media = sum(ncondi.*Ycondi)/Ncondi;

%si podemos calcular la varianza con el comando 
Varicondi = var[Ycondi, ncondi];
