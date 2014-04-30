
meh = y';

topthrees = [];
for k=1:length(meh)
    stuff = meh(k,:);
    sorted = sort(stuff, 'descend');
    tthree = [];
    for j=1:numPhones
        if stuff(j) == sorted(1)
            tthree = [tthree; j];
        elseif stuff(j) == sorted(2)
            tthree = [tthree; j];
        elseif stuff(j) == sorted(3)
            tthree = [tthree; j];
        end
    end
    for j=1:numPhones
        if targets(k,j) == 1
            tthree = [tthree; j];
        end
    end
    topthrees(end+1,:)= tthree;
end

right = 0;

for z=1:length(topthrees)
    if topthrees(z,1) == topthrees(z,4)
        right = right + 1;
    elseif topthrees(z,2) == topthrees(z,4)
        right = right + 1;
    elseif topthrees(z,3) == topthrees(z,4)
        right = right + 1;
    end
end
