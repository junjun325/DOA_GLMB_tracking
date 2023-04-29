%J. Zhao, R. Gui, X. Dong and S. Wu, "Time-Varying DOA Tracking Algorithm Based on Generalized Labeled Multi-Bernoulli," 
% in IEEE Access, vol. 9, pp. 5943-5950, 2021, doi: 10.1109/ACCESS.2020.3048952.

close all;clear;clc;
tic
model= gen_model;
truth= gen_truth(model);
r=5;
meas=  gen_meas(model,truth);
est1=   run_filterGLMB(model,meas,truth,r);  
handles= plot_results(model,truth,meas,est1);