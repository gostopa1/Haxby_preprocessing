addpath(genpath('./bramila/external/niftitools/'))
clear
prefix='haxby_dataset/';
mms='32mm';
mask_filename=['./whole_brain_masks/masks/mask_' mms '.nii'];
mask=load_nii(mask_filename)
inds=find(mask.img>0.5);

TR=2.5;
notps=5;

mmsmat={'32mm','16mm','8mm','4mm'}
for mmsi = mmsmat
    mms = mmsi{1}
    %%
    subj=0;
    for subi=[1 2 3 4 5 6]
        subj=subj+1;
        for runi=1:11
            runi
            prefix1=sprintf('%soutput/%.3d_%.3d/',prefix,subi,runi);
            epifilename=sprintf('%sepi%s.nii',prefix1,mms);
            nii=load_nii(epifilename);

            temp=permute(nii.img,[4 1 2 3]);
            temp2=zscore(temp(:,inds));

            for cond=1:8

                prefix2=sprintf('./ds105/sub%.3d/model/model001/onsets/task001_run%.3d',subi,runi);
                a=load([prefix2 sprintf('/cond%.3d.txt',cond)]);
                for ai=1:size(a,1)
                    index=unique(floor(a(ai,1)/TR));
                    temp3=repmat(temp2,2,1);
                    %D(cond,1,subi,runi,:,:)=temp2(index:(index+notps-1),:)';
                    D(cond,subj,runi,ai,:,:)=temp3(index:(index+notps-1),:)';
                end
            end

        end
    end
    display('Saving data...')
    mkdir data
    save(['./data/Haxby_' mms '.mat'],'D','-v7.3')
    display('Saved!')

end

%%

