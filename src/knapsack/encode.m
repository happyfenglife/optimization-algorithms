%% 编码，生成满足约束的个体
% 输入n : 物品数目
% 输入w : 各个物品的质量
% 输入p : 各个物品的价值
% 输入cap : 背包的载重量
% 输出Individual : 满足背包载重量约束的个体
function Individual = encode(n, w, p, cap)
Individual = round(rand(1, n)); % 随机生成n个数字
% 判断Individual 是否满足背包的载重量约束
flag = judge_individual(Individual, w, cap);

%% 如果flag == 0，则需要修复个体
if flag == 0
    Individual = repair_individual(Individual, w, p, cap);
end
end