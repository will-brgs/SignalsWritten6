%% Signals and Systems Matlab Homework #6
%% Introduction
% * Author:                   Will Burgess
% * Class:                    ESE 351
% * Date:                     Created 3/25/2024, Last Edited 4/02/2024
% * With contributions from:  Mack Larosa, Tasha Igic, Mischa Tranor

close all
%% 1.d.i
N1 = 3;
N = [16,64,256];
n = -N1:1:N1;
x = ones(size(n));

figure, hold on
for i = 1:length(N)
N_current = N(i);
x_out = fft(x, N_current);
freq = (0:N_current-1) * (2*pi)/N_current;

% Plot magnitude Left hand
subplot(3,2,2*i-1)
stem(freq, abs(x_out), 'b');
title(['Magnitude for N = ' num2str(N_current)]);
xlabel('Frequency (Hz)');
ylabel('Amplitude')

% Plot phase Right hand
subplot(3,2,2*i)
stem(freq, angle(x_out),'r');
title(['Phase for N = ' num2str(N_current)]);
xlabel('Frequency (Hz)');
ylabel('Phase (rad)')

end
sgtitle('4.d.i')
hold off

% The output magnitude resembles periodic functions with a major increase
% in amplitude towards the end of the frequency range. For the phase we
% observe a consistent downward shift moving up in frequency. Notably, as
% the N value is increased, the number of samples and percision of the DT
% output is enlarged.
%% 1.d.ii
N1 = [2,6,10];
N = 256;

figure, hold on
for i = 1:length(N1)
n = -N1(i):1:N1(i);
N1_current = N1(i);
x = ones(length(n));

x_out = fft(x, N);
freq = (0:N-1) * (2*pi)/N;

% Plot magnitude Left hand
subplot(3,2,2*i-1)
stem(freq, abs(x_out), 'b');
title(['Magnitude for N1 = ' num2str(N1_current)]);
xlabel('Frequency (Hz)');
ylabel('Amplitude')

% Plot phase Right hand
subplot(3,2,2*i)
stem(freq, angle(x_out),'r');
title(['Phase for N1 = ' num2str(N1_current)]);
xlabel('Frequency (Hz)');
ylabel('Phase (rad)')

end
sgtitle('4.d.ii')
hold off

% The output magnitude resembles periodic functions with a major increase
% in amplitude towards the end of the frequency range. For the phase we
% observe a consistent downward shift moving up in frequency. All plots
% show a similar density of points, however. WE recognise that with a
% mighter N1 value,w e see more bumps and more total periods 
%% 1.d.iii.1
N1 = 6;
N = 256;
n = 0:1:N1;
x = ones(size(n));
x = [zeros(1,3), x(1:(end - 3))];
freq = (0:N-1) * (2*pi)/N;

x_out = fft(x,N);

figure, hold on

% Plot magnitude top
subplot(2,1,1)
stem(freq, abs(x_out), 'b');
title('Magnitude for x[n-3]');
xlabel('Frequency (Hz)');
ylabel('Amplitude')

% Plot phase bot
subplot(2,1,2)
stem(freq, angle(x_out),'r');
title('Phase for x[n-3]');
xlabel('Frequency (Hz)');
ylabel('Phase (rad)')

sgtitle('4.d.iii.1')
hold off

% The output magnitude resembles periodic functions with a major increase
% in amplitude towards the end of the frequency range. For the phase we
% observe a consistent downward shift moving up in frequency. Only 3 two
% humps are observed.
%% 1.d.iii.2
N1 = 6;
N = 256;
n = 0:1:N1;
x = ones(size(n));
x = x - 0.5;
freq = (0:N-1) * (2*pi)/N;

x_out = fft(x,N);

figure, hold on

% Plot magnitude top
subplot(2,1,1)
stem(freq, abs(x_out), 'b');
title('Magnitude for x[n] - 0.5');
xlabel('Frequency (Hz)');
ylabel('Amplitude')

% Plot phase bot
subplot(2,1,2)
stem(freq, angle(x_out),'r');
title('Phase for x[n] - 0.5');
xlabel('Frequency (Hz)');
ylabel('Phase (rad)')

sgtitle('4.d.iii.2')
hold off

% This graph resembles the same shape as before but has more 'humps', the
% amplitude is at it smakimum at the endpoints and phase still is shown as
% a downward trend as frequency decreases
%% 1.d.iii.3
N1 = 6;
N = 256;
n = 0:1:N1;
x = ones(size(n));
x = x .* cos(pi*n);
freq = (0:N-1) * (2*pi)/N;

x_out = fft(x,N);

figure, hold on

% Plot magnitude top
subplot(2,1,1)
stem(freq, abs(x_out), 'b');
title('Magnitude for x[n] * cos(\pin)');
xlabel('Frequency (Hz)');
ylabel('Amplitude')

% Plot phase bot
subplot(2,1,2)
stem(freq, angle(x_out),'r');
title('Phase for x[n] * cos(\pin)');
xlabel('Frequency (Hz)');
ylabel('Phase (rad)')

sgtitle('4.d.iii.3')
hold off

% This output varies massively from the pervious outputs. Instead of the
% highest magnitude being seen at the lowest and highest frequencies, the
% peak is in the center. the magnitude represents a sinc function. The
% phase matches this. This comes directly from the cos(pi * n).