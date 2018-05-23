clear all, format compact,clf
Hamb,whos
Y=CC(:,2);
X=CC(:,3);N=length(X)
L1=find(CC(:,1)==1);N1=length(L1)
L2=find(CC(:,1)==2);N2=length(L2)
L3=find(CC(:,1)==3);N3=length(L3)
Y1=Y(L1); Y2=Y(L2); Y3=Y(L3);
X1=X(L1); X2=X(L2); X3=X(L3);
mY1=sum(Y1)/N1,%mY1b=mean(Y1)
mY2=sum(Y2)/N2,%mY2b=mean(Y2)
mY3=sum(Y3)/N3,%mY3b=mean(Y3)
mX1=sum(X1)/N1,%mX1b=mean(X1)
mX2=sum(X2)/N2,%mX2b=mean(X2)
mX3=sum(X3)/N3,%mX3b=mean(X3)
vY1=sum(Y1.^2)/N1-mY1^2,%<-Este primero esta mal %vY1b=var(Y1,1)
vY2=sum(Y2.^2)/N2-mY2^2,%vY2b=var(Y2,1)
vY3=sum(Y3.^2)/N3-mY3^2,%vY3b=var(Y3,1)
vX1=sum(X1.^2)/N1-mX1^2,%vX1b=var(X1,1)
vX2=sum(X2.^2)/N2-mX2^2,%vX2b=var(X2,1)
vX3=sum(X3.^2)/N3-mX3^2,%vX3b=var(X3,1)
disp('Apartado a') 
line([0.6,3.4],[0,0]) %MAL
line([1,1],[0,mY1],'LineWidth',8,'Color','r')
line([2,2],[0,mY2],'LineWidth',8,'Color','g')
line([3,3],[0,mY3],'LineWidth',8,'Color','b')

mYs = [mY3 mY2 mY1]; mXs = [mX3 mX2 mX1]; %Este bien
figure(1), bar(repmat(mYs,2,1),0.5), axis([0.5 1.5 0 1+ceil(max(mYs))]), grid
legend('Pollo','Ternera','Ternera',2), set(gca,'XTick',[])
xlabel('Calorias medias (Y barra)')

line([0.6,3.4],[0,0]) %MAL
line([1,1],[0,mX1],'LineWidth',8,'Color','r')
line([2,2],[0,mX2],'LineWidth',8,'Color','g')
line([3,3],[0,mX3],'LineWidth',8,'Color','b')

%Este bien
figure(2), bar(repmat(mXs,2,1),0.5), axis([0.5 1.5 0 41+ceil(max(mXs))]), grid
legend('Ave','Resto','Ternera',1), set(gca,'XTick',[])
xlabel('Sodios medios (X barra)')
disp('Apartado b')
p=polyfit(X,Y,1), b=p(1), a=p(2) %Recta Y/X: Y = a + b*X (Solo con frecuencias absolutas)
mX=mean(X),mY=mean(Y),vX=var(X,1),vY=var(Y,1)
covar=sum(X.*Y)/N-mX*mY,
r=covar/sqrt(vX*vY) %Coef de correlacion de pearson
Vr=(1-r^2)*vY, SSEL=N*Vr

p1=polyfit(Y,X,1),b1=p1(1),a1=p1(2) %Recta X/Y
Vr1=(1-r^2)*vX, SSEL1=N*Vr1

xx=100:700;yy1=polyval(p,xx);
yy=80:200;xx1=polyval(p1,yy);
plot(X,Y,'x',xx,yy1,xx1,yy)

plot(X1,Y1,'xr',X2,Y2,'xg',X3,Y3,'xb',xx,yy1,xx1,yy),grid %Con colores

disp('Apartado c')
pp=polyfit(X,Y,3) %3=cubica (2=cuadrica...)
ye=polyval(pp,X); e=Y-ye; %Y estimado, vector de errores
Ve=var(e,1) %Varianza del error (residual)
SSE=sum(e.^2) 
R2=1-Ve/vY

yy2=polyval(pp,xx); %Evaluando en la cubica
plot(X,Y,'x',xx,yy1,xx,yy2,xx1,yy),grid
 

