%% 交换操作
% 输入route1 : 路线1
% 输入i，j   : 两个交换点
% 输出route2 : 经过交换操作变换后的路线2
function route2 = swap(route1, i, j)
route2 = route1;
route2([i, j]) = route1([j, i]);
end