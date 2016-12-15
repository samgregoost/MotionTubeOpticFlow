S = '/home/sameera/Documents/Mphil/Datasets/UCF11_updated_mpg/diving/';
matPath = '/media/sameera/VERBATIM HD/Mphil/IEEJournel/MotionTubes/Untitled Folder/';
savePath = '/home/sameera/Documents/Mphil/OpticFlowCreation/diving/';

dirinfo = dir(S);
%dirinfo(~[dirinfo.isdir]) = [];

subdirinfo = cell(length(dirinfo));
for K = 1 : length(dirinfo)
  thisdir = dirinfo(K).name;
  nameLength = size(thisdir,2)
  
   if nameLength > 3
     m =  dir(fullfile(strcat(S,thisdir), '*.mpg'))
     
     for j=1:length(m)
         try
               videoName = strcat(S,thisdir,'/',m(j).name);
         matName = strcat(matPath,m(j).name(1:end-4));
         matName = strcat(matName,'.mat')
        % CreatePoticFlows(tubeCell, videoName,8,'test2');
        fileExists = exist(matName,'file');
        emptyIndexes = [];
        count = 0;
        if(fileExists == 2)
        tube = load(matName);
        tubeArray = tube.tubeCell;
        tubeArray = tubeArray(~cellfun('isempty',tubeArray)) ;
        
        
        tubeLength = length(tubeArray);
        
        CreatePoticFlows(tubeArray, videoName,tubeLength,strcat(savePath,m(j).name))
        end

         catch
         end
         
       
     end
   end
end

