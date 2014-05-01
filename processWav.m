
[dontSample, Fs] = audioread('SA2.wav');

dontSample = dontSample';

sampleIndices = [[2282 2680]; [2680 4072]; [4072 4668]; [4668 6892]; ...
    [6892 7854]; [7854 8760]; [8760 9451]; [9451 10151]; ...
    [10151 10610]; [10610 11240]; [11240 11822]; [11822 13080]; ...
    [13080 13869]; [13869 15456]; [15456 16375]; [16375 17185]; ...
    [17185 19550]; [19550 20216]; [20216 21806]; [21806 22892]; ...
    [22892 25357]; [25357 25950]; [25950 26217]; [26217 26900]; ...
    [26900 28120]; [28120 29451]; [29451 29800]; [29800 32200]; ...
    [32200 33587]];

target = char('d', 'ow', 'n', 'ae', 's', 'kcl', 'm', 'ix', 'dx', 'ix', ...
    'kcl', 'k', 'eh', 'r', 'ix', 'n', 'ao', 'l', 'iy', 'r', 'ae', 'gcl', ...
    'g', 'l', 'ay', 'kcl', 'dh', 'ae', 'tcl');

target = cellstr(target);
    
patterns = [];
for k=1:length(sampleIndices)
    indices = sampleIndices(k,:);
    sample = dontSample(indices(1):indices(2));
    pattern = fft(sample, 300);
    patterns = [patterns; real(pattern)];
end

[dontSample2, Fs] = audioread('SA1.wav');

dontSample2 = dontSample2';

sampleIndices2 = [[2520 3727]; [3727 4971]; [4971 5830]; [5830 6452]; ...
    [6452 6719]; [6719 7066]; [7066 7681]; [7681 8570]; [8570 8810]; ...
    [8810 10569 ]; [10569 11146]; [11146 12000]; [12000 12320]; ...
    [12320 13911]; [13911 15610]; [15610 16130]; [16130 17388]; ...
    [17388 18090]; [18090 18529]; [18529 19199]; [19199 20088]; ...
    [20088 21744]; [21744 22577]; [22577 23770]; [23770 25859]; ...
    [25859 26840]; [26840 27840]; [27840 28600]; [28600 30120]; ...
    [30120 30520]; [30520 32125]; [32125 33715]; [33715 34464]; ...
    [34464 35843]; [35843 37556]; [37556 38605]];

target2 = char('sh', 'iy', 'eh', 'dcl', 'd', 'y', 'ix', 'dcl', 'd', 'aa', ...
    'r', 'kcl', 'k', 's', 'ux', 'tcl', 'en', 'gcl', 'g', 'r', 'iy', 's', ...
    'ix', 'w', 'aa', 'sh', 'epi', 'w', 'aa', 'dx', 'er', 'ao', 'l', 'y', ...
    'ih', 'ah');

target2 = cellstr(target2);

patterns2 = [];
for k=1:length(sampleIndices2)
    indices = sampleIndices2(k,:);
    sample = dontSample2(indices(1):indices(2));
    pattern2 = fft(sample, 300);
    patterns2 = [patterns2; real(pattern2)];
end

phones2 = unique(target2);
numPhones2 = length(phones2);
targets2 = [];
for k=1:length(target2)
   output = zeros(1, numPhones2);
   for j=1:numPhones2
       if strcmp(target2{k}, phones2{j})
           output(j) = 1;
           targets2(end + 1,:) = output;
       else
           continue
       end
   end
end

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





