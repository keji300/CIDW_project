%%
clear;clc;
%% data
Fs = 128000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 128000;             % Length of signal
t = (0:L-1)*T;        % Time vector
f1 = 2000;                %基频
f2 = 16000;
f3 = 32000;
f4 = 1000;
f5 = 4000;
f6 = 1500;
f7 = 500;
f8 = 250;
S = 0.7*sin(2*pi*f1*t) + sin(2*pi*f2*t)+sin(2*pi*f3*t)+ sin(2*pi*f4*t)+sin(2*pi*f5*t)+sin(2*pi*f6*t)+sin(2*pi*f7*t)+sin(2*pi*f8*t);

X = S+ 2*randn(size(t)); %加入噪声
%%

write_data = X;
max_abs = max (abs (write_data)) * 1.0001;

y_data = write_data/max_abs;
%%
 r=floor(y_data*(2^23)); %将小数转换为整数，ceil是向上取整。量化为24位宽

fid = fopen('orig128k.coe','w'); %写到sin.coe文件，用来初始化sin_rom
fprintf(fid,'MEMORY_INITIALIZATION_RADIX=10;\n');
fprintf(fid,'MEMORY_INITIALIZATION_VECTOR=\n');
for i = 1:1:2^12        %2^12 = 4096个点（rom位深度）
fprintf(fid,'%d',r(i));
if i==2^12
fprintf(fid,';');
else
fprintf(fid,',');
end
if i%15==0
fprintf(fid,'\n');
end
end
fclose(fid);
%%
% t=1:1:2^12;
% y=(t<=2047);
% r=ceil(y*(2^8-1));
% fid = fopen('square.coe','w'); %写到square.coe，用来初始化rom_square
% fprintf(fid,'MEMORY_INITIALIZATION_RADIX=10;\n');
% fprintf(fid,'MEMORY_INITIALIZATION_VECTOR=\n');
% for i = 1:1:2^12
% fprintf(fid,'%d',r(i));
% if i==2^12
% fprintf(fid,';');
% else
% fprintf(fid,',');
% end
% if i%15==0
% fprintf(fid,'\n');
% end
% end
% fclose(fid);
% t=1:1:2^12;
% y=[0.5:0.5/1024:1-0.5/1024, 1-0.5/1024:-0.5/1024:0, 0.5/1024:0.5/1024:0.5];
% r=ceil(y*(2^8-1));
% fid = fopen('triangular.coe','w'); %写到triangular.coe，初始化三角波rom
% fprintf(fid,'MEMORY_INITIALIZATION_RADIX=10;\n');
% fprintf(fid,'MEMORY_INITIALIZATION_VECTOR=\n');
% for i = 1:1:2^12
% fprintf(fid,'%d',r(i));
% if i==2^12
% fprintf(fid,';');
% else
% fprintf(fid,',');
% end
% if i%15==0
% fprintf(fid,'\n');
% end
% end
% fclose(fid);