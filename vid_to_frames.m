clear all, close all

vidpath = 'E:\Datasets\MVOA20\dataset';
savepath = 'E:\Datasets\MVOA20\dataset_images';
video_names = dir(vidpath);
video_names={video_names.name};
video_names=video_names(~ismember(video_names,{'.','..'}));
nb_vid = length(video_names);

for vi = 1:nb_vid
    vidname = video_names{vi};
    subvideo_names = dir(sprintf('%s/%s',vidpath,vidname));
    subvideo_names = {subvideo_names.name};
    subvideo_names = subvideo_names(~ismember(subvideo_names,{'.','..'}));
    subnb_vid = length(subvideo_names);
    
    for subvi = 1:subnb_vid
        
        subvidpath = strcat(vidpath,'\',vidname,'\',subvideo_names{subvi});
        vid=VideoReader(subvidpath);
        numFrames = vid.NumberOfFrames;
        n=numFrames;
        
        classname = strcat(savepath,'\',vidname);
        clipname = strcat(classname,'\',vid.Name(1:end-4));
        
        if ~exist(classname,'dir'); mkdir(classname); end
        if ~exist(clipname,'dir'); mkdir(clipname); end
        
        strcat(vidname,'....',vid.Name(1:end-4)), newline;
        
        for j = 1:n
            frames = read(vid,j);
            path = strcat(clipname,'\',[int2str(j), '.png']);
            frames = imresize(frames, [224 224]);
            imwrite(frames,path);
        end
    end
    
end