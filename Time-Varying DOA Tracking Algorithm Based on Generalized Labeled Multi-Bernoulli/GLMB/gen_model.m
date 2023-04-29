function model= gen_model

% basic parameters
model.x_dim= 2;   %dimension of state vector
model.z_dim= 1;   %dimension of observation vector
model.v_dim= 2;   %dimension of process noise
model.w_dim= 2;   %dimension of observation noise

model.T= 1;                         %sampling period
model.B= [model.T^2/2;model.T];
model.Bv=0.1;
model.H=[1 model.T;0 1];


model.kelm = 10;               % The number of elements
model.dd = 0.5;                %  The distance of the element
model.twpi = 2*pi;
model.omiga = model.twpi*1e8;  % w/2pi = 100MHz
model.derad = pi/180;
model.d=0:model.dd:(model.kelm-1)*model.dd;     

model.v=100;                   %the number of snapshots£»
model.SNR=10;
% birth parameters (LMB birth model, single component only)
model.T_birth=2;         %no. of LMB birth terms
model.L_birth= zeros(model.T_birth,1);                                          %no of Gaussians in each LMB birth term
model.r_birth= zeros(model.T_birth,1);                                          %prob of birth for each LMB birth term
model.w_birth= cell(model.T_birth,1);                                           %weights of GM for each LMB birth term
model.m_birth= cell(model.T_birth,1);                                           %means of GM for each LMB birth term
model.B_birth= cell(model.T_birth,1);                                           %std of GM for each LMB birth term
model.P_birth= cell(model.T_birth,1);                                           %cov of GM for each LMB birth term

model.L_birth(1)=1;                                                             %no of Gaussians in birth term 1
model.r_birth(1)=0.45;                                                          %prob of birth
model.w_birth{1}(1,1)= 1;                                                       %weight of Gaussians - must be column_vector
model.m_birth{1}(:,1)= [50; -2];                                 %mean of Gaussians
model.B_birth{1}(:,:,1)= diag([ 2; 1]);                  %std of Gaussians
model.P_birth{1}(:,:,1)= model.B_birth{1}(:,:,1)*model.B_birth{1}(:,:,1)';      %cov of Gaussians

model.L_birth(2)=1;                                                             %no of Gaussians in birth term 2
model.r_birth(2)=0.45;                                                          %prob of birth
model.w_birth{2}(1,1)= 1;                                                       %weight of Gaussians - must be column_vector
model.m_birth{2}(:,1)= [ -35; 1];                                 %mean of Gaussians
model.B_birth{2}(:,:,1)= diag([ 2; 1]);                  %std of Gaussians
model.P_birth{2}(:,:,1)= model.B_birth{2}(:,:,1)*model.B_birth{2}(:,:,1)';      %cov of Gaussians

% detection parameters
model.P_D= .98;   %probability of detection in measurements
model.Q_D= 1-model.P_D; %probability of missed detection in measurements





