% examen marzo/abril 2015
% 
% Categoria       Peso en gr/pieza    ni
% Peewee          inf,40              3466
% Small           40,45               12447
% Medium          45,55               24776
% Large           55,60               11372
% Extra-Large     60, 68              3567
% Jumbo           68, inf             678

%a) moda
% b) entropia
% c) en un pais se estudia establecer una modalidad XL que debe contener 
% al 5% más grande ¿Dónde debe ponerse el limite?

% Para calcular la moda como la amplitud es distinta tenemos que calcular
% las alturas y el elemento con más altura será el intervalo modal

% Mo = Li-1 + ai * hi/(h1 + h2
% h1 = hi - hi-1
% h2 = hi - hi+1

% Primero arreglamos los intervalos proque hay infinitos

Li = [35 40 45 55 60 68 76];
% a = amplitd se calcula con diff que te da la diferencia entre uno y el
% anterior. Tiene uno menos porque son 6 intervalos 
a = diff(Li);
n = [3466 12447 24776 11372 3567 678];
N = sum(n);
% area = baser * altura
h = n./a;
% caluclamos maxima altura te devuelve cual es la maxima y donde esta valor
% maxi

[valor, ind] = max(h);

% en matlab el primer elemento no es 0 sino 1
h1 = h(ind ) - h(ind-1);
h2 = h(ind ) - h(ind+1);
Mo = Li(ind) + a(ind)*h1/(h1+h2);

%Para calcular la entropia -sum(fi*log(fi))
% base del logaritmo es el numero de intervalos que tenemos en este caso
% hay 6 intervalos así que logaritmo de base 6
% para pasar usamos log6f = log(f) / log(6)

%f es frecuencia relativa
f = n./N;

log6f = log(f)./log(6);

Entropia = -sum(f.*log6f);

% Podemos calcular cuantiles Q1, Q2...
% Q1 = Li-1 + ai * (N/4 - Ni-1)/ni
% tenemos que saber en que intervalo está por eso usamos el comando
% cumsum() entonces tenemos Ni = cumsum(n)
% el primero que se pase de 1/4 de N será el que buscamos 
% usamos el comando find() que te dice en que posición está lo que queremos
% find(nacum > N/4)
% ind = P(1)

nacu = cumsum(n);
n1 = N/4;
p = find(nacu >= n1);
ind = p(1);

Q1 = Li(ind) + a(ind)*(n1-nacu(ind-1))/n(ind)

%Para calcular otros cuartiles cambiamos el n1 a otro 2/4 etc y despues el
%q1 sutituimos n1 por n2, n3, etc.