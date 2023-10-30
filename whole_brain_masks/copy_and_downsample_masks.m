mkdir('masks')
prefix_dir='/usr/share/fsl/5.0/data/standard/'; % in dione
prefix_dir='/share/apps/fsl/5.0.9/fsl/data/standard/'; % in jouni
filename='MNI152_T1_2mm_brain_mask.nii.gz';
copyfile([prefix_dir filename],'./masks')


system(['gunzip -f  ./masks/' filename ])
prefix='masks/'
mms='2mm';
copyfile([prefix filename(1:(end-3))],[prefix 'mask_' mms '.nii' ])
%%
mmsvec={'2mm','4mm','8mm','16mm','32mm','64mm'};

for mmsi=1:(length(mmsvec)-1)
    mms=mmsvec{mmsi};
system(['fslmaths  ' './masks/mask_' mms '.nii' ' -subsamp2'  ' -thr 0.5 -bin ' ' ./masks/mask_' mmsvec{mmsi+1} '.nii']);

end
%fileout=['mask_' mms]

system(['gunzip -f  ./masks/*.gz'  ])