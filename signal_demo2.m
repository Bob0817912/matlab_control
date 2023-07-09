data=load('C:\Users\20995\Desktop\homework_data_2.txt');
time=data(:,1);
signal_values=data(:,2);
plot(time,signal_values,'b--');
xlabel('time');
ylabel('signal_values');
title('signal');
grid on;
