mkdir('masks')
prefix_dir='/usr/share/fsl/5.0/data/standard/'; % in dione
prefix_dir='/m/nbe/scratch/braindata/gostopa1/Atlases/HarvardOxford/'; % in jouni
type='cort'
filename=['HarvardOxford-' type '-prob-2mm.nii'];

copyfile([prefix_dir filename],'./atlases/')
copyfile([prefix_dir 'txt' upper(type(1)) type(2:end) '.txt'],['./atlases/' type '.txt'])


%system(['gunzip -f  ./masks/' filename ])
prefix='atlases/'
mms='2mm';
copyfile([prefix filename(1:(end-4)) '.nii'],[prefix 'atlas_' type '_' mms '.nii' ])
%%
mmsvec={'2mm','4mm','8mm','16mm','32mm','64mm'};

for mmsi=1:(length(mmsvec)-1)
    mms=mmsvec{mmsi};
%system(['fslmaths  ' './atlases/atlas_' mms '.nii' ' -subsamp2'  ' -thr 0.5 -bin ' ' ./atlases/atlas_' mmsvec{mmsi+1} '.nii']);
system(['fslmaths  ' './atlases/atlas_' type '_' mms '.nii' ' -subsamp2'   ' ./atlases/atlas_' type '_' mmsvec{mmsi+1} '.nii']);

end
%fileout=['mask_' mms]

system(['gunzip -f  ./atlases/*.gz'  ])