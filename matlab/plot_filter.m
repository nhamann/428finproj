% read input signal
fin = get_result('filter.in', 8);
N = size(fin, 2);
t = 0:1:N-1;
% plot input signal
figure(1)
subplot(2,2,1)
plot(t, fin, 'b');
title('Plot 4 - Input Waveform');
ylabel('Magnitude of Signal', 'FontSize', 16)
xlabel('Sampling points', 'FontSize', 16) 

% plot signal in frequency domain
%perform FFT
numpt = 512;
f1 = fin(1:numpt);
fclk=200000;
Dout_spect = fft(f1);
Dout_dB = 20*log10(abs(Dout_spect));
maxdB=max(Dout_dB(1:256));
figure(1)
subplot(2,2,2)
plot([0:numpt/2-1]*fclk/numpt,Dout_dB(1:numpt/2)-maxdB);
grid on;
title('Plot 4 - Input FFT PLOT');
xlabel('SIGNAL FREQUENCY (Hz)', 'FontSize', 16);
ylabel('AMPLITUDE (dB)', 'FontSize', 16);
hold off


% read output signal
fin = get_result('filter.out', 8);
N = size(fin, 2);
t = 0:1:N-1;
% plot output signal
figure(1)
subplot(2,2,3)
plot(t, fin, 'b');
title('Plot 4 - Output Waveform');
ylabel('Magnitude of Signal', 'FontSize', 16)
xlabel('Sampling points', 'FontSize', 16) 

% plot output signal in frequency domain
%perform FFT
numpt = 512;
f1 = fin(1:numpt);
fclk=200000;
Dout_spect = fft(f1);
Dout_dB = 20*log10(abs(Dout_spect));
maxdB=max(Dout_dB(1:256));
figure(1)
subplot(2,2,4)
plot([0:numpt/2-1]*fclk/numpt,Dout_dB(1:numpt/2)-maxdB);
grid on;
title('Plot 4 - Output FFT PLOT');
xlabel('SIGNAL FREQUENCY (Hz)', 'FontSize', 16);
ylabel('AMPLITUDE (dB)', 'FontSize', 16);
axis([0, 10*10^4, -60, 0])
hold off

