function [EV4]=FLOM_MUSIC(Zk,model)
%%%%%%%%%%%%%%%%%FLOMæÿ’Û%%%%%%%%%%%%%%%%
p=1.1;X1=Zk;
for s=1:size(X1,1)%j=1:size(X1,1)
    for i=1:size(X1,2)
      Y_p(i,s)=( abs(X1(s,i))^(p-2)*conj(X1(s,i)));
    end
end
Y=X1*Y_p;
Rxx=Y*Y'/model.v;
InvS=inv(Rxx); %%%%
[EV,D]=eig(Rxx);%%%% 
EVA=diag(D)';
[EVA,I]=sort(EVA);
EVA=fliplr(EVA);
EV4=fliplr(EV(:,I));
