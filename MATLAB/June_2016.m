clc
format compact

%% June 2016

%% 5) Already answered in another exam

%% 6) Num colonia de hormigas Poisson media 1.84

%% a) Prob 5 o m'as en un DM^2
% Vendrá dada por la inversa de la funcion de densidad de 0:4
% P(x>=5) = 1-P(x<5) = 1- P(0:4)
Pa = 1-(sum(poisspdf(0:4, 1.84));

%% b) Prob 100 parcelas elegidas al azar al menos 8 tengan 5 o más colonias
% Puesto que comprobamos si tiene o no se trata de una binomial
% El concepto es el mismo que en el apartado anterior, solamente que los valores que introducimos son:
% x = 0:7
% n = 100
% P = Pa (Prob tenga 5 o más)
Pb = 1-(sum(binopdf(0:7, 100, Pa));

%% c) Estimar con Montecarlo 10k iteraciones que elegir 2 parcelas tengan mismo num colonias
% Como siempre, ponemos numero de iteraciones
nit = 10000;

% Creamos dos colonias que nos van a servir para la condición
Pc1 = poissrnd(1.84, 1, nit);
Pc2 = poissrnd(1.84, 1, nit);
% Ponemos la condición que nos dice el problema (las dos iguales)
% La condición es una matriz de nit elementos que serán 1 ó 0 según si la cumplen o no
Cond = (Pc1 == Pc2);
% Calculamos la proporción a partir del sumatorio de la condición
Prop = sum(Cond)/nit;

%% 7) Se desea contrastar si un fertilizante empleado en el abonado del trigo, resulta mejorado mediante la 
%% adici´on de hierro (Fe). Para su estudio se disponen de 25 parcelas de igual taman˜o, de las que se 
%% seleccionan 12 al azar a las que se las abona con el fertilizante modiﬁcado, mientras que las 13 restantes 
%% se les abona con el fertilizante sin modiﬁcar, obteni´endose las producciones siguientes en Tm. por parcela.
SinFe = [6.0 5.7 5.4 5.4 6.0 5.7 6.4 6.5 6.3 6.0 5.9 6.3 5.8 ];
ConFe = [5.9 6.6 6.1 6.5 7.0 6.6 6.1 6.1 6.0 6.3 6.2 5.9];

alpha = 0.05;
% Contraste de media si es cierto o no
[Ha, Pa] = ttest(SinFe, 6, alpha, 'both');
% Contraste de media si es mayor o no
[Hb, Pb] = ttest(ConFe, 6, alpha, 'right');
% Contrastede 2 medias si es mayor o no
[Hc, Pc] = ttest2(SinFe, ConFe, alpha, 'right');
% Contraste de medias si aumenta
[Hd,Pd]= ttest2(Fe,S+0.5,0.05,'right');
