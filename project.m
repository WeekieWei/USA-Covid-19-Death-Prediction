clear, close all
clc

% import dataset and specify input and output columns
[a,b,c] = xlsread('data.xlsx');
input = a(:,1:3);
output = a(:,4);

% seperate data into training and testing set, 8 : 2 ratio
trainingdata = a(1:145,:);
testingdata = a(146:181,:);

% specify input and output of training set
input_train_data = trainingdata(:,1:3);
output_train_data = trainingdata(:,4);

% specify input and output of testing set
input_test_data = testingdata(:,1:3);
output_test_data = testingdata(:,4);

% building regressor for training set using 14 delay
psi_train1x = input_train_data(1:131,:);
psi_train2x = input_train_data(2:132,:);
psi_train3x = input_train_data(3:133,:);
psi_train4x = input_train_data(4:134,:);
psi_train5x = input_train_data(5:135,:);
psi_train6x = input_train_data(6:136,:);
psi_train7x = input_train_data(7:137,:);
psi_train8x = input_train_data(8:138,:);
psi_train9x = input_train_data(9:139,:);
psi_train10x = input_train_data(10:140,:);
psi_train11x = input_train_data(11:141,:);
psi_train12x = input_train_data(12:142,:);
psi_train13x = input_train_data(13:143,:);
psi_train14x = input_train_data(14:144,:);
psi_train1y = output_train_data(1:131,:);
psi_train2y = output_train_data(2:132,:);
psi_train3y = output_train_data(3:133,:);
psi_train4y = output_train_data(4:134,:);
psi_train5y = output_train_data(5:135,:);
psi_train6y = output_train_data(6:136,:);
psi_train7y = output_train_data(7:137,:);
psi_train8y = output_train_data(8:138,:);
psi_train9y = output_train_data(9:139,:);
psi_train10y = output_train_data(10:140,:);
psi_train11y = output_train_data(11:141,:);
psi_train12y = output_train_data(12:142,:);
psi_train13y = output_train_data(13:143,:);
psi_train14y = output_train_data(14:144,:);

psi_train = [psi_train1x, psi_train2x, psi_train3x, psi_train4x,...
    psi_train5x, psi_train6x, psi_train7x, psi_train8x, psi_train9x,...
    psi_train10x, psi_train11x, psi_train12x, psi_train13x, psi_train14x,...
    psi_train1y, psi_train2y, psi_train3y, psi_train4y,...
    psi_train5y, psi_train6y, psi_train7y, psi_train8y, psi_train9y,...
    psi_train10y, psi_train11y, psi_train12y, psi_train13y, psi_train14y]';

psi_train_output = output_train_data(15:145)';

% % create and train neural network
% hidden = 12;
% net = feedforwardnet(hidden);
% net.trainFcn = 'trainbr';
% net.trainParam.epochs = 2000;
% net = train(net, psi_train, psi_train_output);

% load previously saved neural network
load br12_3;
net = br12_3;

% reapply train data into learned network for validation
ysimulate = net(psi_train);
figure(1)
plot(psi_train_output);
hold on
plot(ysimulate, '--g');
hold off
title('Fitting Plot (Training Validation)');
legend('Actual Death Cases', 'Predicted Death Cases');

% building regressor for testing set using 14 delay
psi_test1x = input_test_data(1:22,:);
psi_test2x = input_test_data(2:23,:);
psi_test3x = input_test_data(3:24,:);
psi_test4x = input_test_data(4:25,:);
psi_test5x = input_test_data(5:26,:);
psi_test6x = input_test_data(6:27,:);
psi_test7x = input_test_data(7:28,:);
psi_test8x = input_test_data(8:29,:);
psi_test9x = input_test_data(9:30,:);
psi_test10x = input_test_data(10:31,:);
psi_test11x = input_test_data(11:32,:);
psi_test12x = input_test_data(12:33,:);
psi_test13x = input_test_data(13:34,:);
psi_test14x = input_test_data(14:35,:);
psi_test1y = output_test_data(1:22,:);
psi_test2y = output_test_data(2:23,:);
psi_test3y = output_test_data(3:24,:);
psi_test4y = output_test_data(4:25,:);
psi_test5y = output_test_data(5:26,:);
psi_test6y = output_test_data(6:27,:);
psi_test7y = output_test_data(7:28,:);
psi_test8y = output_test_data(8:29,:);
psi_test9y = output_test_data(9:30,:);
psi_test10y = output_test_data(10:31,:);
psi_test11y = output_test_data(11:32,:);
psi_test12y = output_test_data(12:33,:);
psi_test13y = output_test_data(13:34,:);
psi_test14y = output_test_data(14:35,:);
 
psi_test = [psi_test1x, psi_test2x, psi_test3x, psi_test4x,...
    psi_test5x, psi_test6x, psi_test7x, psi_test8x, psi_test9x,...
    psi_test10x, psi_test11x, psi_test12x, psi_test13x, psi_test14x,...
    psi_test1y, psi_test2y, psi_test3y, psi_test4y,...
    psi_test5y, psi_test6y, psi_test7y, psi_test8y, psi_test9y,...
    psi_test10y, psi_test11y, psi_test12y, psi_test13y, psi_test14y]';
 
psi_test_output = output_test_data(15:36)';

% apply test data into trained neural network to test performance of
% trained network
ysimulate_test = net(psi_test);

figure(2)
plot(psi_test_output);
hold on
plot(ysimulate_test, '--r');
hold off
title('One Step Ahead Test');
legend('Actual Death Cases', 'Predicted Death Cases');

figure(3)
plot(ysimulate - psi_train_output);
title('Residual Plot (Training)');

figure(4)
plot(ysimulate_test - psi_test_output);
title('Residual Plot (Testing)');

MSE_training = mse(ysimulate - psi_train_output)

MSE_test = mse(ysimulate_test - psi_test_output)

figure(5)
histogram(ysimulate - psi_train_output);
title('Histogram Plot (Training)');

figure(6)
histogram(ysimulate_test - psi_test_output);
title('Histogram Plot (Testing)');

figure(7)
autocorr(ysimulate - psi_train_output);
title('Autocorrelation Plot (Training)');

figure(8)
autocorr(ysimulate_test - psi_test_output);
title('Autocorrelation Plot (Testing)');
