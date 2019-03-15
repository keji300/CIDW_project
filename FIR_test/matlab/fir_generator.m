% fdatool
%低通滤波器：orders:8 
%fs:10000
%fpass:1000
%fstop:3000
%量化8位数



%% 产生正弦波原始数据
%=============设置系统参数==============%
clear;clc;
f1=1000;        %设置波形频率
f2=2000;
f3=1500;
Fs = 10000; %采样频率决定了两个正弦波点之间的间隔      
L = 4096; %采样点数    
N=16;           %数据位宽
%=============产生输入信号==============%
t=0:1/Fs:(1/Fs)*(L-1);
y1=sin(2*pi*f1*t);
y2=sin(2*pi*f2*t);
% y3=sin(2*pi*f3*t);
% y4=y1+y2+y3;
y4 = y1+y2;
y_n=round(y4*(2^(N)-1));      %N比特量化）
%=================画图==================%
a=10;           %改变系数可以调整显示周期
stem(t,y_n);
axis([0 L/Fs/a -2^N 2^N]);      %显示
%=============写入外部文件==============%
fid=fopen('D:\FPGA_CIDW\FIR_test\sin_1000+3000+4000.txt','w');    %把数据写入sin_data.txt文件中，如果没有就创建该文件  
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


% coeff_q = [f8,f6,14,4a,66,4a,14,f6,f8];
coeff_q = [248,246,20,74,102,74,20,246,248];%8位量化

out_q =conv(y_n,coeff_q);%卷积滤波



%% 仿真
L = 4096;
Fs = 10000;
t=0:1/Fs:(1/Fs)*(L-1);
in =sin(1000*2*pi*t) + sin(3000*2*pi*t) + sin(4000*2*pi*t);
 
coeff =[-0.03125,-0.0390625,0.0784125,0.2890625,0.3984375,0.2890625,0.078125,-0.0390625,-0.03125];
 
out =conv(in,coeff);%卷积滤波
 
subplot(2,1,1);
plot(in);
xlabel('滤波前');

% axis([0 200 -33]);

subplot(2,1,2);
plot(out);
xlabel('滤波后');

% axis([100 200 -22]);

