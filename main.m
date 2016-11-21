S = '/home/sameera/Documents/Mphil/Datasets/UCF11_updated_mpg/biking/';
matPath = '/media/sameera/VERBATIM HD/Mphil/IEEJournel/MotionTubes/Untitled Folder/';
savePath = '/home/sameera/Documents/Mphil/OpticFlowCreation/OpticFlows/';

dirinfo = dir(S);
%dirinfo(~[dirinfo.isdir]) = [];

subdirinfo = cell(length(dirinfo));
for K = 1 : length(dirinfo)
  thisdir = dirinfo(K).name;
  nameLength = size(thisdir,2)
  
   if nameLength > 3
     m =  dir(fullfile(strcat(S,thisdir), '*.mpg'))
     
     for j=1:length(m)
         videoName = strcat(S,thisdir,'/',m(j).name);
         matName = strcat(matPath,m(j).name(1:end-4));
         matName = strcat(matName,'.mat')
        % CreatePoticFlows(tubeCell, videoName,8,'test2');
        fileExists = exist(matName,'file');
        
        if(fileExists == 2)
        tube = load(matName);
        tubeArray = tube.tubeCell;
        for i = 1:length(tube.tubeCell)
            mat = tube.tubeCell{i};
            if(isempty(mat))
                tubeArray(i)=[];
            end
        end
        tubeLength = length(tubeArray);
        
        CreatePoticFlows(tubeArray, videoName,tubeLength,strcat(savePath,m(j).name))
        end

     end
   end
end

