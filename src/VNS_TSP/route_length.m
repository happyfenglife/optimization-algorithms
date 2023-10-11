%% 计算一条路线的总距离
% 输入route : 一条路线
% 输入dist : 距离矩阵
% 输出len : 该条路线总距离
function len = route_length(route, dist)
n = numel(route);
route = [route route(1)];
len = 0;
for k = 1 : n
    i = route(k);
    j = route(k + 1);
    len = len + dist(i, j);
end
end