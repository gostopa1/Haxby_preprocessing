if exist('mms')
else
    mms='8mm';
end
load(['anatomical_weights_cort_' mms '.mat']);
W1=W; region_names1=region_names;
load(['anatomical_weights_sub_' mms '.mat']);
W2=W; region_names2=region_names;



W=[W1 W2];
region_names=[region_names1 ; region_names2];

save(['anatomical_weights_both_' mms '.mat'],'W','region_names')