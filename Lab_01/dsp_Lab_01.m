% 1. UNIT IMPULSE SIGNAL
clc;
clear all;
close all;
N=input('Number of Samples = ');
n=-N:1:N 
x=[zeros(1,N) 1 zeros(1,N)]
stem(n,x);
xlabel('Time');
ylabel('Amplitude');
title('Impulse Response');

%-----------------------------------------------------------

% 2. UNIT STEP SIGNAL
clc;
clear all;
close all;
N=input('Number of Samples = ');
n=-N:1:N
x=[zeros(1,N) 1 ones(1,N)]
stem(n,x);
xlabel('Time');
ylabel('Amplitude');
title('Unit Step Response')

%-------------------------------------------------------------

% 3. UNIT RAMP SIGNAL
clc;
clear all;
close all;
disp('UNIT RAMP SIGNAL');
N=input('Number of Samples = ');
a=input('Amplitude = ')
n=-N:1:N
x=a*n
stem(n,x);
xlabel('Time');
ylabel('Amplitude');
title('Unit Ramp Response');

%----------------------------------------------------------------------


% 4. EXPONENTIAL DECAYING SIGNAL
clc;
clear all;
close all;
disp('EXPONENTIAL DECAYING SIGNAL');
N=input('Number of Samples = ');
a=0.5
n=0:.1:N
x=a.^n
stem(n,x);
xlabel('Time');
ylabel('Amplitude');
title('Exponential Decaying Signal Response');

%----------------------------------------------------------------


% 5. EXPONENTIAL GROWING SIGNAL
clc;
clear all;
close all;
disp('EXPONENTIAL GROWING SIGNAL');
N=input('Number of Samples = ');
a=2 % a > 1 for a growing exponential
n=0:.1:N
x=a.^n
stem(n,x);
xlabel('Time');
ylabel('Amplitude');
title('Exponential Growing Signal Response');



% 6. COSINE SIGNAL
clc;
clear all;
close all;
disp('COSINE SIGNAL');
N=input('Number of Samples = ');
n=0:.1:N
x=cos(n)
stem(n,x);
xlabel('Time');
ylabel('Amplitude');
title('Cosine Signal');

%--------------------------------------------------------------


% 7. SINE SIGNAL
clc;
clear all;
close all;
disp('SINE SIGNAL');
N=input('Number of Samples = ');
n=0:.1:N
x=sin(n)
stem(n,x);
xlabel('Time');
ylabel('Amplitude');
title('Sine Signal');



