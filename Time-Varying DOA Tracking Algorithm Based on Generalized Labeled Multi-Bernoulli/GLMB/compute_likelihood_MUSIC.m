function SP= compute_likelihood_MUSIC(truth,model,X,EV,r,k,m)
iwave = size(truth.X{k},2);               % number of DOA
if k==1
    iwave=1;
else
    iwave=truth.N(k-1);
end
% iwave=truth.N(k);
theta = X(1,:); % ½Ç¶È
En=EV(:,iwave+1:end);
nspace = En*En';


for i = 1:size(theta,2)
    a=exp(-j*model.twpi*model.d*sin(theta(i)*model.derad)).';
    SP(i)=1/(a'*nspace*a);
end
SP=abs(SP*r);



