% 1. AMPLITUDE SCALING
figure(1);
clc;
clear all;
close all;
n = -2:3;          % time index
x = [1 2 3 4 5 6]; % x(-2)=1 ... x(3)=6
A1 = 2;            % amplification factor
A2 = 0.5;          % attenuation factor
y1 = A1*x;         % y(n) = 2x(n)
y2 = A2*x;         % y(n) = 0.5x(n)
subplot(3,1,1); 
stem(n,x); 
axis([-7 9 0 13]); 
grid on;
xlabel('Time (n)'); 
ylabel('Amplitude');
title('Original signal x(n)');
subplot(3,1,2); 
stem(n,y1); 
axis([-7 9 0 13]); 
grid on;
xlabel('Time (n)'); 
ylabel('Amplitude');
title('Amplitude scaled signal 2x(n)');
subplot(3,1,3); 
stem(n,y2); 
axis([-7 9 0 13]); 
grid on;
xlabel('Time (n)'); 
ylabel('Amplitude');
title('Amplitude scaled signal 0.5x(n)');



% 2. TIME SHIFTING
figure(2);
clc;

n = -2:3;
x = [1 2 3 4 5 6];
k1 = 3;                
nd = n + k1;            
k2 = 2;                 
na = n - k2;           
subplot(3,1,1);  
stem(n,x); 
axis([-7 9 0 7]); 
grid on;
xlabel('Time (n)'); 
ylabel('Amplitude');
title('Original signal x(n)');
subplot(3,1,2); 
stem(nd,x); 
axis([-7 9 0 7]); 
grid on;
xlabel('Time (n)'); 
ylabel('Amplitude');
title('Delayed signal x(n-3)');
subplot(3,1,3); 
stem(na,x); 
axis([-7 9 0 7]); 
grid on;
xlabel('Time (n)'); 
ylabel('Amplitude');
title('Advanced signal x(n+2)');
disp('Delayed signal x(n-3):'); 
disp([nd; x]);
disp('Advanced signal x(n+2):'); 
disp([na; x]);



% 3. Time Reversal 
figure(3);
clc;

n = -2:3;
x = [1 2 3 4 5 6];
xr = fliplr(x); 
nr = -fliplr(n);
subplot(2,1,1);
stem(n,x); 
axis([-7 9 0 7]); 
grid on;
xlabel('Time (n)'); 
ylabel('Amplitude');
title('Original signal x(n)');
subplot(2,1,2); 
stem(nr,xr); 
axis([-7 9 0 7]); 
grid on;
xlabel('Time (n)'); 
ylabel('Amplitude');
title('Time reversed signal x(-n)');
disp('Reversed signal x(-n):'); 
disp([nr; xr]);




% $. Time Scaling ( compression & Expansion)

figure(4);
clc;

x = [1 2 3 4 5 6];
M = 2; 
nc = ceil(min(n)/M):floor(max(n)/M);
xc = x(M*nc - min(n) + 1); 
L = 2; 
ne = L*min(n):L*max(n); 
xe = zeros(1,length(ne));
xe(1:L:length(ne)) = x; 
subplot(3,1,1); stem(n,x); 
axis([-7 9 0 7]); 
grid on;
xlabel('Time (n)'); 
ylabel('Amplitude');
title('Original signal x(n)');
subplot(3,1,2); 
stem(nc,xc);
axis([-7 9 0 7]); 
grid on;
xlabel('Time (n)'); 
ylabel('Amplitude');
title('Compressed signal x(2n)');
subplot(3,1,3); 
stem(ne,xe); 
axis([-7 9 0 7]); 
grid on;
xlabel('Time (n)'); 
ylabel('Amplitude');
title('Expanded signal x(n/2)');
disp('Compressed signal x(2n):'); 
disp([nc; xc]);
disp('Expanded signal x(n/2):'); 
disp([ne; xe]);