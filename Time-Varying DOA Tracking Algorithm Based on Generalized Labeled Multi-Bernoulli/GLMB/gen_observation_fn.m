function [Zk,EV1]= gen_observation_fn(model,X)
if isempty(X)
    Zk= [];
else
iwave = size(X,2);              % number of DOA
theta = X(1,:); 
A=exp(-j*model.twpi*model.d.'*sin(theta*model.derad));%%%% direction matrix
S=randn(iwave,model.v);
% sigma=10^(-model.SNR/10); 
X=A*S;
Zk=awgn(X,model.SNR);
[Zk,EV1]=observation(Zk,model);
end
