clc;
close all;
clear;

Fs = 8000;
N = 51;
fc = 1500;
fL = 1000;
fH = 2500;

M = (N-1)/2;
n = -M:M;

Oc = 2*pi*fc/Fs;
OL = 2*pi*fL/Fs;
OH = 2*pi*fH/Fs;

w = 0.54 + 0.46 * cos(pi*n/M);

hLP = zeros(1,N);
hHP = zeros(1,N);
hBP = zeros(1,N);
hBS = zeros(1,N);

nz = (n ~= 0);

% Low-pass
hLP(nz) = sin(Oc*n(nz)) ./ (pi*n(nz));
hLP(~nz) = Oc / pi;

% High-pass (fixed non-zero and zero-index cutoff)
hHP(nz) = -sin(Oc*n(nz)) ./ (pi*n(nz));
hHP(~nz) = (pi - Oc) / pi;

% Band-pass (fixed parenthesis/sine separation)
hBP(nz) = (sin(OH*n(nz)) - sin(OL*n(nz))) ./ (pi*n(nz));
hBP(~nz) = (OH - OL) / pi;

% Band-stop (fixed signs and terms)
hBS(nz) = -(sin(OH*n(nz)) - sin(OL*n(nz))) ./ (pi*n(nz));
hBS(~nz) = (pi - OH + OL) / pi;

bLP = hLP .* w;
bHP = hHP .* w;
bBP = hBP .* w;
bBS = hBS .* w;

% --- Figure 1: Impulse Responses ---
figure('Name','Impulse Responses');

subplot(2,2,1);
stem(n, bLP, 'filled'); grid on;
title('Low-pass'); xlabel('n'); ylabel('Amplitude');

subplot(2,2,2);
stem(n, bHP, 'filled'); grid on;
title('High-pass'); xlabel('n'); ylabel('Amplitude');

subplot(2,2,3);
stem(n, bBP, 'filled'); grid on;
title('Band-pass'); xlabel('n'); ylabel('Amplitude');

subplot(2,2,4);
stem(n, bBS, 'filled'); grid on;
title('Band-stop'); xlabel('n'); ylabel('Amplitude');

% --- Frequency Responses ---
[HLP, f] = freqz(bLP, 1, 2048, Fs);
HHP = freqz(bHP, 1, 2048, Fs);
HBP = freqz(bBP, 1, 2048, Fs);
HBS = freqz(bBS, 1, 2048, Fs);

% --- Figure 2: Frequency Responses (Fixed overwrite issue) ---
figure('Name','Frequency Responses');

subplot(2,2,1);
plot(f, abs(HLP)); grid on;
title('Low-pass'); xlabel('Frequency (Hz)'); ylabel('|H(f)|');

subplot(2,2,2);
plot(f, abs(HHP)); grid on;
title('High-pass'); xlabel('Frequency (Hz)'); ylabel('|H(f)|');

subplot(2,2,3);
plot(f, abs(HBP)); grid on;
title('Band-pass'); xlabel('Frequency (Hz)'); ylabel('|H(f)|');

subplot(2,2,4);
plot(f, abs(HBS)); grid on;
title('Band-stop'); xlabel('Frequency (Hz)'); ylabel('|H(f)|');

% --- Filtered Waveforms ---
t = 0:1/Fs:0.05 - 1/Fs;
x = sin(2*pi*500*t) + sin(2*pi*1800*t) + sin(2*pi*3000*t);

yLP = filter(bLP, 1, x);
yHP = filter(bHP, 1, x);
yBP = filter(bBP, 1, x);
yBS = filter(bBS, 1, x);

figure('Name','Filtered Waveforms');

subplot(5,1,1);
plot(t, x); grid on;
title('Original Input'); ylabel('Amplitude');

subplot(5,1,2);
plot(t, yLP); grid on;
title('Low-pass Output'); ylabel('Amplitude');

subplot(5,1,3);
plot(t, yHP); grid on;
title('High-pass Output'); ylabel('Amplitude');

subplot(5,1,4);
plot(t, yBP); grid on;
title('Band-pass Output'); ylabel('Amplitude');

subplot(5,1,5);
plot(t, yBS); grid on;
title('Band-stop Output');
xlabel('Time (s)'); ylabel('Amplitude');