% % P[X = 13]
binopdf(13, 26, 0.4);

%% P[x = 0], p [x = 1], p[x=2]
binopdf(0:2, 26, 0.4);

%% Representar funcion prob de B(100, 0.3)
%% Sx = 0, 1, ..., 100
x = 0:100;
y = binopdf(0:100, 100, 0.3);
%%plot(x, y);

%% Calcular p[x= 3] y F(3) en una poisson de parametro 5
x = poisspdf(3,5);
F = poisscdf(3,5);

%% Representar
%%p[x>=5] --> 1-F(5)
%%p[x<= -2] --> F(-2)
%%P[2<=x <= 3] -->F(3) - F(2)
% F1 = poisscdf()
% F2 = ;
% F3 = ;

%% Sabiendo que P[X<=b] 0.037 calcular
x = norminv(0.0037, 4,3); %% = -1.359840096480411
x = norminv(0.975, 4, 3); %% Como queremos que de mayor que 1 pues hacemos 1-0.037

%% Simulación de sucesos
unidrnd(6,2,1); %% Lanzamiento de dos dados

binopdf(0:4, 4, 0.6); %%repito el experimento 4 veces con 0.6 de probabilidad
binornd(4, 0.6, 10); %%Calculo de una binomial %%matriz de 10 num de aleatorios


%% Comprobar que la simulacion (ometood de montecarlo) de 10k dados equilibrados
%% que la probabilidad de que la suma de las caras sea 5 en 1/5

%%MODO1
NIT = 10000;
x = unidrnd(6,2, NIT); %%Crear valores aleatorios de 1 al 6
xx = sum(x);
xxx = (xx==5); %%Crear vector de 0 y 1 para cuando valga 5 y ya
fa = sum(xxx); %%numero de veces que has tenido un 5
p = fa/NIT;

%%MODO2
cont = 0;
NIT = 10000;
for k = 1:NIT
    x=sum(unidrnd(6,2,1));
    if x == 5,
        cont = cont+1;
    end
end
cont;
p = cont/NIT;


% El tiempo que se tarda en llegar a TEATINOS en metro se compone de el tiempo de llegada del tren ?1
% m´as el del recorrido ?2, donde ?1 sigue una uniforme en [0,15], mientras que ?2 sigue una normal de media
% 15 minutos y 3 de desviaci´on. Hallar mediante simulaci´on (10000 iteraciones) los apartados a y b:
% (a) La probabilidad de tardar m´as de 25 min.
% (b) La probabilidad de tardar m´as que un autob´us que pasa en ese momento por la parada del metro y
% cuya duraci´on del trayecto sigue una normal de media 26 min. con desviaci´on de 5 min.
% (c) Queremos contrastar que la duraci´on del trayecto del metro es en realidad superior a 15 minutos, (sin
% fiarnos tampoco de que la desviaci´on sea 3) para ello medimos durante 14 d´?as el tiempo del trayecto
% obteniendo los tiempos 14, 16, 18, 14, 17, 15, 15, 16, 14, 19, 17, 16, 16, 15. Hacer el contraste al nivel
% del 5%

%%A)
conta=0;
NIT=10000;
for k=1:NIT
    x=unifrnd(0,15)+normrnd(15,3);
    if x>25, conta=conta+1;
    end
end
conta;
p=conta/NIT;

%%b)

% a) Estimar, mediante el m´etodo de Montecarlo con 10000 iteraciones, la probabilidad de que al sumar
% los valores absolutos de 10 variables aleatorias ?i que siguen una N(0,2), se obtenga un valor mayor que 30
% P(Sum0-10 epsilon > 30)
% b) Hallar el intervalo de confianza al 95 % para esta probabilidad.

conta=0;
NIT=10000;
for k=1:NIT
    x=sum(abs(normrnd(0,2))+abs(normrnd(0,2))+abs(normrnd(0,2))+abs(normrnd(0,2))+abs(normrnd(0,2)) +abs(normrnd(0,2))+ abs(normrnd(0,2))+abs(normrnd(0,2))+abs(normrnd(0,2))+abs(normrnd(0,2)));
    if x>30, conta=conta+1;
    end
end
conta;
p=conta/NIT;

% Una compa˜n´?a considera que en una provincia tiene 62000 posibles clientes. Como campa˜na de introducci´on
% ofrece un servicio gratuito durante los 6 primeros meses a 2000 de ellos, estimando que el 12% de
% ellos continuar´an recibi´endolo una vez pasado el periodo gratuito. Para los 60000 restantes, estima que la
% probabilidad de que lo contrate es del 0.3%.
% Estimar mediante el m´etodo de Montecarlo, con 10.000 iteraciones.
% (a) La media y varianza del n´umero de clientes que contratan el servicio (?):
% ? = ?1 + ?2 ? B(2000, 0.12) + B(60000, 0.003)
% (b) Si la empresa necesita, al menos, 300 clientes para ser viable. Dar un intervalo de confianza al 95%
% para la probabilidad de que ? sea mayor o igual a 300. (P(? ? 300) )


%%A)
conta=0;
NIT=10000;
for k=1:NIT
    x= sum(binornd(2000,0,12) + binornd(600,0.003));
end

media = mean(x);
varianza = var(x);