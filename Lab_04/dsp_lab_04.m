% 1. SAMPLING OF A SINE WAVE

figure(1);
clc;
clear all;
close all;
f = 5;                % signal frequency (Hz)
t = 0:0.001:1;        % fine time axis
xa = sin(2*pi*f*t);   % analog signal
fs = 50;              % sampling frequency (Hz)
n = 0:fs;             % sample number
x = sin(2*pi*f*n/fs); % sampled signal x(n)
subplot(2,1,1);
plot(t,xa);
xlabel('Time (s)');
ylabel('Amplitude');
title('Analog signal, f = 5 Hz');
subplot(2,1,2);
stem(n,x);
xlabel('n');
ylabel('Amplitude');
title('Sampled signal, fs = 50 Hz');




% 2. UNDER-SAMPLING AND OVER-SAMPLING

figure(2);

f = 5;                                    % signal frequency (Hz)
fs = input('Sampling frequency (Hz) = ');
t = 0:0.001:1;
xa = sin(2*pi*f*t);                       % analog signal
n = 0:fs;
x = sin(2*pi*f*n/fs);                     % samples
plot(t,xa);
hold on;
stem(n/fs,x,'r');                         % samples at time n/fs
xlabel('Time (s)');
ylabel('Amplitude');
title(['f = 5 Hz sampled at fs = ', num2str(fs), ' Hz']);


% 3. ALIASING

figure(3);

fs = 8; % sampling frequency (Hz)
t = 0:0.001:1;
n = 0:fs;
x1 = sin(2*pi*9*n/fs); % samples of a 9 Hz sine
x2 = sin(2*pi*1*n/fs); % samples of a 1 Hz sine
plot(t,sin(2*pi*9*t));
hold on;
plot(t,sin(2*pi*1*t),'g');
stem(n/fs,x1,'r');
xlabel('Time (s)');
ylabel('Amplitude');
title('Aliasing: 9 Hz and 1 Hz give the same samples');
disp('Samples of 9 Hz signal:'); 
disp(x1);
disp('Samples of 1 Hz signal:'); 
disp(x2);




% 4. QUANTIZATION

figure(4);

B = 3;                     % number of bits
L = 2^B;                   % number of levels
t = 0:0.001:1;
x = sin(2*pi*2*t);         % 2 Hz sine wave
D = 2/(L-1);               % step size
xq = round((x+1)/D)*D - 1; % quantized signal
e = xq - x;                % quantization error
subplot(2,1,1);
plot(t,x,t,xq,'r');
legend('original','quantized');
xlabel('Time (s)');
ylabel('Amplitude');
title('Quantization with B = 3 bits');
subplot(2,1,2);
plot(t,e);
xlabel('Time (s)');
ylabel('Error');
title('Quantization error');
disp('Step size ='); disp(D);
disp('Maximum error ='); 
disp(max(abs(e)));
