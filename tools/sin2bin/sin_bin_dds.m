%=============设置系统参数==============%
clear;clc;
f1=1e6;        %设置波形频率
f2=500e3;
f3=800e3;
Fs=20e6;        %设置采样频率
L=1024;         %数据长度
N=12;           %数据位宽
%=============产生输入信号==============%
t=0:1/Fs:(1/Fs)*(L-1);
y1=sin(2*pi*f1*t);
% y2=sin(2*pi*f2*t);
% y3=sin(2*pi*f3*t);
% y4=y1+y2+y3;
y4=y1;
y_n=round(y4*(2^(N-3)-1));      %N比特量化;如果有n个信号相加，则设置（N-n）
%=================画图==================%
a=10;           %改变系数可以调整显示周期
stem(t,y_n);
axis([0 L/Fs/a -2^N 2^N]);      %显示
%=============写入外部文件==============%
fid=fopen('C:\Users\Keji300\Desktop\sin.txt','w');    %把数据写入sin_data.txt文件中，如果没有就创建该文件  
for k=1:length(y_n)
    B_s=dec2bin(y_n(k)+((y_n(k))<0)*2^N,N);
    for j=1:N
        if B_s(j)=='1'
            tb=1;
        else
            tb=0;
        end
        fprintf(fid,'%d',tb);
    end
    fprintf(fid,'\r\n');
end

fprintf(fid,';');
fclose(fid);

y_fft1 = fft(y_n);
y_fft = abs(y_fft1);
plot (y_fft);
[max_f,max_location] = max(y_fft);
input_frequency = max_location /length(y_fft1) * Fs;
