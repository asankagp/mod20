# MOD20 - A Multi-viewpoint Outdoor Dataset for Human Action Recognition

Project website: https://asankagp.github.io/mod20/


### How to run the code:

1. Download the FLOW and RGB data [here](https://drive.google.com/open?id=1MXcBfKPbtOoEX_j6vGkopBKnyktpDh0l)(5GB), and extract all ".mat" files to "data" folder.

2. Run "demo_krp_mod20.m".

3. This code requires liblinear 2.30 and libsvm 3.14. They are included in ".\tools\svm\".

3. This code was tested with MATLAB R2018b and Windows 10. If you are using Linux, for the classification part, change the libsvm path to corresponding ".mexa64" files. Default path is for Windows files: "svmtrain.mexw64" and "svmpredict.mexw64".

4. If you want to extract images from the videos, use "vid_to_frames.m" file. The default image size is 224x224 and the format is ".png". The complete image dataset takes 38GB of space.

