
[dontSample, Fs] = audioread('arctic_a0013.wav');

dontSample = dontSample';

sampleIndices = [0 0.02 0.11 0.16 0.27 0.31 0.41 0.49 0.57 0.64 0.68 0.83 ...
    0.93 0.98 1.02 1.11 1.18 1.21 1.28 1.32 1.36 1.42 1.50 1.53 1.62 1.70...
    1.83 1.88 1.93 1.99 2.16 2.30 2.37 2.40 2.46 2.55 2.65 2.76 2.80 2.83...
    2.89 2.98 3.02 3.12 3.18 3.24 3.35 3.40 3.52 3.66 3.82 3.97];
    
patterns = [];
for k=2:length(sampleIndices)
    index1 = int64((sampleIndices(k)*Fs));
    index2 = int64((sampleIndices(k-1)*Fs));
    if index2 == 0
        index2 = 1;
    end
    sample = dontSample(index2:index1);
    pattern = fft(sample, 300);
    patterns = [patterns; real(pattern)];
end

[dontSample, Fs] = audioread('arctic_a0014.wav');

dontSample = dontSample';

sampleIndices = [0 0.04 0.11 0.23 0.32 0.35 0.39 0.51 0.56 0.65 0.68 0.77 0.83 0.97 1.06 1.11 1.15 1.23 1.31 1.41 1.47 1.52 1.67 1.75 1.84 2.11 2.21 2.31 2.36 2.43 2.52 2.58 2.7 2.81 2.89 2.94 3.03];

for k=2:length(sampleIndices)
    index1 = int64((sampleIndices(k)*Fs));
    index2 = int64((sampleIndices(k-1)*Fs));
    if index2 == 0
        index2 = 1;
    end
    sample = dontSample(index2:index1);
    pattern = fft(sample, 300);
    patterns = [patterns; real(pattern)];
end

[dontSample, Fs] = audioread('arctic_a0010.wav');

dontSample = dontSample';

sampleIndices = [0 0.02 0.17 0.24 0.32 0.43 0.48 0.56 0.66 0.7 0.85 0.88 0.95 0.99 1.02 1.16 1.21 1.38 1.44 1.49 1.52 1.59 1.67 1.72 1.76 1.84 1.88 1.93 2.02 2.08 2.14 2.23 2.26 2.39 2.49 2.59 2.63 2.73 2.81 3.03 3.15 3.31];

for k=2:length(sampleIndices)
    index1 = int64((sampleIndices(k)*Fs));
    index2 = int64((sampleIndices(k-1)*Fs));
    if index2 == 0
        index2 = 1;
    end
    sample = dontSample(index2:index1);
    pattern = fft(sample, 300);
    patterns = [patterns; real(pattern)];
end

[dontSample, Fs] = audioread('arctic_a0009.wav');

dontSample = dontSample';

sampleIndices = [0 0.02 0.1 0.16 0.29 0.4 0.45 0.48 0.63 0.71 0.75 0.86 0.94 1.13 1.23 1.29 1.33 1.43 1.54 1.6 1.66 1.73 1.79 1.86 1.94 2.05 2.09 2.13 2.18 2.31 2.38 2.44 2.58 2.63 2.67 2.79 2.94 3 3.03 3.15];

for k=2:length(sampleIndices)
    index1 = int64((sampleIndices(k)*Fs));
    index2 = int64((sampleIndices(k-1)*Fs));
    if index2 == 0
        index2 = 1;
    end
    sample = dontSample(index2:index1);
    pattern = fft(sample, 300);
    patterns = [patterns; real(pattern)];
end

target = char('pau', 'hh', 'iy', 'w', 'aa', 'z', 'ax', 'hh', 'eh', 'd', ...
    'sh', 'ao', 'r', 't', 'er', 'dh', 'ae', 'n', 'hh', 'ih', 'z', 'k', ...
    'ax', 'm', 'p', 'ae', 'n', 'y', 'ax', 'n', 'ah', 'v', 'ao', 'l', 'm', ...
    'ow', 's', 't', 'd', 'eh', 'l', 'ax', 'k', 'ax', 't', 'f', 'ax', 'z',...
    'iy', 'k', 'pau');

