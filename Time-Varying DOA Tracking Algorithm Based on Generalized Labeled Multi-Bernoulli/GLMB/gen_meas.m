function meas= gen_meas(model,truth)

%variables
meas.K= truth.K;
meas.Z= cell(truth.K,1);

%generate measurements
for k=1:truth.K
    if truth.N(k) > 0
            [Zk,EV1]= gen_observation_fn(model,truth.X{k}); %single target observations if detected 
             meas.Z{k}=Zk;
            meas.EV{k,1}=EV1;
    end
end

