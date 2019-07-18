% This make.m is for MATLAB and OCTAVE under Windows, Mac, and Unix

try
	Type = ver;
	% This part is for OCTAVE
	if(strcmp(Type(1).Name, 'Octave') == 1)
		mex libsvmread.c
		mex libsvmwrite.c
		mex svmtrain.c ../svm.cpp svm_model_matlab.c
		mex svmpredict.c ../svm.cpp svm_model_matlab.c
	% This part is for MATLAB
	% Add -largeArrayDims on 64-bit machines of MATLAB
	else
		mex CFLAGS="\$CFLAGS -std=c99" -lgomp -largeArrayDims libsvmread.c
		mex CFLAGS="\$CFLAGS -std=c99" -lgomp -largeArrayDims libsvmwrite.c
		mex CFLAGS="-fopenmp \$CFLAGS -std=c99 " LDFLAGS="-fopenmp \$LDFLAGS" CXXOPTIMFLAGS="\$CXXOPTIMFLAGS -fopenmp" -lgomp -largeArrayDims svmtrain.c ../svm.cpp svm_model_matlab.c
		mex CFLAGS="\$CFLAGS -std=c99 -fopenmp" LDFLAGS="\$LDFLAGS -fopenmp" CXXOPTIMFLAGS="\$CXXOPTIMFLAGS -fopenmp" -lgomp -largeArrayDims svmpredict.c ../svm.cpp svm_model_matlab.c
		%mex CFLAGS="\$CFLAGS -std=c99" LDFLAGS="\$LDFLAGS -fopenmp" libsvmloadmodel.c ../svm.cpp svm_model_matlab.c -I../
	end
catch
	fprintf('If make.m fails, please check README about detailed instructions.\n');
end
