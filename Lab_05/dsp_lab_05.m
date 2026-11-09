% 1. Convolution Using conv()
clc;
clear all; 
close all;
figure(1);

x = [1 2 3 1];        % input signal
h = [3 2 1];          % impulse response

y = conv(x, h)        % output: 3 8 14 11 5 1

nx = -1:2;            % x starts at n = -1
nh = 0:2;             % h starts at n = 0
ny = -1:4;            % y starts at -1+0 = -1 and ends at 2+2 = 4

subplot(3,1,1); stem(nx, x); title('Input x(n)');
subplot(3,1,2); stem(nh, h); title('Impulse response h(n)');
subplot(3,1,3); stem(ny, y); title('Output y(n)');


% 2. Convolution Using a for-Loop

figure(2);

x = [1 2 3 1];
h = [3 2 1];
y = zeros(1, 6);       % output has 4 + 3 - 1 = 6 samples

for k = 1:4            % take each input sample one by one
    y(k:k+2) = y(k:k+2) + x(k)*h;   % add a scaled, shifted copy of h
end

y                      % 3 8 14 11 5 1 (same as conv)
stem(y); title('Convolution using for-loop');


%3. Autocorrelation

figure(3);

x = [1 2 3 1];
r = xcorr(x)      % 1 5 11 15 11 5 1
lag = -3:3;
stem(lag, r); 
title('Autocorrelation of x(n)'); 
xlabel('lag');
E = sum(x.^2)     % energy = 15 = middle (largest) value of r


% 4. Cross-Correlation
figure(4)
x = [1 2 3 1];
y = [1 1 2 1];
r1 = xcorr(x, y)          % 1 4 8 10 7 4 1
r2 = conv(x, fliplr(y))   % same answer
lag = -3:3;
subplot(2,1,1); stem(lag, r1); 
title('Using xcorr');
subplot(2,1,2); 
stem(lag, r2); 
title('Using conv with flipped y');


% 5. Delay Estimation

figure(5)

s = [1 2 3 2 1];                % signal we send
r = [zeros(1,10) s zeros(1,5)]; % received: s delayed by 10 samples
r = r + 0.3*randn(1,20);        % add some noise
[c, lag] = xcorr(r, s);         % compare r and s at every lag
[peak, pos] = max(c);           % find the largest value
delay = lag(pos)                % answer: 10
subplot(3,1,1); stem(s);  
title('Sent signal s(n)');
subplot(3,1,2); stem(r); 
title('Received signal r(n)');
subplot(3,1,3); stem(lag, c); 
title('Cross-correlation');