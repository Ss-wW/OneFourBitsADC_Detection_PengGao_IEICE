% δ���
% ��ͼʵ��3gppЭ���е�zadoff chu���У�Ȼ��ʹ��matlab�����ú��� lteZadoffChuSeq ���� zadoff ���У�
% ����lteZadoffChuSeq����ֻ֧��������ZC���г��ȣ������û���Ϊż����������Ҳ�֪����ô����

%{
pilot = gen_Zad_off_chu(pilotLen);% pilot sequence

% ����K��N_dft�е�Ƶ�źž��� ?
%}
%% 3gpp 36211 �й���zadoff ���е�һЩ�������趨
% ���� N_ID_1 �� N_ID_2 ��ֵ���ں���ķ�Χ�������һ����
N_ID_1 = 127;% Secondary Synchronization signal (SSS) provides Subframe Boundary (Position of 1st Symbol in a Subframe)
N_ID_2 = 1;% Primary Synchronization signal (PSS) provides Radio Frame Boundary ( Position of 1st Symbol in a Radio frame)
N_ID_cell = 3*N_ID_1+N_ID_2;% Physical layer cell identity, С���� PCI,ȡֵ��Χ [0:503], ͨ��С���������̣�
% ���� synchronization signal ��PSS �� RSS�� ����ȷ��С���� PCI
% ����PCI�ļ��ϱ��ֳ�168���飨��ӦЭ��36.211�е� N_ID_1,ȡֵ��Χ LTE:[0:167] NR:[0:335]��
% ÿ�����3��С�� ID����ӦЭ��36.211�е� N_ID_2,ȡֵ��Χ {0,1,2} see 36.211
n_ID_RS = N_ID_cell; % for Sounding reference signals (SRS), determining virtual cell identity for sequence generation
f_ss = mod(n_ID_RS,30);% sequence-shift pattern in SRS���� PUCCH ���� �� PUSCH ���� ���в�ͬ���壩
f_gh_n_s = 0; % group-hopping pattern f_gh(n_s) = 0, if group hopping is disabled
u_group_number = mod(f_gh_n_s + f_ss,30);% u ��{1,0 ,...,29 } is the group number
N_ZC_RS = pilotLen; %length of the Zadoff-Chu sequence, 
% ����һ�����⣬lteZadoffChuSeq
% Ҫ���������֮һ�����г�����һ��������������Ʋ�����ʵ�ʿ��ܵ�Ӧ�ó�����
% ���ԣ��ǲ���lteZadoffChuSeq�����г�����ʵ����ʵ�ʵĵ�Ƶ���еĳ��ȣ�

q_bar = N_ZC_RS*(u_group_number+1)/31;
v_base_sequence_number = 0; % the base sequence number within the group
q_root_value_of_Zadoff_Chu = floor(q_bar+1/2)+v_base_sequence_number*(-1)^floor(2*q_bar);
% 3gpp Э������������������ʽȷ�� q���� Zadoff-Chu���е�rootֵ����group number �� base sequence number �й�

% ���ǵ� u ��ʱ�������û����͵��ź� s = [s1 s2 ... sK]
% �� K = 8�� N = 2��Ϊ������һ����16���������ߣ�������Ҫ����16 �� 1 �� Zadoff-Chu ����
R = q_root_value_of_Zadoff_Chu;% Zadoff-Chu���е�rootֵ�����г���Ӧ������ʲô���Ĺ�ϵ��
s = lteZadoffChuSeq(R,pilotLen);
% way 1 according to func(1)
%s_kn[u] = 1/sqrt(N_dft)*\sum_{v=-Ncp}^{N_dft-1}S_kn[v]*exp(1i*2*pi*u*v/N_dft)% func(1)
