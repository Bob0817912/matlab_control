data=load('C:\Users\20995\Desktop\homework_data_4.txt');
time=data(:,1);
signal_values=data(:,2);

A = 1; 
H = 1; 
Q = 0.005; 
R = 10; 

% 初始化卡尔曼滤波器参数
%相当于μ和Σ（方差）
x_hat =0; % 用实际初始信号估计值替换
P = 0; % 用实际初始误差协方差值替换

filtered_signal = zeros(size(signal_values));
for k = 1:length(time)
    x_hat_minus = A * x_hat;
    P_minus = A * P * A' + Q;
    K = P_minus * H' / (H * P_minus * H' + R);
    z = signal_values(k);
    x_hat = x_hat_minus + K * (z - H * x_hat_minus);
    P = (eye(size(x_hat)) - K * H) * P_minus;
    filtered_signal(k) = x_hat;
end



figure;
plot(time, filtered_signal, 'r', 'LineWidth', 1.25);
xlabel('时间');
ylabel('信号数值');
title('滤波后信号');
legend('滤波后信号');
grid on;
