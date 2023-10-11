%% 插入操作后生成新的距离差矩阵Delta
% 输入route: 一条路线
% 输入dist:   距离矩阵
% 输入i, j:   插入点i, j
% 输出Delta3: 插入操作后的距离差值的矩阵
function Delta3 = Update3(route, dist, i, j)
N = numel(route); % 城市数目
route2 = insertion(route, i, j);
Delta3 = zeros(N, N); % N行N列的Delta初始化，每个位置上的元素是距离差值
for i = 1 : N
    for j = 1 : N
        if i ~= j
            Delta3(i, j) = cal_delta3(route2, dist, i, j);
        end
    end
end
end