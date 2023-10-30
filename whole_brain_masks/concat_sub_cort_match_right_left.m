clear

if exist('mms')
else
    mms='4mm';
end
load(['anatomical_weights_cort_' mms '.mat']);
W1=W; region_names1=region_names;
load(['anatomical_weights_sub_' mms '.mat']);
W2=W; region_names2=region_names;

%% Remove first the overlaps (e.g. cortex from the subcortical)

index=1;
for i=1:length(region_names2)
    
    ind=strfind(region_names2{i},'Left '); % Is this the left part?
    if ~isempty(ind) % If it is, find also the right part and concatenate them
        
       strfind(region_names2,region_names2{i}(6:end));
       coninds=find(~cellfun(@isempty,strfind(region_names2,region_names2{i}(6:end))));
       
       W2new(:,index)=mean(W2(:,coninds)');
       region_names2_new{index}=region_names2{i}(6:end);
    elseif isempty(strfind(region_names2{i},'Right ')) % If it not the left nor the right, then it is an individual area, keep it as it is
        region_names2_new{index}=region_names2{i};
        W2new(:,index)=W2(:,i);
        
    end
    
    if isempty(strfind(region_names2{i},'Right '))
        
        index=index+1;
    end
end

W=[W1 W2];
region_names=[region_names1 ; region_names2];
save(['anatomical_weights_both_' mms '_all.mat'],'W','region_names');
W2=W2new; region_names2=region_names2_new';



%%
W=[W1 W2];
region_names=[region_names1 ; region_names2];

save(['anatomical_weights_both_' mms '.mat'],'W','region_names')