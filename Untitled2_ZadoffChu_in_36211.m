% 未完成
% 试图实现3gpp协议中的zadoff chu序列，然后使用matlab的内置函数 lteZadoffChuSeq 生成 zadoff 序列，
% 但是lteZadoffChuSeq函数只支持奇数的ZC序列长度，对于用户数为偶数的情况，我不知道怎么处理

%{
pilot = gen_Zad_off_chu(pilotLen);% pilot sequence

% 生成K行N_dft列导频信号矩阵 ?
%}
%% 3gpp 36211 中关于zadoff 序列的一些参数的设定
% 以下 N_ID_1 和 N_ID_2 的值先在合理的范围内随便设一个，
N_ID_1 = 127;% Secondary Synchronization signal (SSS) provides Subframe Boundary (Position of 1st Symbol in a Subframe)
N_ID_2 = 1;% Primary Synchronization signal (PSS) provides Radio Frame Boundary ( Position of 1st Symbol in a Radio frame)
N_ID_cell = 3*N_ID_1+N_ID_2;% Physical layer cell identity, 小区的 PCI,取值范围 [0:503], 通过小区搜索过程，
% 借助 synchronization signal （PSS 和 RSS） 可以确定小区的 PCI
% 所有PCI的集合被分成168个组（对应协议36.211中的 N_ID_1,取值范围 LTE:[0:167] NR:[0:335]，
% 每组包含3个小区 ID（对应协议36.211中的 N_ID_2,取值范围 {0,1,2} see 36.211
n_ID_RS = N_ID_cell; % for Sounding reference signals (SRS), determining virtual cell identity for sequence generation
f_ss = mod(n_ID_RS,30);% sequence-shift pattern in SRS（在 PUCCH 控制 和 PUSCH 共享 中有不同定义）
f_gh_n_s = 0; % group-hopping pattern f_gh(n_s) = 0, if group hopping is disabled
u_group_number = mod(f_gh_n_s + f_ss,30);% u ∈{1,0 ,...,29 } is the group number
N_ZC_RS = pilotLen; %length of the Zadoff-Chu sequence, 
% 遇到一个问题，lteZadoffChuSeq
% 要求输入参数之一的序列长度是一个奇数，这个限制不符合实际可能的应用场景，
% 所以，是不是lteZadoffChuSeq的序列长度其实不是实际的导频序列的长度？

q_bar = N_ZC_RS*(u_group_number+1)/31;
v_base_sequence_number = 0; % the base sequence number within the group
q_root_value_of_Zadoff_Chu = floor(q_bar+1/2)+v_base_sequence_number*(-1)^floor(2*q_bar);
% 3gpp 协议里用上面这两个公式确定 q，即 Zadoff-Chu序列的root值，与group number 和 base sequence number 有关

% 考虑第 u 个时刻所有用户发送的信号 s = [s1 s2 ... sK]
% 以 K = 8， N = 2，为例，则一共有16个发送天线，所以需要生成16 × 1 的 Zadoff-Chu 序列
R = q_root_value_of_Zadoff_Chu;% Zadoff-Chu序列的root值与序列长度应该满足什么样的关系？
s = lteZadoffChuSeq(R,pilotLen);
% way 1 according to func(1)
%s_kn[u] = 1/sqrt(N_dft)*\sum_{v=-Ncp}^{N_dft-1}S_kn[v]*exp(1i*2*pi*u*v/N_dft)% func(1)
