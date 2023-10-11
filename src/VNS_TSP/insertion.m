%% 插入操作
% 输入route1 : 路线1
% 输入i，j   : 插入点i，j
% 输出route2 : 经过插入操作变换后的路线2
function route2 = insertion(route1, i, j)
if i < j
    route2 = route1([1 : i - 1, i + 1 : j, i, j + 1 : end]);
else
    route2 = route1([1 : j, i, j + 1 : i - 1, i + 1 : end]);
end
end