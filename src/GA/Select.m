%% 选择操作
% 输入Chrom : 种群
% 输入FitnV : 适应度值
% 输入GGAP  : 代沟
% 输出SelCh : 被选择的个体
function SelCh = Select(Chrom, FitnV, GGAP)
NIND = size(Chrom, 1); % 种群数目
Nsel = NIND * GGAP;
total_FitnV = sum(FitnV); % 所有个体的适应度值和
select_p = FitnV ./ total_FitnV; % 计算每个个体被选中的概率
select_index = zeros(Nsel, 1); % 存储被选中的个体序号
% 对select_p 进行累加操作，c(i) = sum(select_p(1 : i))
% 如果select_p 
c = cumsum(select_p);
%% 循环NIND次，选出NIND个个体
for i = 1 : Nsel
    r = rand; % 0 ~ 1的随机数
    index = find(r <= c, 1, 'first');
    select_index(i, 1) = index; 
end
SelCh = Chrom(select_index, :); % 被选中的个体
end