# Q_learning-and-Saras-using-Matlab
使用matlab在机器人走迷宫环境中测试Q-learninng和Sarsa  
<img src="https://github.com/wangjunhe8127/Q_learning-and-Saras-using-Matlab/blob/main/task.jpg" width="500">  
这个环境以往都是作为动态规划的场景，在这个任务里，我使用Q-learning和Sarsa分别编写matlab代码进行测试  
其中15，16为左上角以及右下角位置，设置为终点，给与+1奖励。  
训练时，我们随机给定初始状态，训练agnet。测试时同样随机给点，结果证明其都可以快速到达与之最近的终点。  
最终得到的Q_Learning的Q表和Sarsa的Q表如下：  
<img src="https://github.com/wangjunhe8127/Q_learning-and-Saras-using-Matlab/blob/main/result/Q_Qtable.jpg" width="300">  <img src="https://github.com/wangjunhe8127/Q_learning-and-Saras-using-Matlab/blob/main/result/S_Qtable.jpg" width="300">  
