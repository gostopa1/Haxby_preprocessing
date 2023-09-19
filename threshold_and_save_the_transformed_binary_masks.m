%% This script loads the binary masks after the FLIRT transformation, 
%% thresholds them to 0.5 and saves the new masks that include only 0s and 1s

prefix1='./ds105/'
addpath ./bramila/external/niftitools/

thr=0.5
currentfolder=pwd;
res1=dir([prefix1 'sub*']);
lres1=length(res1);
display('Binarizing transformed masks...');
for res1i=1:lres1
    display(['Subject number ' num2str(res1i) ' out of ' num2str(lres1)])
    filename=[ currentfolder '/ds105/' res1(res1i).name '/anatomy/brain_mask_epi_dims.nii'];
    
    nii=load_nii(filename);
    
    nii.img=nii.img>thr;
    
    
    save_nii(nii,filename);

end