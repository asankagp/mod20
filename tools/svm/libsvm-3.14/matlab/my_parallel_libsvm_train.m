% unfortunately parallel svm train doesnt seem to work from matlab. so we
% need to call the commandline one. This wrapper calls the svm-train
% directly.
[a,b]=libsvmread('../ijcnn1');
model=svmtrain(a,b,'-c 10 -g 2');

%{
function model = my_parallel_libsvm_train(labels, features, params)
    random_str = strrep(strrep(num2str(clock),' ',''),'.','');
    svm_train = ['/home/lear/cherian/projects/tools/svm/libsvm-3.14/' 'svm-train'];
    train_file = ['/tmp/' random_str '.train'];
    model_file = ['/tmp/' random_str '.model'];
    libsvmwrite(train_file, labels, features);
    system([svm_train ' ' params ' ' train_file ' ' model_file]); % call the system function svm-train.
    model = libsvmloadmodel(model_file, size(features,2));    
    try
       delete(train_file);     
       delete(model_file);
    catch
    end
end
%}