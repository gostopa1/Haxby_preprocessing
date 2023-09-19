%% Add first the module for fsl by running the command
%                   source $FSLDIR/etc/fslconf/fsl.sh

clear a b
prefix1='./ds105/'

[~,fsldir]=system('echo $FSLDIR');
fsldir=fsldir(1:(end-1));
currentfolder=pwd;
res1=dir([prefix1 'sub*']);
lres1=length(res1);
display('Transforming anatomical binary mask to dimensions of EPI image...');
for res1i=1:lres1
    display(['Transforming subject number ' num2str(res1i) ' out of ' num2str(lres1)])
    
    command1=['flirt -in ' currentfolder '/ds105/' res1(res1i).name '/anatomy/highres001_brain_mask.nii.gz -applyxfm -init ' fsldir '/etc/flirtsch/ident.mat  -out ' currentfolder '/ds105/' res1(res1i).name '/anatomy/brain_mask_epi_dims.nii -paddingsize 0.0 -interp trilinear -ref ' currentfolder '/ds105/' res1(res1i).name '/BOLD/task001_run001/bold.nii'];
    log1=system(command1);
    command2=['gzip -d -f ' currentfolder '/ds105/' res1(res1i).name '/anatomy/brain_mask_epi_dims.nii.gz'];
    log2=system(command2); 
end