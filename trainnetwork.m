x = patterns';
t = targets';

% Create a Pattern Recognition Network
hiddenLayerSize = [100 100 29];
net = patternnet(hiddenLayerSize);
net.performFcn = 'crossentropy';
net.trainParam.epochs = 100000;
net.trainFcn = 'trainscg';

% Setup Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;


% Train the Network
[net,tr] = train(net,x,t);

% Test the Network
y = net(x);
e = gsubtract(t,y);
tind = vec2ind(t);
yind = vec2ind(y);
percentErrors = sum(tind ~= yind)/numel(tind);
performance = perform(net,t,y)
    
plotperf(tr)

view(net)

