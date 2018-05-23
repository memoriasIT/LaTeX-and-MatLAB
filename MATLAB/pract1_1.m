%Ejercicio sin agrupar en intervalos
clear all, format long
load datospr1
X
N=length(X)
XX=sort(X)
n1=N*1/4, n2=N*1/2, n3=N*3/4
nn1=floor(n1), nn2=floor(n2), nn3=floor(n3)
if n1==nn1, Q1=(XX(nn1)+XX(nn1+1))/2, else Q1=XX(nn1+1), end %El calculo de cuartiles se hace con la media si es entero o con el entero siguiente si no lo es
if n2==nn2, Me=(XX(nn2)+XX(nn2+1))/2, else Me=XX(nn2+1), end
if n3==nn3, Q3=(XX(nn3)+XX(nn3+1))/2, else Q3=XX(nn3+1), end
Lmin=Me-3*(Me-Q1) %Calculamos el valor valido menor
Lmax=Me+3*(Q3-Me) %Calculamos el valor valido mayor
La = find((X > Lmax)|(X < Lmin)); %Valores anomalos
L = find((X <= Lmax)&(X >= Lmin)); %Valores validos
Y=X(L) %Para pintar la variable valida 
Sx=sum(X), mediaX=Sx/N %Cosas estadisticas de X
Sx2=sum(X.^2), m2X=Sx2/N
VarX=m2X-mediaX^2
Ny=length(Y) %Cosas estadisticas de Y
Sy=sum(Y), mediaY=Sy/Ny
S2Y=sum(Y.^2), m2Y=S2Y/Ny
VarY=m2Y-mediaY^2