% ex1-33.dat
%	column 1: 1 = beef, 2 = meat, 3 = poultry
%	column 2: Calories per hot dog
%	column 3: Sodium per hot dog


CC=[1 186  495
1 181  477
1 176  425
1 149  322
1 184  482
1 190  587
1 158  370
1 139  322
1 175  479
1 148  375
1 152  330
1 111  300
1 141  386
1 153  401
1 190  645
1 157  440
1 131  317
1 149  319
1 135  298
1 132  253
2 173  458
2 191  506
2 182  473
2 190  545
2 172  496
2 147  360
2 146  387
2 139  386
2 175  507
2 136  393
2 179  405
2 153  372
2 107  144
2 195  511
2 135  405
2 140  428
2 138  339
3 129  430
3 132  375
3 102  396
3 106  383
3  94  387
3 102  542
3  87  359
3  99  357
3 170  528
3 113  513
3 135  426
3 142  513
3  86  358
3 143  581
3 152  588
3 146  522
3 144  545];

% Hallar calorias medias y varianza para cada tipo de hamburguesa
%Separar por tipo de hamburguesa 
CC;
L1 = find(CC(:,1) ==1);
N1 = length(L1);

L2 = find(CC(:,1) ==2);
N2 = length(L2);

L3 = find(CC(:,1) ==3);
N3 = length(L3);

% Solo necesito la 3a columna que es del sodio
Y = CC(:,2);
Y1 = Y(L1);
Y2 = Y(L2);
Y3 = Y(L3);
%Media con comandos de matlab
mediaY1 = mean(Y1);
mediaY2 = mean(Y2);
mediaY3 = mean(Y3);

%Calculamos cuasivarianza
% el comando no hace lo que queremos
varianzaY1 = var(Y1)*(N1-1)/N1;
varianzaY2 = var(Y2)*(N2-1)/N2;
varianzaY3 = var(Y3)*(N3-1)/N3;

% diagrama de barras
%figure(1);
%para que no salga tan pegado al 0,0
line([0.6, 3.4],[0,0])
%Barras
line([1,1], [0, mediaY1], 'LineWidth', 8, 'Color', 'r')
line([2,2], [0, mediaY2], 'LineWidth', 8, 'Color', 'b')
line([3,3], [0, mediaY3], 'LineWidth', 8, 'Color', 'r')

%ajustar a un poligono de grado 1
%Falta calcular X que son las calorias
p = polyfit(X, Y, 1);
b = p(1);
a = p(2)
