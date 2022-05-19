function res = Env
    res.step = @step;
end
function [new_state,reward,done] = step(state,action)
[delta_x,delta_y] = resolution_action(action);
[pre_x,pre_y] = resolution_state(state);
[now_x,now_y,reward,done] = one_step(pre_x,pre_y,delta_x,delta_y);
new_state = x_y2state(now_x,now_y);
end

function [x,y,reward,done] = one_step(pre_x,pre_y,delta_x,delta_y)
x = pre_x + delta_x;
y = pre_y + delta_y;
if x>4
    x = 4;
end
if x<1
    x = 1;
end
if y>4
    y = 4;
end
if y<1
    y = 1;
end
if (x==1 && y==1) || (x==4 && y==4)
    reward = 1;
    done = true;
else
    reward = -1;
    done = false;
end
end

function [x,y] = resolution_state(state)
x = fix(state/4)+1;
y = mod(state,4)+1;
end

function [x,y] = resolution_action(action)
if strcmp(action, 'left')
    x = 0;
    y = -1;
elseif strcmp(action, 'right')
    x = 0;
    y = 1;
elseif strcmp(action, 'up')
    x = -1;
    y = 0;
else
    x = 1;
    y = 0;
end
end

function state = x_y2state(x,y)
state = (x-1)*4+(y-1);
if state == 0
    state = 16;
end
end