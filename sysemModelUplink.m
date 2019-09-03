%% parameters
% Paper title:  Detection Scheme for Massive MIMO System with
% Low-resolution ADCs, Peng Gao, Yukitoshi Sanada, IEICE
B = 20;% Bandwidth with unit at MHz/RB
M = 128; % BS antennas; Alternatively M = 1024, horizontal 8,64 \times vertical 16
N = 2; % Each user, number of antennas, horizontal 1 \times vertical 2
K = 8; % Number of Users
lambda = 0; % wavelength
interval_BS = 0.5*lambda; % interval of antennas at BS
interval_UE = 1.0*lambda; % interval of antennas at UE
n_sc = 1200; % number of Subcarriers
N_dft = 2048; % number of DFT points
B = 150; % number of Blocks
V = n_sc/B; % Number of Subcarrier/Block
Np  = 2; % number of symbols in Pilot Slot

pilotLen = N*K;% 文章中的设置是 16， 我感觉应该是 N × K 算出来的，length of pilot sequence

Nsym_CE = 2; % number of symbols for Channel Estimatioin

q = {1,2,3,4}; % ADC's resolution; Alternatively
NumTrial = 10000; % number of Trails, unit: channel response/plot; plot 画图.
u = 0:N_dft-1; % time index
N_cp = 166; % CP的长度，要能覆盖到最长的多径延时，但不知道多径延时多大；参考LTE的 Normal CP 长度 N_cp = 166；
v = -N_cp:N_dft-1;


%% generate s1[u]:sK[u]
s = zadoffChuBasedPilot(pilotLen,K,getPrime(pilotLen));

%% IDFT


%% insert CP
%% transmit signal (x11[u]:x1N[u]):(xK1[u]:xKN[u])
%% AWGN channel, Rayleigh Fading
H = genRayleigh(); % i.i.d. Rayleigh Fading Channel Model
%% receive signal y1[u]:yM[u]
%% Power Dectector (where?)
%% q1[u]:qM[u], low resolution ADC, Re and Im seperately quantized
%% remove CP 
%% DFT
%% MRC/MMSE detection
%% output: s1_hat[u]:sK_hat[u]
%% 仿真：

