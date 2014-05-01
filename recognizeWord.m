function [] = recognizeWord( filename, net)
%RECOGNIZEWORD Summary of this function goes here
%   Detailed explanation goes here

    [sampleRecog, Fs] = audioread(filename);
    
    sms = Fs / 1000;
    
    iter = 1;
    patterns = [];
    while iter < 32
        index1 = (iter-1)*20*sms;
        if index1 == 0
            index1 = 1;
        end
        index2 = (iter)*20*sms;
        sample = sampleRecog(index1:index2);
        pattern = fft(sample, 300);
        patterns = [patterns real(pattern)];
        iter = iter+1;
    end
    
    %[E R] = size(patterns)
    output = net(patterns);
        
    dlmwrite('net_output_size.txt', [length(output')])
    dlmwrite('net_output.txt', output', ' ');
end

