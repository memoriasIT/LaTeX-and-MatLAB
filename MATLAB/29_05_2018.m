clear all
%% Ejercicio 10: 
% Queremos contrastar si el valor 10 es la media de los datos x = {6.4106,
% 11.6808, 8.2239, 10.2002, 8.9109, 10.6070, 8.7993, 10.9799, 11.4787,
% 13.4238}, conocido que provienen de una normal de desviaci´on t´?pica ? =
% 2.

X=[6.4106 11.6808 8.2239 10.2002 8.9109 10.6070 8.7993 10.9799 11.4787 13.4238]

% H Resultado contraste
% P Significacion (probabilidad equivocarnos al rechazar hipotesis)

% Normal con desviaci´on t´?pica conocida.
% [H,P]=ztest(X,M,sigma,alfa,tipo)

 
% mu (media poblacion) = 10
% desviacion tipica = 2
% suponemos 0.05

[H,P] = ztest(X, 10, 2, 0.05, 'both')

% Como a H=0, p=0.91 que se interpreta como que debemos aceptar la
% hip´otesis nula pues tenemos el 91% de probabilidad de equivocarnos al
% rechazarla

%% Ejercicio 11: 
% Un servicio de pizzas asegura que atiende una petici´on en menos de 40
% minutos. Se hace una prueba obteniendo los valores (en min.)
% {53,29,65,60,17,27,42,37}. ¿Podemos rechazar la afirmaci´on al 5%?

% Normal con desviaci´on t´?pica desconocida 
%  [H,P]=ttest(X,M,alfa,tipo)

X2= [53,29,65,60,17,27,42,37];
[H2,P2] = ttest(X2,40 ,0.05, 'left') 

% Como h2 = 0 y P2 = 0.57 no rechazamos la hip´otesis nula

%% Ejercicio 12: 
% Dos rutinas A y B resuelven el mismo problema, los tiempos de ejecuci´on
% de la primera son: tA = {5.6118, 1.7233, 4.3208, 8.7092, 3.8557,
% 7.9219,6.2481, 8.8734, 2.0782, 5.6046, 3.5843, 11.8160, 7.6504, 8.7579,
% 3.8836, 5.0628} y los de la segunda: tB = {7.7275, 9.0984, 7.7221,
% 8.7015, 5.9482, 7.6462, 7.1764, 6.4229} ¿Podemos, al 5% de
% significaci´on, rechazar la afirmaci´on de que A es m´as r´apida que B?

% [H,P]=ttest2(X,Y,alfa,tipo)
% diferencia de medias entre dos distribuciones normales con desviaciones 
% t´?picas desconocidas.

X3 = [5.6118, 1.7233, 4.3208, 8.7092, 3.8557, 7.9219, 6.2481, 8.8734,
    2.0782, 5.6046, 3.5843, 11.8160, 7.6504, 8.7579, 3.8836, 5.0628];
Y3 = [7.7275, 9.0984, 7.7221, 8.7015, 5.9482, 7.6462, 7.1764, 6.4229];

% A más rápida que B
[H3,P3]=ttest2(X3,Y3,0.05,'left')

% H = 0 y P = 0.0699, que se interpreta como que no rechazamos la
% hip´otesis nula pero que ha faltado muy poco para hacerlo, por ejemplo se
% rechazar´?a al 7% de significaci´on.

%% Ejercicio 13: 
% Una m´aquina envasadora debe hacer paquetes con 1000 g. de peso. Una vez
% calibrada se miden los 10 primeros paquetes envasados obteniendo(en Kg.):
% X={1.0001, 1.0039, 1.0019, 1.0000, 0.9993, 1.0011, 1.0021, 1.0000,
% 1.0032, 0.9984}. Cuando lleva 10 semanas funcionando se vuelve a hacer
% una revisi´on tomando 8 medidas: Y={0.9900, 0.9963,0.9990, 0.9981,
% 0.9958, 1.0067, 0.9919, 0.9975}. Estudiar al 5%: 
% 1. Si la media de los nuevos datos es 1Kg.=1000g. 
% 2. Si las varianzas son iguales. 
% 3. Si la m´aquina est´a sufriendo de holguras (VY > VX) 
% 4. Si la nueva varianza es el doble, o m´as del doble, que la anterior.

% [H,P]=vartest(X,V,alfa,tipo) Realiza un contraste param´etrico de la
% varianza. El valor de la varianza a contrastar es el par´ametro V. El
% contraste ser´a de una o dos colas seg´un el par´ametro tipo. Si tipo es
% ’both’ se contrastar´a si el verdadero valor de la varianza ? 2 es
% distinto V, si ’right’ se contrasta si ? 2 > V y si ’left’, si ? 2 < V .

% [H,P]=vartest2(X,Y,alfa,tipo) Realiza un contraste param´etrico (F) de la
% igualdad de varianzas. Si tipo es ’both’ se contrastar´a si ? 2 X 6= ? 2
% Y , si ’right’ se contrasta si ? 2 X > ?2 Y y si ’left’, si ? 2 X < ?2 Y
% .

X4 = [1.0001, 1.0039, 1.0019, 1.0000, 0.9993, 1.0011, 1.0021, 1.0000,1.0032, 0.9984];
Y4 = [0.9900, 0.9963,0.9990, 0.9981, 0.9958, 1.0067, 0.9919, 0.9975];
%1)
[H41,P41]=ttest(Y4,1,0.05,'both')
% H=0, p=0.1255 y aceptamos la hip´otesis nula.

