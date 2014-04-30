pattern = load('dr1.dat');
target = loadcell('dr1phones.labels');

phones = unique(target);

numPhones = length(phones);

forUse = zeros(1, numPhones);

for k=1:length(target)
   for j=1:numPhones
       if strcmp(target{k}, phones{j});
           forUse(j) = forUse(j) + 1;
       else
           continue
       end
   end
end

for z=1:numPhones
    if forUse(z) > 50;
        forUse(z) = 1;
    else
        forUse(z) = 0;
    end
end

targets = [];
patterns = [];

for k=1:length(target)
   output = zeros(1, numPhones);
   for j=1:numPhones
       if and(strcmp(target{k}, phones{j}), (forUse(j) == 1));
           output(j) = 1;
           targets(end + 1,:) = output;
           patterns = [patterns; pattern(k,:)];
       else
           continue
       end
   end
end