% clear all

% cd
% load E:\PHD\My_codes\aerial_dataset\krp_fs\github\train_and_test_svm_FS_workspace.mat %******************************************************


 fprintf('training SVM \n');
        
    if ~isempty(train_imdata{1})
        P_tr_imdata =  P_tr_imdata_fwd; % + P_tr_imdata_bck; 
        P_te_imdata =  P_te_imdata_fwd; % + P_te_imdata_bck; 
    else
        P_tr_imdata = 0;
        P_te_imdata = 0;
    end

    if ~isempty(train_imflow{1})
        P_tr_imflow =  P_tr_imflow_fwd; % + P_tr_imflow_bck; 
        P_te_imflow =  P_te_imflow_fwd; % + P_te_imflow_bck;
    else
        P_tr_imflow = 0;
        P_te_imflow = 0;
    end

    assert(~isempty(train_imdata{1}) || ~isempty(train_imflow{1}))
    
    params = ' ';        
    params = [params, ' ']; 
    pos_C = 16; g1 = 4;
            
    K_train = [(1:length(train_labels))',  P_tr_imflow + P_tr_imdata/g1]; 
    K_test = [(1:length(test_labels))',    P_te_imflow + P_te_imdata/g1]; 

model = svmtrain(train_labels', sparse(double(K_train)), ['-q -t 4 -c ' num2str(pos_C) params]);
