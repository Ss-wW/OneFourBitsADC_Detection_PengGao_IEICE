% Paper: 
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

pilotLen = 16;% length of pilot sequence
pilot = gen_Zad_off_chu(pilotLen);% pilot sequence
Nsym_CE = 2; % number of symbols for Channel Estimatioin
H = genRayleigh(); % i.i.d. Rayleigh Fading Channel Model
q = {1,2,3,4}; % ADC's resolution; Alternatively
NumTrial = 10000; % number of Trails, unit: channel response/plot; plot 画图.

s_kn[u] = 1/sqrt(N_dft)*\sum_{v=-Ncp}^{N_dft-1}S_kn[v]*exp(1i*2*pi*u*v/N_dft)% func(1)

u = 0:N_dft-1; % time index
N_cp = 166; % CP的长度，要能覆盖到最长的多径延时，但不知道多径延时多大；参考LTE的 Normal CP 长度 N_cp = 166；
v = -N_cp:N_dft-1;


