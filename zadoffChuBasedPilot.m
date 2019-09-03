function pilot = zadoffChuBasedPilot(K,Np,N)
% K, number of users in one cell
%K = 8;
%Np = 2*K;% Chu sequence length should be no less than the number of users K
%N = 3;% the unique sequence parameter should be relatively prime with the length of the sequence Np
n = 0:Np-1;
z = exp(1i*N*pi*n.*(n+mod(Np,2))/Np);
L = 1;% different in terms of cells
z1 = z.*exp(1i*2*pi*L*n/Np);
z1 = z1';
pilot = zeros(Np,K);
% Ñ­»·ÒÆÎ»²Ù×÷

for i=0:K-1
   pilot(:,i+1) = circshift(z1,i);
end


