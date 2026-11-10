% Continuous-time representation parameters
f_sig = 5;                  % Frequency of the signal in Hz
T_total = 1;                % Signal duration in seconds
fs_continuous = 2000;       % Very high sampling rate to mimic a continuous signal
t_cont = 0:1/fs_continuous:T_total;

% Generate original continuous signal
x_cont = sin(2 * pi * f_sig * t_cont);

% Nyquist frequency requirement
f_nyquist = 2 * f_sig;      % Minimum sampling rate = 10 Hz

%% 1. Undersampling (fs < 2*f_sig) -> Causes Aliasing
fs_under = 6;               % 6 Hz < 10 Hz
t_under = 0:1/fs_under:T_total;
x_under = sin(2 * pi * f_sig * t_under);

%% 2. Nyquist Rate Sampling (fs = 2*f_sig) -> Minimum Non-Aliased Rate
fs_nyquist = f_nyquist;     % Exactly 10 Hz
t_nyquist = 0:1/fs_nyquist:T_total;
x_nyquist = sin(2 * pi * f_sig * t_nyquist);

%% 3. Oversampling (fs >> 2*f_sig) -> High Fidelity Reconstruction
fs_over = 60;               % 60 Hz >> 10 Hz
t_over = 0:1/fs_over:T_total;
x_over = sin(2 * pi * f_sig * t_over);

%% Plotting the Signals

figure('Color', [1 1 1]);

% Plot 1: Undersampling
subplot(3,1,1);
plot(t_cont, x_cont, 'k--', 'LineWidth', 1.2);
hold on;
stem(t_under, x_under, 'r', 'filled', 'LineWidth', 1.5);
plot(t_under, x_under, 'r:', 'LineWidth', 1);
hold off;
title(sprintf('1. Undersampling (fs = %d Hz < 2 \\cdot f_{sig}) - Aliasing Occurs', fs_under));
xlabel('Time (s)'); ylabel('Amplitude');
grid on; axis([0 T_total -1.2 1.2]);

% Plot 2: Nyquist Rate Sampling
subplot(3,1,2);
plot(t_cont, x_cont, 'k--', 'LineWidth', 1.2);
hold on;
stem(t_nyquist, x_nyquist, 'b', 'filled', 'LineWidth', 1.5);
plot(t_nyquist, x_nyquist, 'b:', 'LineWidth', 1);
hold off;
title(sprintf('2. Nyquist Rate Sampling (fs = %d Hz = 2 \\cdot f_{sig}) - Exact Minimum Rate', fs_nyquist));
xlabel('Time (s)'); ylabel('Amplitude');
grid on; axis([0 T_total -1.2 1.2]);

% Plot 3: Oversampling
subplot(3,1,3);
plot(t_cont, x_cont, 'k--', 'LineWidth', 1.2);
hold on;
stem(t_over, x_over, 'm', 'filled', 'LineWidth', 1.2);
hold off;
title(sprintf('3. Oversampling (fs = %d Hz >> 2 \\cdot f_{sig}) - High Fidelity', fs_over));
xlabel('Time (s)'); ylabel('Amplitude');
grid on; axis([0 T_total -1.2 1.2]);
