function prime0 = getPrime(N)
% prime 不大于输入参数的所有互素数
% prime0 prime的最后一个元素
% 遍历的思路
prime = [0 2:N-1 0];
for i = 2:N-1
    if mod(N,i) == 0
        prime(i) = 0;% 尽量减少遍历的次数，每次处理掉两个数时间复杂度为 O(N)
        prime(N/i) = 0;
    end
end

% remove all zeros in prime
prime(prime==0) = [];
prime0 = prime(end);


    
