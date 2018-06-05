%% 6. Junio 2017
%(Indicar las ´ordenes MATLAB necesarias) En una dehesa se est´a
% estudiando la producci´on de corcho de determinados alcornoques de los
% que se conoce, por datos anteriores, que la producci´on (por ´arbol)
% segu´?a una Normal de media 1.1 quintales y varianza 4. (a) Suponiendo
% esos datos correctos. ¿Cu´al es la probabilidad de elegir 5 ´arboles al
% azar y todos produzcan m´as de 1 quintal? (b) Queremos saber si el valor
% de la varianza sigue siendo fiable actualmente y si la producci´on ha
% aumentado; para ello tomamos una muestra de 26 ´arboles elegidos
% aleatoriamente que nos proporcionan los resultados siguientes:
% Producci´on={0, 0.0254, 1.6903, 3.7775, 0.6115, 2.1252, 1.2810, 3.1802,
% 0.0598, 1.6460, 2.3814, 3.1565, 3.7838, 1.7215, 0, 0.5502, 0.0987,
% 4.9240, 0.7294, 2.7579, 1.3279, 2.8567, 0.5183, 0, 0, 2.2904} Obtener
% conclusiones al 90%. NOTA: Suponer que el valor 4 de la varianza ya no
% resulta fiable tras el primer contraste.

% Normal media 1.1
% Varianza 4

% Probabilidad 5 al azar y producir > 1

%% a)
% Tot - f.distrib
% 2 es sqrt(var)
p1 = 1 - normcdf(1, 1.1, 2);
% Como son cinco casos se tienen que cumplir los 5, es decir union de
% sucesos
p = p1^5;

%% b)
Prod=[0, 0.0254, 1.6903, 3.7775, 0.6115, 2.1252, 1.2810, 3.1802, 0.0598, 1.6460, 2.3814, 3.1565,3.7838, 1.7215, 0, 0.5502, 0.0987, 4.9240, 0.7294, 2.7579, 1.3279, 2.8567, 0.5183, 0, 0, 2.2904];
% ¿Es fiable?
[H,P] = vartest(X, 4, 0.1, 'both');
% Si ha aumentado --> right
[H2, P2] = ttest(X,1.1, 0.1, 'right');


%% 6. Septiembre 2016
%´ Un arque´ologo conoce, para cada especie de hom´?nido que la longitud del hueso frontal sigue una
% distribuci´on normal, aunque de par´ametros diferentes para cada especie.
% Para la especie A que se sabe habitaba la regi´on de la excavaci´on,
% estos par´ametros son: µA = 12.0 y ?A = 1.1 El arque´ologo ha encontrado
% 37 f´osiles de huesos frontales proporcionando los valores: x={ 9.4010,
% 14.8865, 8.8196, 13.9024, 11.8101, 15.0917, 6.5978, 11.0058, 8.4804,
% 18.7700, 13.5630, 14.9474, 8.8545, 10.3285, 10.8188, 14.2461, 10.8053,
% 13.2539, 6.3705, 10.6154, 9.4410, 7.5574, 12.7699, 12.2050, 11.5837,
% 8.1658, 14.3187, 12.3754, 10.7523, 11.5572, 10.8450, 7.1245, 10.7859,
% 9.4216, 9.0520, 8.6090, 10.1661 } (a) Contrastar que pertenecen a la
% especie A al nivel de significaci´on ? = 0.025 en 2 fases: i. Contrastar
% que la varianza es compatible con los valores conocidos para la especie
% A. ii. Contrastar que la media es compatible con los valores conocidos
% para la especie A (suponer rechazado el contraste de la varianza). (b)
% Suponiendo rechazada la hip´otesis de que los huesos encontrados
% pertenezcan a la especie A, estimar intervalos de confianza con ? = 0.025
% para los valores de la media y varianza de la nueva especie.


%% a
% Media 12.0
% Sigma 1.1
% N = 37
% alpha = 0.025
% es varianza compatible? y la media?
x1 = [9.4010, 14.8865, 8.8196, 13.9024, 11.8101, 15.0917, 6.5978, 11.0058, 8.4804, 18.7700, 13.5630, 14.9474,8.8545, 10.3285, 10.8188, 14.2461, 10.8053, 13.2539, 6.3705, 10.6154, 9.4410, 7.5574, 12.7699, 12.2050,11.5837, 8.1658, 14.3187, 12.3754, 10.7523, 11.5572, 10.8450, 7.1245, 10.7859, 9.4216, 9.0520, 8.6090,10.1661];
[Ha, Pa] = vartest(X,1.1^2,0.025,'both');
[Hb, Pb] = ttest(X, 12, 0.025, 'both');

%% b

% alpha = 0.025 
% calcular media y varianza

medX1 = mean(x1);
desvX1 = sqrt(var(x1));
nx1 = length(x1);
% Tenemos que hacer 1 - alpha porque en MATLAB está al reves (sigma es lo
% contrario)
% Dividido entre 2 por
% que?????????????????????????????????????????????????????
ninvx1 = norminv((1-0.025)/2);

% Calcular intervalo de confianza de las medias y varianzas
% Formulas en diapositivas

%% 5) SEPTIEMBRE 2013

% 10^3 €
% Tabla con crucero y sin crucero
% Contrastar al 98% confianza --> Sigma = 0.02
% Facturacion días crucero > facturacion dias sin crucero
% Varianza de facturacion dias con crucero que sin crucero

% Binomial
% Sigma 0.02

% Crucero = [...];
% No Crucero = [...];

% Usamos ttest2 porque son dos variables, crucero y no crucero
% [Ha2013, Pa2013] = ttest2(Cruzero, NoCruzero, 0.02);
% [Hb2013, Pb2013] = ttest2(Crucero, NoCrucero, 0.02, 'right');
% [Hc2013, Pb2013] = vartest2(Crucero, NoCrucero, 0.02, 'right');


%% 6b) SEPTIEMBRE 2013

% 6200 clientes 
% 6 primeros meses gratis 2000 de ellos
% 12 % lo comprara despues se estima
% 6k restantes 0.3%
% Estimar con montecarlo 10k iteraciones
% necesita al menos 300 clientes para ser viable, dar intervalo de
% confianza 95% de tener más de 300 clientes

%% 7. JUNIO 2013 
%Las variables ?i son todas variables aleatorias independientes
% que siguen una exponencial de media 50. Estimar, mediante el m´etodo de
% Montecarlo, con 10000 iteraciones, las probabilidades (dar el intervalo
% de confianza al 95% de cada una): 
%(a) P(2?1 > 100) 
%(b) P(?1 + ?2 > 100)
% (c) P(?1 + ?2 + ?3 > 150)

NIT = 10000;
exp2013 = exprnd(50, NIT, 1);

% a)
C113 = (2*exp2014 > 100);
prop1 = sum(C113)/NIT;
% Calcular intervalo de confianza

% b)
C213 = exprnd(50, NIT, 1) + exprnd(50, NIT, 1);
prop2 = sum(C213)/NIT;
% Calcular intervalo confianza

%c) 
C313 = exprnd(50, NIT, 1) + exprnd(50, NIT, 1) + exprnd(50, NIT, 1);
prop2 = sum(C313)/NIT;
% Calcular intervalo confianza
