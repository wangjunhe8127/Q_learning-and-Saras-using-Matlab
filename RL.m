%{
describtion:Q-learning and Sarsa in 机器人迷宫
author:Wang Junhe
time:2022.5.19
%}
%%
%Q-learning训练
clear
clc
Q_Table = zeros(16,4);
Action_space = {'left';'right';'up';'down'};
State_space = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16];
alpha = 0.05;
gamma = 1;
len = 1000;
env = Env;
for i =1:1:len
    state = State_space(round(rand(1,1)*13)+1);
    done = false;
    while done == false
        %随机选择动作
        epsilon = 0.6-i*(0.6-0.1)/len;
        if rand(1)<epsilon
            tmp = round(rand(1,1)*3)+1;
        else
            [max_a,tmp] = max(Q_Table(state,:),[],2);
            
        end
        action = Action_space(tmp(1));
        [new_state,reward,done] = env.step(state,action);
        [new_max_a,new_tmp] = max(Q_Table(new_state),[],2);
        Q_Table(state,tmp(1)) = Q_Table(state,tmp(1))+alpha*(reward+gamma*Q_Table(new_state,new_tmp(1))-...
                                Q_Table(state,tmp(1)));
        state = new_state;
    end
end
%%
%Q-learning测试
epsilon = 0.01;
state = 6;
done = false;
while done == false
    %随机选择动作
    if rand(1)<epsilon
        tmp = round(rand(1,1)*3)+1;
    else
        [max_a,tmp] = max(Q_Table(state,:),[],2);
    end
    action = Action_space(tmp(1));
    [new_state,reward,done] = env.step(state,action);
    [new_max_a,new_tmp] = max(Q_Table(new_state),[],2);
    Q_Table(state,tmp(1)) = Q_Table(state,tmp(1))+alpha*(reward+gamma*Q_Table(new_state,new_tmp(1))-...
                            Q_Table(state,tmp(1)));
    state = new_state
end
%%
%Sarsa-learning训练
clear
clc
Q_Table = zeros(16,4);
Action_space = {'left';'right';'up';'down'};
State_space = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16];
alpha = 0.05;
gamma = 1;
len = 1000;
env = Env;
for i =1:1:len
    state = State_space(round(rand(1,1)*13)+1);
    done = false;
    while done == false
        %随机选择动作
        epsilon = 0.6-i*(0.6-0.1)/len;
        if rand(1)<epsilon
            tmp = round(rand(1,1)*3)+1;
        else
            [max_a,tmp] = max(Q_Table(state,:),[],2);
        end
        action = Action_space(tmp(1));
        [new_state,reward,done] = env.step(state,action);
        
        if rand(1)<epsilon
            new_tmp = round(rand(1,1)*3)+1;
        else
            [max_a,new_tmp] = max(Q_Table(new_state,:),[],2);
        end
        Q_Table(state,tmp(1)) = Q_Table(state,tmp(1))+alpha*(reward+gamma*Q_Table(new_state,new_tmp(1))-...
                                Q_Table(state,tmp(1)));
        state = new_state;
    end
end
%%
%Sarsa-learning测试
epsilon = 0.01;
state = 6;
done = false;
while done == false
    %随机选择动作
    epsilon = 0.6-i*(0.6-0.1)/len;
    if rand(1)<epsilon
        tmp = round(rand(1,1)*3)+1;
    else
        [max_a,tmp] = max(Q_Table(state,:),[],2);
    end
    action = Action_space(tmp(1));
    [new_state,reward,done] = env.step(state,action);

    if rand(1)<epsilon
        new_tmp = round(rand(1,1)*3)+1;
    else
        [max_a,new_tmp] = max(Q_Table(new_state,:),[],2);
    end
    Q_Table(state,tmp(1)) = Q_Table(state,tmp(1))+alpha*(reward+gamma*Q_Table(new_state,new_tmp(1))-...
                            Q_Table(state,tmp(1)));
    state = new_state
end



