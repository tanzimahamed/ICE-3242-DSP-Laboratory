% 1. SIGNAL ADDITION
figure(1);

clc; 
clear all; 
close all;
n1 = -2:2; x1 = [1 2 3 4 5];    % x1(n), -2 <= n <= 2
n2 = 0:3; x2 = [3 -1 2 1];      % x2(n), 0 <= n <= 3
n = -2:3;                       % common range: -2 to 3
                                % Zero-padding: both signals now cover n = -2 ... 3
y1 = [x1 0];                    % one zero at the end (n = 3)
y2 = [0 0 x2];                  % two zeros at the front (n = -2,-1)
y = y1 + y2;                    % y(n) = x1(n) + x2(n)
subplot(3,1,1); stem(n, y1); grid on; axis([-3 4 -2 8]);
title('x_1(n) on the common range'); 
xlabel('n'); 
ylabel('Amplitude');
subplot(3,1,2); stem(n, y2); grid on; 
axis([-3 4 -2 8]);
title('x_2(n) on the common range'); 
xlabel('n'); ylabel('Amplitude');
subplot(3,1,3); stem(n, y); grid on; 
axis([-3 4 -2 8]);
title('Sum y(n) = x_1(n) + x_2(n)'); 
xlabel('n'); ylabel('Amplitude');
disp('Row 1 = n, Row 2 = y(n)');
disp([n; y]);




% 2. SIGNAL MULTIPLICATION
figure(2);
clc; 
n1 = -2:2; x1 = [1 2 3 4 5]; 
n2 = 0:3; x2 = [3 -1 2 1]; 
n = -2:3; 
y1 = [x1 0]; 
y2 = [0 0 x2]; 
y = y1 .* y2; 
subplot(3,1,1); stem(n, y1); grid on;
axis([-3 4 -5 11]);
title('x_1(n) on the common range'); 
xlabel('n'); ylabel('Amplitude');
subplot(3,1,2); stem(n, y2); 
grid on; axis([-3 4 -5 11]);
title('x_2(n) on the common range'); 
xlabel('n'); ylabel('Amplitude');
subplot(3,1,3); stem(n, y); grid on; axis([-3 4 -5 11]);
title('Product y(n) = x_1(n) x_2(n)'); 
xlabel('n'); 
ylabel('Amplitude');
disp('Row 1 = n, Row 2 = y(n)');
disp([n; y]);




% 3. ENERGY OF FINITE SEQUENCES

figure(3);

clc; 

n1 = -2:2; x1 = [1 2 3 4 5];        % x1(n), -2 <= n <= 2
x2 = [3 -1 2 1];                    % x2(n), 0 <= n <= 3

E1 = sum(x1.^2);                    % energy of x1 = 55
E2 = sum(x2.^2);                    % energy of x2 = 15

y = [x1 0] + [0 0 x2];              % x1(n) + x2(n) (as in Program 1)
E_add = sum(y.^2);                   % energy of the sum = 100

subplot(1,1,1), stem(n1, x1); grid on; axis([-4 6 0 16]);
title(['x_1(n), E = ' num2str(E1)]); xlabel('n');

fprintf('E1 = %g, E2 = %g\n', E1, E2);
fprintf('E(x1+x2) = %g, E1+E2 = %g\n', E_add, E1 + E2);





% 4. ENERGY OF A DECAYING EXPONENTIAL

figure(4);
clc; 

n1 = -2:2;  x1 = [1 2 3 4 5];
x2 = [3 -1 2 1];

E1 = sum(x1.^2);
E2 = sum(x2.^2);

y = [x1 0] + [0 0 x2];
E_add = sum(y.^2);

subplot(1,1,1); stem(n1, x1); grid on; axis([-4 6 0 16]);
title(['x_1(n), E = ' num2str(E1)]); xlabel('n');

fprintf('E1 = %g, E2 = %g\n', E1, E2);
fprintf('E(x1+x2) = %g, E1+E2 = %g\n', E_add, E1 + E2);







% 6. POWER OF THE UNIT STEP
figure(5);
clc;             % Clear screen

A = 2;           % Amplitude
n = -10:20;      % Sample numbers

x = A*(n >= 0);  % Generate unit step signal

P = cumsum(x.^2)./(1:length(x)); % Running power

subplot(2,1,1);        % First graph
stem(n,x);             % Plot unit step signal
grid on;
title('Unit Step Signal');
xlabel('n');
ylabel('Amplitude');

subplot(2,1,2);        % Second graph
plot(n,P,'b');         % Plot running power
grid on;
title('Running Power');
xlabel('n');
ylabel('Power');

fprintf('Final Power = %.2f\n',P(end)); % Display final power