%2)
[H42,P42]=vartest2(X4,Y4,0.05,'both')
% H=1, p=0.0054, indicando que son diferentes.

%3)
[H43,P43]=vartest2(X4,Y4,0.05,'left')
% H=1, p=0.0027, indicando que son diferentes.

%4)
[H44,P44]=vartest2(sqrt(2)*X4,Y4,0.05,'right')
% H=0 p = 0.973 

%% Ejercicio 1:
% El cociente entre la longitud y grosor del hueso hueso h´umero tiende a
% ser constante para cada especie. Un arque´ologo, a menudo determina la
% especie de un animal al que pertenecen unos f´osiles examinando esta
% relaci´on. Se sabe que para la especie A esta relaci´on tiene de media
% 8.5. Un arque´ologo ha encontrado 41 f´osiles de huesos h´umero en una
% excavaci´on donde se supon´?a que la especie A no habitaba. Mide esta
% relaci´on en los f´osiles y encuentra los valores: x={8.9699 9.6203
% 9.6129 8.2467 9.2151 9.0587 9.9781 10.5182 10.5368 8.2482 9.3397 7.8416
% 7.9583 9.2421 11.0279 8.3572 9.6808 8.9883 10.5461 7.9867 9.2878 9.8909
% 10.5267 11.0413 9.3497 7.5198 8.3889 8.0186 11.9765 8.5359 10.1178 9.0268
% 10.2808 8.3628 7.6234 7.6000 9.8163 9.0442 9.0226 10.8964 9.5882}
% Contrastar que la media de estos cocientes es 8.5 al nivel de
% significaci´on 0.01.

% media = 8.5
% encontrados 41
% nivel significacion (alpha) = 0.01

x=[8.9699 9.6203 9.6129 8.2467 9.2151 9.0587 9.9781 10.5182 10.5368 8.2482 9.3397 7.8416 7.9583 9.2421 11.0279 8.3572 9.6808 8.9883 10.5461 7.9867 9.2878 9.8909 10.5267 11.0413 9.3497 7.5198 8.3889 8.0186 11.9765 8.5359 10.1178 9.0268 10.2808 8.3628 7.6234 7.6000 9.8163 9.0442 9.0226 10.8964 9.5882];
[H2,P2] = ttest(X,8.5 ,0.05, 'both') 
% Both???

%% Ejercicio 2: 
% Las normas de construcci´on en una regi´on exigen que los
% tubos utilizados no tengan una resistencia media a la presi´on de menos
% de 2520 Kg. por metro lineal. Un empresario desea contrastar si el tubo
% de una compa˜n´?a suministradora cumple la especificaci´on indicada, para
% ello, selecciona 7 tubos y obtiene los valores: y={2610, 2750, 2420,
% 2510, 2510, 2540, 2490, 2680} ¿Existe suficiente evidencia para rechazar
% los tubos de la empresa suministradora al 10%.

% alfa = 0.1
% media = 2520

Y2 =[2610, 2750, 2420,2510, 2510, 2540, 2490, 2680];

%% Ejercicio 3: 
%Una empresa asegura que su nuevo modelo reduce el tiempo de
% respuesta (tiempo de espera hasta obtener informaci´on en el disco duro)
% en 2µs. Se toma una muestra con 14 accesos con el modelo antiguo y 25 con
% el nuevo obteni´endose: z1={22.4978 23.8877 21.4955 22.9966 23.1351
% 22.0563 22.5157 21.1342 21.1520 22.4049 23.0223 24.8855 21.6331 22.4873}
% z2 ={19.7093 17.6737 19.3171 17.8259 20.7244 18.8232 19.9101 19.2010
% 20.1339 19.1396 20.3390 20.6133 21.6831 19.5865 17.4478 18.8765 21.2901
% 18.6206 20.8570 19.9365 21.3804 17.6430 19.5825 18.4714 22.9988} 
% a)Contrastar que la informaci´on es cierta al 5%.
% b) Contrastar que la varianza de z1 es 1. 
% c) Contrastar que la varianza de z2 es mayor que 1.
% d) Contrastar que la varianza de z2 es el doble de la de z1. 


%% Ejercicio 4:
% El nivel medio de radiaci´on natural debido al Rad´on primigenio es 1.26
% milisevert (mSv) al a˜no, con una varianza de 0.04 mSv/a˜no. Se quiere
% ver si en una regi´on se mantienen esos niveles, para ello se toma una
% muestra que proporciona los valores: r={1.4003 1.3787 0.6541 1.5744
% 0.7423 0.7042 1.4240 1.1155 1.5234 1.6031 1.6573 1.1927 1.5348 1.4302
% 1.6478 1.5608 1.6694 1.3604 1.3558 1.7023 0.7629 1.2486 1.0188 1.2852
% 1.5946 1.6477 1.0955 1.2587 1.4411 1.3124 1.4905 1.5200 1.1210 1.3470
% 0.7604} Contrastar: 
% a) Que la varianza es la misma, es decir, vale 0.04 mSv/a˜no. 
% b) Que la regi´on no tiene unos niveles especiales de radiactividad y la 
% media es tambi´en 1.26 mSv/a˜no (por Rad´on).
