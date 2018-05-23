clear all,clf,clc,format compact
car
VOL=CC(:,1);HP=CC(:,2);MPG=CC(:,3);VM=CC(:,4);WT=CC(:,5);
p=polyfit(WT,MPG,1)
N=length(VOL)
mWT=mean(WT),vWT=var(WT,1)
mMPG=mean(MPG),vMPG=var(MPG,1)
cov1=sum(MPG.*WT)/N-mMPG*mWT 
%cov1b=cov(MPG,WT,1) %En ambos b hay que extraer la info de la matriz que da [1,2]
r=cov1/sqrt(vMPG*vWT) % rb=corrcoef(WT,MPG)
Vr=(1-r^2)*vMPG
SSE_lineal=Vr*N
CD_lineal=r^2
M = [ones(N,1) VOL HP VM WT]; G = M'*M; z = M'*MPG; %Formando ec normales (La buena)
A=[N sum(VOL) sum(HP) sum(VM) sum(WT); %Ni caso
   sum(VOL) sum(VOL.^2) sum(HP.*VOL) sum(VM.*VOL) sum(WT.*VOL); 
   sum(HP) sum(VOL.*HP) sum(HP.^2) sum(VM.*HP) sum(WT.*HP);
   sum(VM) sum(VOL.*VM) sum(HP.*VM) sum(VM.^2) sum(WT.*VM);
   sum(WT) sum(VOL.*WT) sum(HP.*WT) sum(VM.*WT) sum(WT.^2)];
B=[sum(MPG);sum(MPG.*VOL);sum(MPG.*HP);sum(MPG.*VM);sum(MPG.*WT)];
%sol=A\B
aDI = M\MPG %usariamos esta por tener mejor numero de condicion 
aEN = G\z %Usamos esta por estar asi el guion
sol=aEN;
MPGe=sol(1)+sol(2)*VOL+sol(3)*HP+sol(4)*VM+sol(5)*WT; %Forma larga
MPGe=M*sol; %Forma corta
e=MPG-MPGe;
sum(e), Ve=var(e,1), SSE_hiper=sum(e.^2), CD_hiper=1-Ve/vMPG

disp('Apartado b')
CORR=corrcoef([MPG,VOL,HP,VM,WT])

[MAX,modmax]=max(e),modelMAX=MODEL(modmax,:) %Mas MPG-> Consumo mas bajo
[MIN,modmin]=min(e),modelMIN=MODEL(modmin,:) %Menos MPG-> Consumo mas alto

ImpMedia=mMPG
ImpMediana=median(MPG)
ImpHiperpl=sol(1)+sol(2)*70+sol(3)*84+sol(4)*100+sol(5)*30 %Forma dificil
ImpHiperpl=[1 70 84 100 30]*sol %Forma facil

disp('Apartado c')
X = CC(:,[3 1 2 4 5]);
N = size(X,1); [mean(X);std(X,1)]
Xv=(X-ones(N,1)*mean(X))/sqrt(N); %Matriz centrado-escalada
Xr=Xv./(ones(N,1)*std(X,1)); %Matriz tipificado-escalada
norm(Xv'*Xv-cov(X,1))
norm(Xr'*Xr-corrcoef(X))
[Gv, Dv] = eig(cov(X,1));
[Uv,Sv,Vv]=svd(Xv);
format long
[flipud(diag(Dv)), diag(Sv).^2]
[Gr, Dr] = eig(corrcoef(X));
[Ur,Sr,Vr]=svd(Xr);
[flipud(diag(Dr)), diag(Sr).^2]
format short, [fliplr(Gv), Vv]