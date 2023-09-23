%% 逆转操作
% 输入route1 : 路线1
% 输入i，j   : 逆转点i，j
% 输出route2 : 经过逆转操作变换后的路线2
function route2 = reversion(route1, i, j)
i1 = min([i, j]);
i2 = max([i, j]);
route2 = route1;
route2(i1 : i2) = route1(i2 : -1 : i1);
end