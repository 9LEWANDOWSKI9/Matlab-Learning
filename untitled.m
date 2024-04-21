% 给定的线路编码序列
line_code = [1 0 1 0 0 0 0 0 0 0 0 1 0 1 1 0 0 0 0 1 0 1 1 0 0 0 0];

% 计算信号长度
signal_length = length(line_code);

% 采样率（假设每个位持续时间相同）
Fs = 1000; % 假设采样率为1000 Hz

% 生成时间向量
t = (0:signal_length-1) * (1/Fs);

% 生成信号
signal = repmat(line_code, 1, Fs);

% 计算信号的功率谱密度
[Pxx, f] = pwelch(signal, [], [], [], Fs);

% 绘制频谱图
plot(f, 10*log10(Pxx), 'LineWidth', 2);
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');
title('Power Spectral Density');
