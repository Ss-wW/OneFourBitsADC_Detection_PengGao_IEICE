function prime0 = getPrime(N)
% prime ������������������л�����
% prime0 prime�����һ��Ԫ��
% ������˼·
prime = [0 2:N-1 0];
for i = 2:N-1
    if mod(N,i) == 0
        prime(i) = 0;% �������ٱ����Ĵ�����ÿ�δ����������ʱ�临�Ӷ�Ϊ O(N)
        prime(N/i) = 0;
    end
end

% remove all zeros in prime
prime(prime==0) = [];
prime0 = prime(end);


    
