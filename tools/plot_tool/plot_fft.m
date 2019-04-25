function [signal_out] = plot_fft (signal_in,Fs) %输入信号，输出信号
Y = fft(signal_in);
L2 = size(Y,2);
P2_s = abs(Y/L2);
P1_s = P2_s(1:L2/2+1);
P1_s(2:end-1) = 2*P1_s(2:end-1); %计算单侧频谱
f = Fs*(0:(size(Y,2)/2))/size(Y,2);
signal_out = Y;
figure()
plot(f,P1_s)

xlabel('f (Hz)')
ylabel('|P1(f)|')