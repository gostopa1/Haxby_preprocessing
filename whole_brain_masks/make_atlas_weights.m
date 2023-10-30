clear
addpath('../MATLAB_scripts/nifti/')
mms='4mm'
for typei={'cort','sub'}
    
    type=typei{1}
    nii=load_nii(['./atlases/atlas_' type '_' mms '.nii'])
    mask=load_nii(['./masks/mask_' mms '.nii'])
    
    %view_nii(nii)
    clear W
    region_number=size(nii.img,4)
    inds=find(mask.img==1);
    W=zeros(length(inds),region_number);
    
    size(mask.img)
    
    for regioni=1:region_number
        %mask.img.*nii.img(:,:,:,regioni)
        
        temp=nii.img(:,:,:,regioni);
        W(:,regioni)=temp(inds)/sum(temp(inds));
    end
    region_names=importdata(['atlases/' type '.txt']);
    imagesc(W)
    %W=W/max(W);
    if strcmp(type,'sub') % In subcortical it has also regions defined as white matter, cerebral cortex and ventricals. This removes them
        inds_to_keep=1:length(region_names);
        inds_to_keep=setxor([1:3 12:14],1:length(region_names)); %% Comment this to keep white matter, cerebral cortex and ventricles.
        W=W(:,inds_to_keep);
        region_names=region_names(inds_to_keep);

    end
    save(['anatomical_weights_' type '_' mms '.mat'],'W','region_names')
end
%concat_sub_cort
concat_sub_cort_match_right_left
