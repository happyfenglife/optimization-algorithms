%% 对违反约束的个体进行修复
% 输入Individual : 个体
% 输入w : 各个物品的质量
% 输入p : 各个物品的价值
% 输入cap : 背包的载重量
% 修复后的个体 : 修复后的个体
function Individual = repair_individual(Individual, w, p, cap)
%% 判断一个个体是否满足背包的载重量约束 : 1表示满足，0表示不满足
flag = judge_individual(Individual, w, cap);

%% 只有不满足约束的个体才进行修复
if flag == 0
    %% 初步修复
    pack_item = find(Individual == 1); % 确认装进背包的物品的序号
    num_pack = numel(pack_item); % 装进背包中物品的总数目
    w_pack = w(pack_item); % 确认装进背包中的物品质量
    total_w = sum(w_pack); % 计算装包物品的总质量
    p_pack = p(pack_item); % 计算装包物品的总价值
    ratio_pack = p_pack ./ w_pack; % 计算装包物品的性价比

    %% 将装包物品按照性价比由低到高排序
    [~, rps_index] = sort(ratio_pack);
    
    %% 按照rps_index 顺序，依次将物品从背包中移除
    for i = 1 : num_pack
        remove_item = pack_item(rps_index(i)); % 被移除的物品序号
        % 如果移除该物品后满足背包的载重量约束
        % 则将该物品对应的基因位改为0，然后终止循环
        total_w = total_w - w_pack(rps_index(i)); % 装包物品总质量减少
        Individual(remove_item) = 0; % 将该物品的对应基因位改为0

        if total_w <= cap
            break;
        end
    end
    
    %% 进一步修复
    unpack_item = find(Individual == 0); % 确认未装包的物品的序号
    num_unpack = numel(unpack_item); % 未装包的物品的总数目
    w_unpack = w(unpack_item); % 确认未装进背包中的物品质量
    p_unpack = p(unpack_item); % 未装包物品的价值
    ratio_unpack = p_unpack ./ w_unpack; % 计算未装包物品的性价比

    %% 将未装包物品按照性价比由高到低排序
    [~, rups_index] = sort(ratio_unpack, 'descend');
    for i = 1 : num_unpack
        pack_wait = unpack_item(rups_index(i)); % 待装包物品编号
        % 如果装包该物品后满足背包的载重量约束
        if (total_w + w_unpack(rups_index(i))) <= cap
            total_w = total_w + w_unpack(rups_index(i)); % 装包后物品总质量增加
            Individual(pack_wait) = 1; % 将该物品对应的基因位改为1
        end
    end
end
end