target2 = char('pau', 'n', 'aw', 'y', 'ao', 'r', 'k', 'ah', 'm', 'ih', 'ng', 'd', 'aw', 'n', 't', 'ax', 'b', 'ih', 'z', 'n', 'ax', 's', 'f', 'ih', 'l', 'hh', 'iy', 'ih', 'k', 's', 'k', 'l', 'ey', 'm', 'd', 'pau');

target3 = char('pau', 'ay', 'm', 'p', 'l', 'ey', 'ih', 'ng', 'ax', 's', 'ih', 'ng', 'g', 'ax', 'l', 'hh', 'ae', 'n', 'd', 'ih', 'n', 'w', 'ah', 't', 'l', 'uh', 'k', 's', 'l', 'ay', 'k', 'ax', 'l', 'uw', 'z', 'ih', 'ng', 'g', 'ey', 'm', 'pau');

target4 = char('pau', 'hh', 'iy', 't', 'er', 'n', 'd', 'sh', 'aa', 'r', 'p', 'l', 'iy', 'ae', 'n', 'd', 'f', 'ey', 's', 't', 'g', 'r', 'eh', 'g', 's', 'ax', 'n', 'ax', 'k', 'r', 'ao', 's', 'dh', 'ax', 't', 'ey', 'b', 'ax', 'l');

target = [target ; target2; target3; target4];

target = cellstr(target);

%target = cellstr([char(target); char(target2)]);

phones = unique(target);
numPhones = length(phones);
targets = [];
for k=1:length(target)
   output = zeros(1, numPhones);
   for j=1:numPhones
       if strcmp(target{k}, phones{j})
           output(j) = 1;
           targets(end + 1,:) = output;
       else
           continue
       end
   end
end

% [dontSample2, Fs] = audioread('SA1.wav');
% 
% dontSample2 = dontSample2';
% 
% sampleIndices2 = [[2520 3727]; [3727 4971]; [4971 5830]; [5830 6452]; ...
%     [6452 6719]; [6719 7066]; [7066 7681]; [7681 8570]; [8570 8810]; ...
%     [8810 10569 ]; [10569 11146]; [11146 12000]; [12000 12320]; ...
%     [12320 13911]; [13911 15610]; [15610 16130]; [16130 17388]; ...
%     [17388 18090]; [18090 18529]; [18529 19199]; [19199 20088]; ...
%     [20088 21744]; [21744 22577]; [22577 23770]; [23770 25859]; ...
%     [25859 26840]; [26840 27840]; [27840 28600]; [28600 30120]; ...
%     [30120 30520]; [30520 32125]; [32125 33715]; [33715 34464]; ...
%     [34464 35843]; [35843 37556]; [37556 38605]];
% 
% target2 = char('sh', 'iy', 'eh', 'dcl', 'd', 'y', 'ix', 'dcl', 'd', 'aa', ...
%     'r', 'kcl', 'k', 's', 'ux', 'tcl', 'en', 'gcl', 'g', 'r', 'iy', 's', ...
%     'ix', 'w', 'aa', 'sh', 'epi', 'w', 'aa', 'dx', 'er', 'ao', 'l', 'y', ...
%     'ih', 'ah');
% 
% target2 = cellstr(target2);
% 
% patterns2 = [];
% for k=1:length(sampleIndices2)
%     indices = sampleIndices2(k,:);
%     sample = dontSample2(indices(1):indices(2));
%     pattern2 = fft(sample, 300);
%     patterns2 = [patterns2; real(pattern2)];
% end
% 
% phones2 = unique(target2);
% numPhones2 = length(phones2);
% targets2 = [];
% for k=1:length(target2)
%    output = zeros(1, numPhones2);
%    for j=1:numPhones2
%        if strcmp(target2{k}, phones2{j})
%            output(j) = 1;
%            targets2(end + 1,:) = output;
%        else
%            continue
%        end
%    end
% end

