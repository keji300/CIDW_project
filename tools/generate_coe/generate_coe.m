%%
clear;clc;
%% data
Fs = 128000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 128000;             % Length of signal
t = (0:L-1)*T;        % Time vector
f1 = 2000;                %��Ƶ
f2 = 16000;
f3 = 32000;
f4 = 1000;
f5 = 4000;
f6 = 1500;
f7 = 500;
f8 = 250;
S = 0.7*sin(2*pi*f1*t) + sin(2*pi*f2*t)+sin(2*pi*f3*t)+ sin(2*pi*f4*t)+sin(2*pi*f5*t)+sin(2*pi*f6*t)+sin(2*pi*f7*t)+sin(2*pi*f8*t);

X = S+ 2*randn(size(t)); %��������
%%

write_data = X;
max_abs = max (abs (write_data)) * 1.0001;

y_data = write_data/max_abs;
%%
 r=floor(y_data*(2^23)); %��С��ת��Ϊ������ceil������ȡ��������Ϊ24λ��

fid = fopen('orig128k.coe','w'); %д��sin.coe�ļ���������ʼ��sin_rom
fprintf(fid,'MEMORY_INITIALIZATION_RADIX=10;\n');
fprintf(fid,'MEMORY_INITIALIZATION_VECTOR=\n');
for i = 1:1:2^12        %2^12 = 4096���㣨romλ��ȣ�
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
% fid = fopen('square.coe','w'); %д��square.coe��������ʼ��rom_square
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
% fid = fopen('triangular.coe','w'); %д��triangular.coe����ʼ�����ǲ�rom
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