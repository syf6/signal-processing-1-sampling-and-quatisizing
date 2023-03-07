clc;clear;close all
%%generate a sine wave of 5 seconds at 1kHz then sample at 48kHz
F0 = 400 ;% function frequency in Hz
Fs = 48000 ;% sampling frequency in Hz
duration = 5; % Duratio in seconds

%in time domain
%sine function
x = 0:1/Fs:duration; %time vector
y=sin(2*pi*F0*x); %sampled sine function
figure;
plot(x,y);
xlabel('Time(s)');
ylabel('Amplitude');
title('sine wave of 5 seconds at 1kHz');
xlim([0 0.002]);

%in frequency domain
%Plot the symmetrical FFT of the signal;
%F1=abs(fft(y)); %abs is absolut value
N=1024; %resolution
f = linspace(-Fs/2,Fs/2,N); % frequency domain
F2=abs(fftshift(fft(y))); %fftshift ?
figure;
plot(F2);

xlabel('Frequency(Hz)');
ylabel('Amplitude');
title('fourier transformation');


%Quantisize the sampled sine function in time domain
%F3 = stairs(y)
y2=((y+1)/2)*15; % add 1 to make [-1,1] to [0,2], /2 then 15 to get 16 integers [0,15]
y3=(round(y2)/15)*2-1; 
figure;
plot(x,y3);
xlim([0 0.002]);

%save sampled signal
filename='sampledSignal.wav';
audiowrite(filename,y,Fs);
fprintf('File saved as "%s"\n',filename);

%save quantisezed signal
filename='quantisizedSignal.wav';
audiowrite(filename,y3,Fs);
fprintf('File saved as "%s"\n',filename);

%make the sound
% sound(y,Fs);
% pause(T+1);
% sound(y3,Fs);


%Fftshift
%F2 = fftshift(F1);
%fshift = (-n/2:n/2-1)*(fs/n); % zero-centered frequency range
%powershift = abs(Y).^2/n;     % zero-centered power
%plot(fshift,powershift)



