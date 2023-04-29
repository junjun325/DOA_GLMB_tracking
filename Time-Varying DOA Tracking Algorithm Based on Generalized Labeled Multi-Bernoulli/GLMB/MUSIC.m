
function [EV1]=MUSIC(Zk,model)

Rxx=Zk*Zk'/model.v;
[EV,D]=eig(Rxx);%%%% 
EVA=diag(D)';
[EVA,I]=sort(EVA);
EVA=fliplr(EVA);
EV1=fliplr(EV(:,I));
